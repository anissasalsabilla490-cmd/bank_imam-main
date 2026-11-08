<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

/**
 * Manajemen harga sampah: harga acuan BSI -> harga beli nasabah tiap BSU (dikurangi margin).
 *
 *   sampah.price_per_kg = max(0, harga_BSI - margin)
 *     margin nominal : margin_value Rupiah per kg
 *     margin persen  : margin_value % dari harga BSI
 *
 * Setiap perubahan harga dicatat di bsi_harga_riwayat / sampah_harga_riwayat (per tanggal).
 */
class HargaService
{
    public static function hitungHarga($hargaBsi, $marginType, $marginValue)
    {
        $hargaBsi = (int) $hargaBsi;
        $marginValue = (float) $marginValue;
        $margin = $marginType === 'persen' ? $hargaBsi * $marginValue / 100 : $marginValue;
        return max(0, (int) round($hargaBsi - $margin));
    }

    public static function validasiMargin($type, $value)
    {
        if (!in_array($type, ['nominal', 'persen'], true)) {
            throw new InvalidArgumentException('Jenis margin harus nominal atau persen.');
        }
        if (!is_numeric($value) || $value < 0) {
            throw new InvalidArgumentException('Margin tidak boleh negatif.');
        }
        if ($type === 'persen' && $value > 100) {
            throw new InvalidArgumentException('Margin persen maksimal 100.');
        }
        return round((float) $value, 2);
    }

    /**
     * BSI mengubah harga acuan. Mengembalikan jumlah BSU yang hargainya ikut berubah.
     */
    public function ubahHargaBsi($bsiHargaId, $hargaBaru, $changedBy = null)
    {
        $hargaBaru = (int) $hargaBaru;
        if ($hargaBaru < 0) {
            throw new InvalidArgumentException('Harga tidak boleh negatif.');
        }

        $terdampak = [];

        DB::transaction(function () use ($bsiHargaId, $hargaBaru, $changedBy, &$terdampak) {
            $item = DB::table('bsi_harga')->where('id', $bsiHargaId)->lockForUpdate()->first();
            if (!$item) {
                throw new InvalidArgumentException('Jenis sampah BSI tidak ditemukan.');
            }
            $hargaLama = (int) $item->harga;
            if ($hargaLama === $hargaBaru) {
                return;
            }

            DB::table('bsi_harga')->where('id', $item->id)->update([
                'harga' => $hargaBaru, 'updated_by' => $changedBy, 'updated_at' => now(),
            ]);
            $this->catatRiwayatBsi($item->id, $hargaLama, $hargaBaru, $changedBy);

            $rows = DB::table('sampah')->where('bsi_harga_id', $item->id)->where('auto_sync', 1)
                ->lockForUpdate()->get();
            foreach ($rows as $s) {
                $baru = self::hitungHarga($hargaBaru, $s->margin_type, $s->margin_value);
                $lama = (int) $s->price_per_kg;
                if ($baru !== $lama) {
                    DB::table('sampah')->where('id', $s->id)->update(['price_per_kg' => $baru, 'updated_at' => now()]);
                    $this->catatRiwayatSampah($s->id, $s->admin_id, $item->id, $lama, $baru, 'bsi', $changedBy,
                        'Harga BSI ' . $hargaLama . ' -> ' . $hargaBaru);
                }
                $terdampak[$s->admin_id][] = [
                    'nama' => $item->nama, 'bsi_lama' => $hargaLama, 'bsi_baru' => $hargaBaru, 'harga_nasabah' => $baru,
                ];
            }
        });

        $this->kirimNotifikasi($terdampak);
        return count($terdampak);
    }

