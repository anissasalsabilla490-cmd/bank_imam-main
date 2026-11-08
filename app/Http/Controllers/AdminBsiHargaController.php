<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\HargaService;

/** Harga acuan Bank Sampah Induk (BSI). Hanya BSI, Admin, Super Admin. */
class AdminBsiHargaController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    private $hargaBaru = null;

    public function cbInit()
    {
        $this->title_field = "nama";
        $this->limit = "20";
        $this->orderby = "nama,asc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = false;   // nonaktifkan lewat status, jangan hapus (riwayat harus utuh)
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = true;
        $this->button_import = false;
        $this->button_export = true;
        $this->table = "bsi_harga";

        $this->col = [];
        $this->col[] = ["label" => "Jenis Sampah", "name" => "nama"];
        $this->col[] = ["label" => "Kategori", "name" => "kategori"];
        $this->col[] = ["label" => "Harga BSI / kg", "name" => "harga", 'callback_php' => '"Rp. ".number_format($row->harga,0,",",".")'];
        $this->col[] = ["label" => "Poin / kg", "name" => "poin_per_kg"];
        $this->col[] = ["label" => "Status", "name" => "is_active", 'callback_php' => '$row->is_active ? "Aktif" : "Nonaktif"'];
        $this->col[] = ["label" => "Diperbarui", "name" => "updated_at", 'callback_php' => '$row->updated_at ? date("d/m/Y H:i", strtotime($row->updated_at)) : "-"'];

        $this->form = [];
        $this->form[] = ['label' => 'Nama Jenis Sampah', 'name' => 'nama', 'type' => 'text', 'validation' => 'required|string|min:2|max:120', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Kategori', 'name' => 'kategori', 'type' => 'text', 'validation' => 'nullable|string|max:80', 'width' => 'col-sm-8', 'help' => 'Contoh: Plastik, Kertas, Logam, Kaca'];
        $this->form[] = ['label' => 'Penjelasan', 'name' => 'deskripsi', 'type' => 'textarea', 'validation' => 'nullable|string|max:1000', 'width' => 'col-sm-8', 'help' => 'Tampil di Kamus Jenis Sampah (ikon ⓘ).'];
        $this->form[] = ['label' => 'Foto Contoh', 'name' => 'image', 'type' => 'upload', 'validation' => 'nullable|image|max:5000', 'width' => 'col-sm-8', 'help' => 'JPG/PNG, maks 5 MB.'];
        $this->form[] = ['label' => 'Harga Acuan BSI per kg (Rp)', 'name' => 'harga', 'type' => 'number', 'validation' => 'required|integer|min:0|max:100000000', 'width' => 'col-sm-8', 'help' => 'Saat harga diubah, harga beli semua BSU yang terhubung ikut dihitung ulang dan BSU diberi notifikasi.'];
        $this->form[] = ['label' => 'Poin per kg (bawaan)', 'name' => 'poin_per_kg', 'type' => 'number', 'validation' => 'required|integer|min:0|max:100000', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Status', 'name' => 'is_active', 'type' => 'select', 'dataenum' => '1|Aktif;0|Nonaktif', 'validation' => 'required|in:0,1', 'width' => 'col-sm-4'];

        $this->addaction = [];
        $this->addaction[] = ['label' => 'Riwayat', 'url' => CRUDBooster::mainpath('riwayat/[id]'), 'icon' => 'fa fa-history', 'color' => 'info'];

        $this->index_button = [];
        $this->index_button[] = ['label' => 'Kirim Pengumuman ke BSU', 'url' => CRUDBooster::adminPath('bsi_pengumuman/kirim'), 'icon' => 'fa fa-bullhorn', 'color' => 'success'];
        $this->index_button[] = ['label' => 'Riwayat Semua Perubahan', 'url' => CRUDBooster::mainpath('riwayat'), 'icon' => 'fa fa-history', 'color' => 'info'];

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

    public function getIndex()
    {
        $this->wajibPeran([1, 2, 'bsi']);
        return parent::getIndex();
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([1, 2, 'bsi']);
        $postdata['updated_by'] = CRUDBooster::myId();
    }

    public function hook_after_add($id)
    {
        $harga = (int) DB::table('bsi_harga')->where('id', $id)->value('harga');
        app(HargaService::class)->catatHargaAwalBsi($id, $harga, CRUDBooster::myId());
    }

    public function hook_before_edit(&$postdata, $id)
    {
        $this->wajibPeran([1, 2, 'bsi']);
        // Harga TIDAK ditulis oleh CRUDBooster; diproses HargaService agar riwayat, sinkron BSU, dan notifikasi jalan.
        $this->hargaBaru = array_key_exists('harga', $postdata) ? (int) $postdata['harga'] : null;
        unset($postdata['harga']);
        $postdata['updated_by'] = CRUDBooster::myId();
    }

    public function hook_after_edit($id)
    {
        if ($this->hargaBaru !== null) {
            $n = app(HargaService::class)->ubahHargaBsi($id, $this->hargaBaru, CRUDBooster::myId());
            if ($n > 0) {
                session()->flash('bsi_info', "Harga diperbarui. $n BSU diberi notifikasi.");
            }
        }
    }

    /** Riwayat perubahan harga acuan (semua atau satu jenis). */
    public function getRiwayat($id = null)
    {
        $this->wajibPeran([1, 2, 'bsi']);
        $this->cbLoader();
        $data = [
            'page_title' => 'Riwayat Perubahan Harga BSI',
            'rows' => app(HargaService::class)->riwayatBsi($id ? (int) $id : null, 300),
            'judul' => $id ? DB::table('bsi_harga')->where('id', (int) $id)->value('nama') : null,
            'kembali' => CRUDBooster::mainpath(),
        ];
        return view('admin.bsi_riwayat', $data);
    }
}
