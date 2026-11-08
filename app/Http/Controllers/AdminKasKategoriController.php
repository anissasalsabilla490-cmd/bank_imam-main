<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Kategori kas: bawaan (admin_id NULL, hanya lihat) + kategori kustom milik BSU. */
class AdminKasKategoriController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "nama";
        $this->limit = "20";
        $this->orderby = "tipe,asc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = true;
        $this->button_detail = false;
        $this->button_show = false;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "kas_kategori";

        $this->col = [];
        $this->col[] = ["label" => "Nama", "name" => "nama"];
        $this->col[] = ["label" => "Jenis", "name" => "tipe", 'callback_php' => '$row->tipe=="masuk" ? "Pemasukan" : "Pengeluaran"'];
        $this->col[] = ["label" => "Milik", "name" => "admin_id", 'callback_php' => '$row->admin_id ? "Kategori Anda" : "Bawaan"'];

        $this->form = [];
        $this->form[] = ['label' => 'Nama Kategori', 'name' => 'nama', 'type' => 'text', 'validation' => 'required|string|min:3|max:80', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Jenis', 'name' => 'tipe', 'type' => 'radio', 'dataenum' => 'masuk|Pemasukan;keluar|Pengeluaran', 'validation' => 'required|in:masuk,keluar', 'width' => 'col-sm-8'];

        $this->addaction = [];
        $this->button_selected = [];
        $this->alert = [];
        $this->table_row_color = [];
        $this->index_statistic = [];
        $this->script_js = null;
        $this->pre_index_html = null;
        $this->post_index_html = null;
        $this->load_js = [];
        $this->style_css = null;
        $this->load_css = [];
    }

    public function hook_query_index(&$query)
    {
        $uid = (int) CRUDBooster::myId();
        $query->where(function ($w) use ($uid) { $w->whereNull('kas_kategori.admin_id')->orWhere('kas_kategori.admin_id', $uid); });
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([4]);
        $postdata['admin_id'] = CRUDBooster::myId();
        $postdata['is_active'] = 1;
    }

    /** Kategori bawaan tidak boleh diubah/dihapus; kategori yang sudah dipakai tidak boleh dihapus. */
    private function bolehUbah($id, $hapus = false)
    {
        $this->wajibPeran([4]);
        $k = DB::table('kas_kategori')->where('id', $id)->first();
        if (!$k || (int) $k->admin_id !== (int) CRUDBooster::myId()) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Kategori bawaan tidak bisa diubah atau dihapus.', 'warning');
        }
        if ($hapus && DB::table('kas_umum')->where('kategori_id', $id)->whereNull('deleted_at')->exists()) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Kategori ini sudah dipakai pada catatan kas, tidak bisa dihapus.', 'warning');
        }
    }

    public function getEdit($id)   { $this->bolehUbah($id); return parent::getEdit($id); }
    public function hook_before_edit(&$postdata, $id) { $this->bolehUbah($id); unset($postdata['admin_id']); }
    public function getDelete($id) { $this->bolehUbah($id, true); return parent::getDelete($id); }
}
