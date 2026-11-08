<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Kotak masuk pengumuman dari BSI untuk BSU. Hanya pengumuman yang ditujukan ke BSU tersebut. */
class AdminPesanBsiController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "judul";
        $this->global_privilege = true;
        $this->button_add = false;
        $this->button_edit = false;
        $this->button_delete = false;
        $this->button_detail = false;
        $this->button_show = false;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "bsi_pengumuman_tujuan";
        $this->col = [];
        $this->form = [];
    }

    public function getIndex()
    {
        $this->wajibPeran([4]);
        $this->cbLoader();
        $rows = DB::table('bsi_pengumuman_tujuan as t')->join('bsi_pengumuman as p', 'p.id', '=', 't.pengumuman_id')
            ->leftJoin('cms_users as u', 'u.id', '=', 'p.created_by')
            ->where('t.bsu_id', CRUDBooster::myId())->orderByDesc('p.id')
            ->select('p.id', 'p.judul', 'p.created_at', 'u.name as pengirim', 't.dibaca_at')->paginate(20);
        return view('admin.pesan_bsi_index', ['page_title' => 'Pengumuman dari BSI', 'rows' => $rows]);
    }

    public function getBaca($id)
    {
        $this->wajibPeran([4]);
        $this->cbLoader();
        $uid = (int) CRUDBooster::myId();
        $t = DB::table('bsi_pengumuman_tujuan')->where('pengumuman_id', (int) $id)->where('bsu_id', $uid)->first();
        if (!$t) { CRUDBooster::redirect(CRUDBooster::mainpath(), 'Pengumuman tidak ditemukan.', 'warning'); }

        if (!$t->dibaca_at) {
            DB::table('bsi_pengumuman_tujuan')->where('id', $t->id)->update(['dibaca_at' => now()]);
        }
        DB::table('cms_notifications')->where('id_cms_users', $uid)->where('url', 'like', '%/pesan_bsi/baca/' . (int) $id)->update(['is_read' => 1]);

        $p = DB::table('bsi_pengumuman as p')->leftJoin('cms_users as u', 'u.id', '=', 'p.created_by')
            ->where('p.id', (int) $id)->first(['p.*', 'u.name as pengirim']);
        return view('admin.pesan_bsi_baca', [
            'page_title' => 'Pengumuman dari BSI', 'p' => $p, 'harga' => $p->lampiran_harga ? json_decode($p->lampiran_harga, true) : [],
        ]);
    }
}
