<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Kamus Jenis Sampah untuk pengurus (BSU), BSI, Admin: pencarian, penjelasan (ⓘ), foto, istilah. */
class AdminKamusController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "nama";
        $this->global_privilege = true;
        $this->button_add = false;
        $this->button_edit = false;
        $this->button_delete = false;
        $this->button_detail = false;
        $this->button_show = false;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "bsi_harga";
        $this->col = [];
        $this->form = [];
    }

    public function getIndex()
    {
        $this->wajibPeran([1, 2, 4, 'bsi']);
        $this->cbLoader();

        $items = DB::table('bsi_harga')->where('is_active', 1)
            ->get(['id', 'nama', 'kategori', 'deskripsi', 'image'])
            ->map(function ($r) { $r->sumber = 'BSI'; return $r; });

        // BSU juga melihat jenis sampah miliknya yang belum terhubung ke katalog BSI.
        if ($this->adalahBsu()) {
            $milik = DB::table('sampah as s')->leftJoin('sampah_categories as c', 'c.id', '=', 's.category_id')
                ->where('s.admin_id', CRUDBooster::myId())->whereNull('s.bsi_harga_id')
                ->get(['s.id', 's.name as nama', 'c.name as kategori', 's.deskripsi', 's.image'])
                ->map(function ($r) { $r->sumber = 'BSU'; return $r; });
            $items = $items->concat($milik);
        }
        $items = $items->sortBy(function ($r) { return mb_strtolower(($r->kategori ?: 'zzz') . '|' . $r->nama); })->values();

        return view('admin.kamus', [
            'page_title' => 'Kamus Jenis Sampah',
            'items' => $items,
            'kategori' => $items->pluck('kategori')->filter()->unique()->sort()->values(),
            'istilah' => DB::table('kamus_istilah')->orderBy('istilah')->get(),
        ]);
    }
}
