<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;

/** Data ringkasan dashboard nasabah: uang masuk/keluar bulan ini, harga terbaru di BSU-nya, jadwal pengumpulan. */
class RingkasanNasabah
{
    public static function untuk($user)
    {
        $awal = now()->startOfMonth();

        $masuk = DB::table('transactions')->where('user_id', $user->id)->where('created_at', '>=', $awal)
            ->selectRaw('COUNT(*) n, COALESCE(SUM(total_weight),0) kg, COALESCE(SUM(total_income),0) rp')->first();

        $keluar = (int) DB::table('saldo_mutasi')->where('user_id', $user->id)->where('type', 'debit')
            ->where('created_at', '>=', $awal)->sum('amount');

        $harga = DB::table('sampah_harga_riwayat as r')->join('sampah as s', 's.id', '=', 'r.sampah_id')
            ->where('r.admin_id', $user->cms_user_id)->whereNotNull('r.harga_lama')
            ->where('r.tanggal', '>=', now()->subDays(30)->toDateString())
            ->orderByDesc('r.id')->limit(5)
            ->get(['s.name', 'r.harga_lama', 'r.harga_baru', 'r.tanggal']);

        $jadwal = DB::table('jadwal_pengumpulan')->where('admin_id', $user->cms_user_id)
            ->where('tanggal', '>=', now()->toDateString())->orderBy('tanggal')->orderBy('jam_mulai')->limit(3)
            ->get(['judul', 'tanggal', 'jam_mulai', 'jam_selesai', 'lokasi']);

        return ['masuk' => $masuk, 'keluar' => $keluar, 'harga' => $harga, 'jadwal' => $jadwal];
    }
}
