<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\KasService;

/** Dashboard ringkasan: BSU (kas, setoran, saldo nasabah, harga, jadwal), BSI, dan pusat. */
class AdminRingkasanController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "name";
        $this->global_privilege = true;
        $this->button_add = false;
        $this->button_edit = false;
        $this->button_delete = false;
        $this->button_detail = false;
        $this->button_show = false;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "cms_users";
        $this->col = [];
        $this->form = [];
    }

    public function getIndex()
    {
        $this->wajibPeran([1, 2, 4, 'bsi']);
        $this->cbLoader();
        $perubahan = DB::table('bsi_harga_riwayat as r')->join('bsi_harga as b', 'b.id', '=', 'r.bsi_harga_id')
            ->whereNotNull('r.harga_lama')->orderByDesc('r.id')->limit(6)->get(['b.nama', 'r.harga_lama', 'r.harga_baru', 'r.tanggal']);

        if ($this->adalahBsu()) {
            $id = (int) CRUDBooster::myId();
            $kas = app(KasService::class);
            $bulan = $kas->laporan($id, 'bulanan', date('Y-m'));
            $awal = date('Y-m-01');
            $set = DB::table('transactions')->where('admin_id', $id)->whereDate('created_at', '>=', $awal)
                ->selectRaw('COUNT(*) n, COALESCE(SUM(total_weight),0) kg, COALESCE(SUM(total_income),0) rp')->first();
            $nasabah = DB::table('users')->where('cms_user_id', $id)->count();
            $saldoNasabah = (int) DB::table('saldo')->join('users', 'users.id', '=', 'saldo.user_id')
                ->where('users.cms_user_id', $id)->sum('saldo.total_saldo');
            $tukar = DB::table('tukar_saldo')->where('admin_id', $id)->whereDate('created_at', '>=', $awal)->count();
            $jadwal = DB::table('jadwal_pengumpulan')->where('admin_id', $id)->where('tanggal', '>=', date('Y-m-d'))
                ->orderBy('tanggal')->orderBy('jam_mulai')->limit(4)->get();
            $harga = DB::table('sampah')->where('admin_id', $id)->whereNotNull('bsi_harga_id')->count();
            return view('admin.ringkasan_bsu', [
                'page_title' => 'Ringkasan', 'saldoKas' => $kas->saldo($id), 'bulan' => $bulan, 'set' => $set,
                'nasabah' => $nasabah, 'saldoNasabah' => $saldoNasabah, 'tukar' => $tukar, 'jadwal' => $jadwal,
                'perubahan' => $perubahan, 'hargaTerhubung' => $harga,
            ]);
        }

        return view('admin.ringkasan_pusat', [
            'page_title' => 'Ringkasan', 'perubahan' => $perubahan,
            'jmlJenis' => DB::table('bsi_harga')->where('is_active', 1)->count(),
            'jmlBsu' => DB::table('cms_users')->where('id_cms_privileges', 4)->count(),
            'jmlNasabah' => DB::table('users')->count(),
            'terhubung' => DB::table('sampah')->whereNotNull('bsi_harga_id')->distinct()->count('admin_id'),
        ]);
    }
}
