<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

/** Buku Kas Umum BSU: saldo, laporan harian/bulanan/tahunan, impor penjualan ke BSI. */
class KasService
{
    public function saldo($adminId, $sampaiTanggal = null)
    {
        $q = DB::table('kas_umum')->where('admin_id', $adminId)->whereNull('deleted_at');
        if ($sampaiTanggal) {
            $q->where('tanggal', '<=', $sampaiTanggal);
        }
        $r = $q->selectRaw("COALESCE(SUM(CASE WHEN tipe='masuk' THEN jumlah ELSE 0 END),0) AS masuk,
                            COALESCE(SUM(CASE WHEN tipe='keluar' THEN jumlah ELSE 0 END),0) AS keluar")->first();
        return (int) $r->masuk - (int) $r->keluar;
    }

    public static function rentang($periode, $nilai)
    {
        switch ($periode) {
            case 'harian':
                $d = Carbon::parse($nilai);
                return [$d->copy()->startOfDay(), $d->copy()->endOfDay(), 'Harian ' . $d->format('d/m/Y')];
            case 'bulanan':
                $d = Carbon::createFromFormat('Y-m-d', $nilai . '-01');
                return [$d->copy()->startOfMonth(), $d->copy()->endOfMonth(), 'Bulanan ' . $d->format('m/Y')];
            case 'tahunan':
                $d = Carbon::createFromFormat('Y-m-d', ((int) $nilai) . '-01-01');
                return [$d->copy()->startOfYear(), $d->copy()->endOfYear(), 'Tahunan ' . $d->format('Y')];
        }
        throw new InvalidArgumentException('Periode harus harian, bulanan, atau tahunan.');
    }

    /**
     * @return array [judul, dari, sampai, saldo_awal, masuk, keluar, saldo_akhir, baris[], per_kategori[]]
     * Harian/bulanan: baris = tiap transaksi. Tahunan: baris = ringkasan per bulan.
     */
    public function laporan($adminId, $periode, $nilai)
    {
        [$dari, $sampai, $judul] = self::rentang($periode, $nilai);
        $dariStr = $dari->toDateString();
        $sampaiStr = $sampai->toDateString();

        $saldoAwal = $this->saldo($adminId, $dari->copy()->subDay()->toDateString());

        $data = DB::table('kas_umum as k')
            ->leftJoin('kas_kategori as c', 'c.id', '=', 'k.kategori_id')
            ->where('k.admin_id', $adminId)->whereNull('k.deleted_at')
            ->whereBetween('k.tanggal', [$dariStr, $sampaiStr])
            ->select('k.id', 'k.tanggal', 'k.tipe', 'k.uraian', 'k.jumlah', 'k.bukti', 'c.nama as kategori')
            ->orderBy('k.tanggal')->orderBy('k.id')->get();

        $masuk = (int) $data->where('tipe', 'masuk')->sum('jumlah');
        $keluar = (int) $data->where('tipe', 'keluar')->sum('jumlah');

        $perKategori = [];
        foreach ($data as $r) {
            $key = $r->tipe . '|' . ($r->kategori ?: 'Tanpa kategori');
            if (!isset($perKategori[$key])) {
                $perKategori[$key] = ['tipe' => $r->tipe, 'kategori' => $r->kategori ?: 'Tanpa kategori', 'jumlah' => 0];
            }
            $perKategori[$key]['jumlah'] += (int) $r->jumlah;
        }
        ksort($perKategori);

        $baris = [];
        if ($periode === 'tahunan') {
            $saldo = $saldoAwal;
            for ($m = 1; $m <= 12; $m++) {
                $bulan = sprintf('%04d-%02d', $dari->year, $m);
                $bm = $data->filter(function ($r) use ($bulan) { return substr($r->tanggal, 0, 7) === $bulan; });
                $in = (int) $bm->where('tipe', 'masuk')->sum('jumlah');
                $out = (int) $bm->where('tipe', 'keluar')->sum('jumlah');
                $saldo += $in - $out;
                $baris[] = [
                    'tanggal' => Carbon::createFromFormat('Y-m-d', $bulan . '-01')->translatedFormat('F Y'),
                    'uraian' => $bm->count() . ' transaksi', 'masuk' => $in, 'keluar' => $out, 'saldo' => $saldo,
                ];
            }
        } else {
            $saldo = $saldoAwal;
            foreach ($data as $r) {
                $saldo += $r->tipe === 'masuk' ? (int) $r->jumlah : -(int) $r->jumlah;
                $baris[] = [
                    'tanggal' => Carbon::parse($r->tanggal)->format('d/m/Y'),
                    'uraian' => $r->uraian . ($r->kategori ? ' [' . $r->kategori . ']' : ''),
                    'masuk' => $r->tipe === 'masuk' ? (int) $r->jumlah : 0,
                    'keluar' => $r->tipe === 'keluar' ? (int) $r->jumlah : 0,
                    'saldo' => $saldo,
                ];
            }
        }

        return [
            'judul' => $judul, 'dari' => $dariStr, 'sampai' => $sampaiStr,
            'saldo_awal' => $saldoAwal, 'masuk' => $masuk, 'keluar' => $keluar,
            'saldo_akhir' => $saldoAwal + $masuk - $keluar,
            'baris' => $baris, 'per_kategori' => array_values($perKategori),
        ];
    }

    /**
     * Mencatat penjualan ke BSI (tabel transactions_bsi) yang belum ada di kas sebagai pemasukan.
     * Aman dijalankan berulang (unique admin_id+ref_type+ref_id). Mengembalikan jumlah baris baru.
     */
    public function imporPenjualanBsi($adminId, $userId = null, $mulaiTanggal = null)
    {
        $kategoriId = DB::table('kas_kategori')->whereNull('admin_id')->where('tipe', 'masuk')
            ->where('nama', 'Penjualan sampah ke BSI')->value('id');

        $sudah = DB::table('kas_umum')->where('admin_id', $adminId)->where('ref_type', 'transactions_bsi')
            ->pluck('ref_id')->all();

        $rows = DB::table('transactions_bsi as t')
            ->leftJoin('sampah as s', 's.id', '=', 't.sampah_id')
            ->where('t.admin_id', $adminId)->where('t.total_price', '>', 0)
            ->when($mulaiTanggal, function ($q) use ($mulaiTanggal) { return $q->whereDate('t.created_at', '>=', $mulaiTanggal); })
            ->select('t.id', 't.total_weight', 't.total_price', 't.periode', 't.created_at', 's.name as sampah')
            ->get();

        $n = 0;
        foreach ($rows as $r) {
            if (in_array((string) $r->id, $sudah, true)) {
                continue;
            }
            DB::table('kas_umum')->insert([
                'admin_id' => $adminId,
                'tanggal' => Carbon::parse($r->created_at)->toDateString(),
                'tipe' => 'masuk', 'kategori_id' => $kategoriId,
                'uraian' => mb_substr('Penjualan ' . ($r->sampah ?: 'sampah') . ' ' . rtrim(rtrim(number_format($r->total_weight, 2, '.', ''), '0'), '.') . ' kg ke BSI (' . $r->periode . ')', 0, 255),
                'jumlah' => (int) round($r->total_price),
                'ref_type' => 'transactions_bsi', 'ref_id' => (string) $r->id,
                'created_by' => $userId, 'created_at' => now(), 'updated_at' => now(),
            ]);
            $n++;
        }
        return $n;
    }
}
