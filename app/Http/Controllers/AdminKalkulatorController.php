<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Kalkulator berat & nilai setoran untuk pengurus BSU (angka koma didukung). */
class AdminKalkulatorController extends \crocodicstudio\crudbooster\controllers\CBController
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
        $this->table = "sampah";
        $this->col = [];
        $this->form = [];
    }

    public function getIndex()
    {
        $this->wajibPeran([4]);
        $this->cbLoader();
        $sampah = DB::table('sampah as s')->leftJoin('sampah_categories as c', 'c.id', '=', 's.category_id')
            ->where('s.admin_id', CRUDBooster::myId())->orderBy('c.name')->orderBy('s.name')
            ->get(['s.id', 's.name', 's.price_per_kg as harga', 's.poin_per_kg as poin', 'c.name as kategori']);
        return view('admin.kalkulator', ['page_title' => 'Kalkulator Setoran', 'sampah' => $sampah]);
    }
}
