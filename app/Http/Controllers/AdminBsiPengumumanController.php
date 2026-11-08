<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\PengumumanBsiService;

/** BSI/Admin mengirim pengumuman (mis. harga sampah terbaru) ke satu atau beberapa BSU. */
class AdminBsiPengumumanController extends \crocodicstudio\crudbooster\controllers\CBController
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
        $this->table = "bsi_pengumuman";
        $this->col = [];
        $this->form = [];
    }

    private function aman() { $this->wajibPeran([1, 2, 'bsi']); }

    public function getIndex()
    {
        $this->aman();
        $this->cbLoader();
        $rows = DB::table('bsi_pengumuman as p')
            ->leftJoin('cms_users as u', 'u.id', '=', 'p.created_by')
            ->selectRaw('p.id, p.judul, p.created_at, u.name as pengirim,
                (SELECT COUNT(*) FROM bsi_pengumuman_tujuan t WHERE t.pengumuman_id = p.id) AS tujuan,
                (SELECT COUNT(*) FROM bsi_pengumuman_tujuan t WHERE t.pengumuman_id = p.id AND t.dibaca_at IS NOT NULL) AS dibaca')
            ->orderByDesc('p.id')->paginate(20);
        return view('admin.bsi_pengumuman_index', ['page_title' => 'Pengumuman ke BSU', 'rows' => $rows]);
    }

    public function getKirim()
    {
        $this->aman();
        $this->cbLoader();
        $svc = app(PengumumanBsiService::class);
        $bsu = $svc->daftarBsu();
        return view('admin.bsi_pengumuman_kirim', [
            'page_title' => 'Kirim Pengumuman ke BSU', 'bsu' => $bsu,
            'kecamatan' => $bsu->pluck('kecamatan')->filter()->unique()->sort()->values(),
            'jmlHarga' => DB::table('bsi_harga')->where('is_active', 1)->count(),
        ]);
    }

    public function postKirim()
    {
        $this->aman();
        try {
            $r = app(PengumumanBsiService::class)->kirim(
                (int) CRUDBooster::myId(), request('judul'), request('isi'), (array) request('bsu', []), (bool) request('sertakan_harga')
            );
        } catch (\InvalidArgumentException $e) {
            return redirect(CRUDBooster::mainpath('kirim'))->withInput()->with(['message' => $e->getMessage(), 'message_type' => 'warning']);
        }
        CRUDBooster::insertLog('Mengirim pengumuman BSI #' . $r['id'] . ' ke ' . $r['jumlah'] . ' BSU');
        CRUDBooster::redirect(CRUDBooster::mainpath('rincian/' . $r['id']), 'Pengumuman terkirim ke ' . $r['jumlah'] . ' BSU.', 'success');
    }

    public function getRincian($id)
    {
        $this->aman();
        $this->cbLoader();
        $p = DB::table('bsi_pengumuman')->where('id', (int) $id)->first();
        if (!$p) { CRUDBooster::redirect(CRUDBooster::mainpath(), 'Pengumuman tidak ditemukan.', 'warning'); }
        $tujuan = DB::table('bsi_pengumuman_tujuan as t')->join('cms_users as u', 'u.id', '=', 't.bsu_id')
            ->where('t.pengumuman_id', $p->id)->orderBy('u.name')->get(['u.name', 'u.kecamatan', 'u.kelurahan', 't.dibaca_at']);
        return view('admin.bsi_pengumuman_rincian', [
            'page_title' => 'Rincian Pengumuman', 'p' => $p, 'tujuan' => $tujuan,
            'harga' => $p->lampiran_harga ? json_decode($p->lampiran_harga, true) : [],
        ]);
    }
}
