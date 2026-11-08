<?php namespace App\Http\Controllers;

use CRUDBooster;
use App\Http\Controllers\Concerns\CekPeran;

/** Istilah khusus kamus (mis. "Bodong A"). Dikelola BSI/Admin/Super Admin. */
class AdminKamusIstilahController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "istilah";
        $this->limit = "25";
        $this->orderby = "istilah,asc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = true;
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = false;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "kamus_istilah";

        $this->col = [];
        $this->col[] = ["label" => "Istilah", "name" => "istilah"];
        $this->col[] = ["label" => "Penjelasan", "name" => "penjelasan"];
        $this->col[] = ["label" => "Terkait jenis", "name" => "bsi_harga_id", "join" => "bsi_harga,nama"];

        $this->form = [];
        $this->form[] = ['label' => 'Istilah', 'name' => 'istilah', 'type' => 'text', 'validation' => 'required|string|min:2|max:80', 'width' => 'col-sm-8', 'help' => 'Contoh: Bodong A'];
        $this->form[] = ['label' => 'Penjelasan', 'name' => 'penjelasan', 'type' => 'textarea', 'validation' => 'required|string|min:5|max:1000', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Terkait jenis sampah (opsional)', 'name' => 'bsi_harga_id', 'type' => 'select2', 'validation' => 'nullable|integer', 'width' => 'col-sm-8', 'datatable' => 'bsi_harga,nama'];

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

    public function getIndex() { $this->wajibPeran([1, 2, 'bsi']); return parent::getIndex(); }
}
