<?php namespace App\Http\Controllers;

use CRUDBooster;

/** Pengaturan aksesibilitas & tampilan (ukuran huruf, ukuran ikon, warna) untuk semua pengguna CMS. */
class AdminPengaturanTampilanController extends \crocodicstudio\crudbooster\controllers\CBController
{
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
        $this->cbLoader();
        return view('admin.pengaturan_tampilan', ['page_title' => 'Pengaturan Tampilan & Aksesibilitas']);
    }
}
