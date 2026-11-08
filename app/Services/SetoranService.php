<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

/**
 * Input setoran sampah massal. Hitungan identik dengan form lama:
 *   total_income   = round(berat * price_per_kg)
 *   point_received = round(berat * poin_per_kg)
 * Saldo ditambah lewat SaldoService (terkunci + tercatat di ledger saldo_mutasi).
 */
class SetoranService
{
    const MAKS_BARIS = 200;
    const MAKS_BERAT = 100000; // kg per baris (pengaman salah ketik)

    private $saldo;

    public function __construct(SaldoService $saldo)
    {
        $this->saldo = $saldo;
    }

    /** Cari nasabah milik BSU: nama pengguna, email, no. HP, atau ID nasabah. */
    public function cariNasabah($adminId, $q, $limit = 15)
    {
        $q = trim((string) $q);
        $query = DB::table('users')->where('cms_user_id', $adminId)
            ->select('id', 'username', 'email', 'phone_number', 'address');
        if ($q !== '') {
            $like = '%' . str_replace(['%', '_'], ['\%', '\_'], $q) . '%';
            $query->where(function ($w) use ($like, $q) {
                $w->where('username', 'like', $like)->orWhere('email', 'like', $like)
                  ->orWhere('phone_number', 'like', $like);
                if (ctype_digit($q)) {
                    $w->orWhere('id', (int) $q);
                }
            });
        }
        return $query->orderBy('username')->limit($limit)->get();
    }

    /** Baris setoran terakhir seorang nasabah (untuk "salin transaksi sebelumnya"). */
    public function salinTerakhir($adminId, $userId)
    {
        $tgl = DB::table('transactions')->where('admin_id', $adminId)->where('user_id', $userId)
            ->max(DB::raw('DATE(created_at)'));
        if (!$tgl) {
            return ['tanggal' => null, 'baris' => []];
        }
        $rows = DB::table('transactions')->where('admin_id', $adminId)->where('user_id', $userId)
            ->whereRaw('DATE(created_at) = ?', [$tgl])
            ->select('sampah_id', DB::raw('SUM(total_weight) as berat'))
            ->groupBy('sampah_id')->get();
        $aktif = DB::table('sampah')->where('admin_id', $adminId)->pluck('id')->all();
        $baris = [];
        foreach ($rows as $r) {
            if (in_array($r->sampah_id, $aktif)) {
                $baris[] = ['sampah_id' => (int) $r->sampah_id, 'berat' => (float) $r->berat];
            }
        }
        return ['tanggal' => $tgl, 'baris' => $baris];
    }

    /**
     * @param array $baris  [['user_id'=>, 'sampah_id'=>, 'berat'=>], ...]
     * @return array [jumlah, total_berat, total_rupiah, total_poin, ids]
     */
    public function simpan($adminId, $tanggal, array $baris, $actorId = null, $token = null)
    {
        if ($token && !Cache::add('setoran_massal:' . $adminId . ':' . $token, 1, 600)) {
            throw new InvalidArgumentException('Data ini sudah disimpan (kemungkinan tombol simpan tertekan dua kali).');
        }
        try {
            return $this->prosesSimpan($adminId, $tanggal, $baris, $actorId);
        } catch (\Throwable $e) {
            if ($token) {
                Cache::forget('setoran_massal:' . $adminId . ':' . $token); // gagal -> boleh dicoba lagi
            }
            throw $e;
        }
    }

    private function prosesSimpan($adminId, $tanggal, array $baris, $actorId)
    {
        $tgl = Carbon::parse($tanggal ?: today());
        if ($tgl->isFuture() && !$tgl->isToday()) {
            throw new InvalidArgumentException('Tanggal setoran tidak boleh di masa depan.');
        }
        if (count($baris) < 1) {
            throw new InvalidArgumentException('Belum ada baris setoran.');
        }
        if (count($baris) > self::MAKS_BARIS) {
            throw new InvalidArgumentException('Maksimal ' . self::MAKS_BARIS . ' baris per simpan.');
        }

        $hasil = ['jumlah' => 0, 'total_berat' => 0.0, 'total_rupiah' => 0, 'total_poin' => 0, 'ids' => []];
        $waktu = $tgl->isToday() ? now() : $tgl->copy()->setTime(12, 0, 0);

        DB::transaction(function () use ($adminId, $tgl, $baris, $actorId, $waktu, &$hasil) {
            foreach ($baris as $i => $b) {
                $no = $i + 1;
                $userId = (int) ($b['user_id'] ?? 0);
                $sampahId = (int) ($b['sampah_id'] ?? 0);
                $berat = round((float) str_replace(',', '.', (string) ($b['berat'] ?? 0)), 2);

                if ($berat <= 0 || $berat > self::MAKS_BERAT) {
                    throw new InvalidArgumentException("Baris $no: berat harus lebih dari 0 dan wajar.");
                }
                $user = DB::table('users')->where('id', $userId)->where('cms_user_id', $adminId)->first();
                if (!$user) {
                    throw new InvalidArgumentException("Baris $no: nasabah tidak ditemukan di BSU Anda.");
                }
                $sampah = DB::table('sampah')->where('id', $sampahId)->where('admin_id', $adminId)->first();
                if (!$sampah) {
                    throw new InvalidArgumentException("Baris $no: jenis sampah tidak ditemukan di BSU Anda.");
                }

                $income = (int) round($berat * $sampah->price_per_kg);
                $poin = (int) round($berat * $sampah->poin_per_kg);

                $id = DB::table('transactions')->insertGetId([
                    'user_id' => $userId, 'admin_id' => $adminId, 'sampah_id' => $sampahId,
                    'total_weight' => $berat, 'price_per_kg' => (int) $sampah->price_per_kg,
                    'poin_per_kg' => (int) $sampah->poin_per_kg,
                    'total_income' => $income, 'point_received' => $poin,
                    'periode' => $tgl->format('d/m/Y'),
                    'created_at' => $waktu, 'updated_at' => $waktu,
                ]);

                $p = DB::table('points')->where('user_id', $userId)->lockForUpdate()->first();
                if ($p) {
                    DB::table('points')->where('id', $p->id)->update([
                        'total_points' => $p->total_points + $poin, 'updated_at' => now(),
                    ]);
                } else {
                    DB::table('points')->insert([
                        'user_id' => $userId, 'total_points' => $poin, 'created_at' => now(), 'updated_at' => now(),
                    ]);
                }
                if ($income > 0) {
                    $this->saldo->credit($userId, $income, 'setor_sampah', 'transaction', $id,
                        'Setor sampah #' . $id . ' (massal)', $actorId);
                }

                $hasil['jumlah']++;
                $hasil['total_berat'] += $berat;
                $hasil['total_rupiah'] += $income;
                $hasil['total_poin'] += $poin;
                $hasil['ids'][] = $id;
            }
        });

        return $hasil;
    }
}
