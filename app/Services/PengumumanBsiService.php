<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

/** Pengumuman dari BSI ke satu atau lebih BSU, opsional dengan daftar harga acuan terbaru. */
class PengumumanBsiService
{
    const MAKS_TUJUAN = 500;

    /** BSU aktif yang dapat dipilih sebagai tujuan, urut A–Z. */
    public function daftarBsu()
    {
        return DB::table('cms_users')->where('id_cms_privileges', 4)
            ->where(function ($q) { $q->whereNull('status')->orWhere('status', '!=', 'Inactive'); })
            ->orderBy('name')->get(['id', 'name', 'kecamatan', 'kelurahan']);
    }

    /** Snapshot harga acuan aktif saat ini. */
    public function snapshotHarga()
    {
        return DB::table('bsi_harga')->where('is_active', 1)->orderBy('kategori')->orderBy('nama')
            ->get(['nama', 'kategori', 'harga'])
            ->map(function ($r) { return ['nama' => $r->nama, 'kategori' => $r->kategori, 'harga' => (int) $r->harga]; })->all();
    }

    /** @return array [id, jumlah] */
    public function kirim($pengirimId, $judul, $isi, array $bsuIds, $sertakanHarga = false)
    {
        $judul = trim((string) $judul);
        $isi = trim((string) $isi);
        if (mb_strlen($judul) < 3 || mb_strlen($judul) > 150) {
            throw new InvalidArgumentException('Judul wajib diisi (3–150 karakter).');
        }
        if (mb_strlen($isi) < 5 || mb_strlen($isi) > 5000) {
            throw new InvalidArgumentException('Isi pengumuman wajib diisi (5–5000 karakter).');
        }
        $bsuIds = array_values(array_unique(array_map('intval', $bsuIds)));
        if (count($bsuIds) < 1) {
            throw new InvalidArgumentException('Pilih minimal satu BSU tujuan.');
        }
        if (count($bsuIds) > self::MAKS_TUJUAN) {
            throw new InvalidArgumentException('Maksimal ' . self::MAKS_TUJUAN . ' BSU per pengumuman.');
        }

        // Hanya akun BSU aktif yang diterima; id lain (Admin/BSI/tidak ada) ditolak, bukan diabaikan diam-diam.
        $valid = DB::table('cms_users')->whereIn('id', $bsuIds)->where('id_cms_privileges', 4)
            ->where(function ($q) { $q->whereNull('status')->orWhere('status', '!=', 'Inactive'); })->pluck('id')->all();
        if (count($valid) !== count($bsuIds)) {
            throw new InvalidArgumentException('Ada tujuan yang bukan BSU aktif. Muat ulang halaman lalu pilih kembali.');
        }

        $lampiran = null;
        if ($sertakanHarga) {
            $snap = $this->snapshotHarga();
            if (!count($snap)) {
                throw new InvalidArgumentException('Belum ada harga acuan aktif untuk dilampirkan.');
            }
            $lampiran = json_encode($snap, JSON_UNESCAPED_UNICODE);
        }

        $id = null;
        DB::transaction(function () use ($pengirimId, $judul, $isi, $lampiran, $valid, &$id) {
            $id = DB::table('bsi_pengumuman')->insertGetId([
                'judul' => $judul, 'isi' => $isi, 'lampiran_harga' => $lampiran,
                'created_by' => $pengirimId, 'created_at' => now(), 'updated_at' => now(),
            ]);
            $url = url(config('crudbooster.ADMIN_PATH', 'admin') . '/pesan_bsi/baca/' . $id);
            foreach ($valid as $bsuId) {
                DB::table('bsi_pengumuman_tujuan')->insert(['pengumuman_id' => $id, 'bsu_id' => $bsuId, 'created_at' => now()]);
                DB::table('cms_notifications')->insert([
                    'id_cms_users' => $bsuId, 'content' => mb_substr('Pengumuman BSI: ' . strip_tags($judul), 0, 255),   // lonceng CMS dirakit via JS: buang tag HTML
                    'url' => $url, 'is_read' => 0, 'created_at' => now(),
                ]);
            }
        });

        return ['id' => $id, 'jumlah' => count($valid)];
    }
}