    /** BSU mengatur margin pada satu jenis sampah. Mengembalikan harga beli nasabah yang baru. */
    public function aturMargin($sampahId, $adminId, $type, $value, $autoSync = true, $changedBy = null)
    {
        $value = self::validasiMargin($type, $value);

        return DB::transaction(function () use ($sampahId, $adminId, $type, $value, $autoSync, $changedBy) {
            $s = DB::table('sampah')->where('id', $sampahId)->where('admin_id', $adminId)->lockForUpdate()->first();
            if (!$s || !$s->bsi_harga_id) {
                throw new InvalidArgumentException('Jenis sampah belum terhubung ke harga BSI.');
            }
            $bsi = DB::table('bsi_harga')->where('id', $s->bsi_harga_id)->first();
            $baru = self::hitungHarga($bsi->harga, $type, $value);
            $lama = (int) $s->price_per_kg;

            DB::table('sampah')->where('id', $s->id)->update([
                'margin_type' => $type, 'margin_value' => $value, 'auto_sync' => $autoSync ? 1 : 0,
                'price_per_kg' => $baru, 'updated_at' => now(),
            ]);
            if ($baru !== $lama) {
                $this->catatRiwayatSampah($s->id, $adminId, $bsi->id, $lama, $baru, 'margin', $changedBy,
                    'Margin ' . ($type === 'persen' ? $value . '%' : 'Rp ' . number_format($value, 0, ',', '.')));
            }
            return $baru;
        });
    }

    /** BSU mengaktifkan jenis sampah BSI -> membuat baris sampah baru milik BSU. */
    public function aktifkan($adminId, $bsiHargaId, $type = 'nominal', $value = 0, $changedBy = null)
    {
        $value = self::validasiMargin($type, $value);

        return DB::transaction(function () use ($adminId, $bsiHargaId, $type, $value, $changedBy) {
            $bsi = DB::table('bsi_harga')->where('id', $bsiHargaId)->where('is_active', 1)->first();
            if (!$bsi) {
                throw new InvalidArgumentException('Jenis sampah BSI tidak ditemukan atau nonaktif.');
            }
            if (DB::table('sampah')->where('admin_id', $adminId)->where('bsi_harga_id', $bsi->id)->exists()) {
                throw new InvalidArgumentException('Jenis sampah ini sudah aktif di BSU Anda.');
            }
            $harga = self::hitungHarga($bsi->harga, $type, $value);

            $id = DB::table('sampah')->insertGetId([
                'category_id'  => $this->kategoriBsu($adminId, $bsi->kategori),
                'admin_id'     => $adminId,
                'name'         => $bsi->nama,
                'deskripsi'    => $bsi->deskripsi ? mb_substr($bsi->deskripsi, 0, 200) : null,
                'image'        => $bsi->image,
                'price_per_kg' => $harga,
                'poin_per_kg'  => (int) $bsi->poin_per_kg,
                'bsi_harga_id' => $bsi->id,
                'margin_type'  => $type,
                'margin_value' => $value,
                'auto_sync'    => 1,
                'created_at'   => now(),
                'updated_at'   => now(),
            ]);
            $this->catatRiwayatSampah($id, $adminId, $bsi->id, null, $harga, 'awal', $changedBy, 'Jenis sampah diaktifkan');
            return $id;
        });
    }

    /** Kategori katalog milik BSU (dibuat bila belum ada) agar sampah tampil di katalog nasabah. */
    private function kategoriBsu($adminId, $nama)
    {
        $nama = trim((string) $nama) !== '' ? trim($nama) : 'Lainnya';
        $id = DB::table('sampah_categories')->where('admin_id', $adminId)->whereRaw('LOWER(name) = ?', [mb_strtolower($nama)])->value('id');
        if (!$id) {
            $id = DB::table('sampah_categories')->insertGetId([
                'admin_id' => $adminId, 'name' => mb_substr($nama, 0, 255), 'description' => '',
                'created_at' => now(), 'updated_at' => now(),
            ]);
        }
        return $id;
    }

