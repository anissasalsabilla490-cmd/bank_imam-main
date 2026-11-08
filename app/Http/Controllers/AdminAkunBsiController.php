<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Super Admin membuat dan mengelola akun BSI (Bank Sampah Induk). Akun tidak dihapus, cukup dinonaktifkan. */
class AdminAkunBsiController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "name";
        $this->limit = "20";
        $this->orderby = "name,asc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = false;
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "cms_users";

        $this->col = [];
        $this->col[] = ["label" => "Nama", "name" => "name"];
        $this->col[] = ["label" => "Email (login)", "name" => "email"];
        $this->col[] = ["label" => "No. WhatsApp", "name" => "no_whatsapp"];
        $this->col[] = ["label" => "Status", "name" => "status"];
        $this->col[] = ["label" => "Dibuat", "name" => "created_at", 'callback_php' => '$row->created_at ? date("d/m/Y", strtotime($row->created_at)) : "-"'];

        $this->form = [];
        $this->form[] = ['label' => 'Nama Akun', 'name' => 'name', 'type' => 'text', 'validation' => 'required|string|min:3|max:150', 'width' => 'col-sm-8', 'help' => 'Contoh: BSI Jakarta Barat'];
        $this->form[] = ['label' => 'Email (untuk login)', 'name' => 'email', 'type' => 'email', 'validation' => 'required|email|unique:cms_users,email', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'No. WhatsApp', 'name' => 'no_whatsapp', 'type' => 'text', 'validation' => 'nullable|string|max:30', 'width' => 'col-sm-4'];
        $this->form[] = ['label' => 'Password', 'name' => 'password', 'type' => 'password', 'validation' => 'min:8|max:100', 'width' => 'col-sm-8', 'help' => 'Wajib saat membuat akun (min. 8 karakter). Saat edit, kosongkan jika tidak ingin mengganti password.'];
        $this->form[] = ['label' => 'Status', 'name' => 'status', 'type' => 'select', 'dataenum' => 'Active;Inactive', 'validation' => 'required|in:Active,Inactive', 'width' => 'col-sm-3', 'help' => 'Akun nonaktif otomatis dikeluarkan dan tidak bisa masuk ke CMS.'];

        $this->addaction = [];
        $this->index_button = [];
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

    public function getIndex() { $this->wajibPeran([1]); return parent::getIndex(); }

    public function hook_query_index(&$query)
    {
        $query->where('cms_users.id_cms_privileges', $this->idBsi());
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([1]);
        if ($this->idBsi() < 1) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Role BSI belum ada. Jalankan migrasi fitur_baru terlebih dahulu.', 'warning');
        }
        if (empty($postdata['password'])) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Password wajib diisi untuk akun baru.', 'warning');
        }
        $postdata['id_cms_privileges'] = $this->idBsi();   // dipaksa BSI, tidak percaya input form
        $postdata['no_whatsapp'] = ($postdata['no_whatsapp'] ?? '') !== '' ? $postdata['no_whatsapp'] : '0';
    }

    public function hook_before_edit(&$postdata, $id)
    {
        $this->wajibPeran([1]);
        $this->pastikanBsi($id);
        unset($postdata['id_cms_privileges']);
    }

    public function hook_after_add($id)
    {
        CRUDBooster::insertLog('Membuat akun BSI #' . $id);
    }

    public function getEdit($id)   { $this->wajibPeran([1]); $this->pastikanBsi($id); return parent::getEdit($id); }
    public function getDetail($id) { $this->wajibPeran([1]); $this->pastikanBsi($id); return parent::getDetail($id); }

    /** Halaman ini hanya boleh menyentuh akun BSI, bukan akun peran lain. */
    private function pastikanBsi($id)
    {
        if (!DB::table('cms_users')->where('id', $id)->where('id_cms_privileges', $this->idBsi())->exists()) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Akun BSI tidak ditemukan.', 'warning');
        }
    }
}