    /**
     * Menghubungkan sampah BSU yang SUDAH ada ke jenis BSI. Harga nasabah saat ini
     * dipertahankan: margin dihitung = harga BSI - harga saat ini (nominal).
     */
    public function hubungkan($adminId, $sampahId, $bsiHargaId, $changedBy = null)
    {
        return DB::transaction(function () use ($adminId, $sampahId, $bsiHargaId, $changedBy) {
            $s = DB::table('sampah')->where('id', $sampahId)->where('admin_id', $adminId)->lockForUpdate()->first();
            $bsi = DB::table('bsi_harga')->where('id', $bsiHargaId)->first();
            if (!$s || !$bsi) {
                throw new InvalidArgumentException('Data sampah atau jenis BSI tidak ditemukan.');
            }
            if (DB::table('sampah')->where('admin_id', $adminId)->where('bsi_harga_id', $bsi->id)->where('id', '!=', $s->id)->exists()) {
                throw new InvalidArgumentException('Jenis BSI ini sudah terhubung ke sampah lain di BSU Anda.');
            }
            $margin = max(0, (int) $bsi->harga - (int) $s->price_per_kg);
            DB::table('sampah')->where('id', $s->id)->update([
                'bsi_harga_id' => $bsi->id, 'margin_type' => 'nominal', 'margin_value' => $margin,
                'auto_sync' => 1, 'updated_at' => now(),
            ]);
            return $margin;
        });
    }

    public function putuskan($adminId, $sampahId)
    {
        return DB::table('sampah')->where('id', $sampahId)->where('admin_id', $adminId)->update([
            'bsi_harga_id' => null, 'margin_value' => 0, 'margin_type' => 'nominal', 'updated_at' => now(),
        ]);
    }

    public function riwayatBsi($bsiHargaId = null, $limit = 100)
    {
        $q = DB::table('bsi_harga_riwayat as r')
            ->join('bsi_harga as b', 'b.id', '=', 'r.bsi_harga_id')
            ->leftJoin('cms_users as u', 'u.id', '=', 'r.changed_by')
            ->select('r.*', 'b.nama', 'u.name as pengubah')
            ->orderBy('r.id', 'desc')->limit($limit);
        if ($bsiHargaId) {
            $q->where('r.bsi_harga_id', $bsiHargaId);
        }
        return $q->get();
    }

    public function riwayatBsu($adminId, $limit = 100)
    {
        return DB::table('sampah_harga_riwayat as r')
            ->join('sampah as s', 's.id', '=', 'r.sampah_id')
            ->leftJoin('cms_users as u', 'u.id', '=', 'r.changed_by')
            ->where('r.admin_id', $adminId)
            ->select('r.*', 's.name as nama', 'u.name as pengubah')
            ->orderBy('r.id', 'desc')->limit($limit)->get();
    }

    private function catatRiwayatBsi($id, $lama, $baru, $by)
    {
        DB::table('bsi_harga_riwayat')->insert([
            'bsi_harga_id' => $id, 'harga_lama' => $lama, 'harga_baru' => $baru,
            'tanggal' => Carbon::today()->toDateString(), 'changed_by' => $by, 'created_at' => now(),
        ]);
    }

    public function catatHargaAwalBsi($id, $harga, $by = null)
    {
        $this->catatRiwayatBsi($id, null, (int) $harga, $by);
    }

    private function catatRiwayatSampah($sampahId, $adminId, $bsiId, $lama, $baru, $sumber, $by, $catatan = null)
    {
        DB::table('sampah_harga_riwayat')->insert([
            'sampah_id' => $sampahId, 'admin_id' => $adminId, 'bsi_harga_id' => $bsiId,
            'harga_lama' => $lama, 'harga_baru' => $baru, 'sumber' => $sumber,
            'tanggal' => Carbon::today()->toDateString(), 'changed_by' => $by,
            'catatan' => $catatan ? mb_substr($catatan, 0, 255) : null, 'created_at' => now(),
        ]);
    }

    /** Satu notifikasi ringkas per BSU (muncul di lonceng CMS). */
    private function kirimNotifikasi(array $terdampak)
    {
        foreach ($terdampak as $adminId => $items) {
            $i = $items[0];
            $isi = 'Harga BSI "' . strip_tags($i['nama']) . '" berubah: Rp ' . number_format($i['bsi_lama'], 0, ',', '.')
                . ' -> Rp ' . number_format($i['bsi_baru'], 0, ',', '.')
                . '. Harga beli nasabah Anda sekarang Rp ' . number_format($i['harga_nasabah'], 0, ',', '.') . '.';
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $adminId,
                'content'      => mb_substr($isi, 0, 255),
                'url'          => url(config('crudbooster.ADMIN_PATH', 'admin') . '/harga_bsu'),
                'is_read'      => 0,
                'created_at'   => now(),
            ]);
        }
    }
}
