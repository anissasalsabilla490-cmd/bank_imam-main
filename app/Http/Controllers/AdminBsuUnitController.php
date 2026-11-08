<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;
use App\Support\BsuNaming;

/**
 * Manajemen Bank Sampah Unit (BSU): identitas, wilayah (kecamatan/kelurahan/RW), penamaan seragam.
 * Super Admin/Admin: kelola. BSI: hanya lihat.
 */
class AdminBsuUnitController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "name";
        $this->limit = "25";
        $this->orderby = "name,asc";           // otomatis urut A–Z
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = false;          // nonaktifkan lewat Status; menghapus akan memutus data nasabah
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = true;
        $this->button_import = false;
        $this->button_export = true;
        $this->table = "cms_users";

        $this->col = [];
        $this->col[] = ["label" => "Nama BSU", "name" => "name"];
        $this->col[] = ["label" => "Tingkat", "name" => "tingkat", 'callback_php' => '$row->tingkat=="rw" ? "RW" : ($row->tingkat=="kelurahan" ? "Kelurahan" : "-")'];
        $this->col[] = ["label" => "Kecamatan", "name" => "kecamatan"];
        $this->col[] = ["label" => "Kelurahan", "name" => "kelurahan"];
        $this->col[] = ["label" => "RW", "name" => "rw"];
        $this->col[] = ["label" => "WhatsApp", "name" => "no_whatsapp"];
        $this->col[] = ["label" => "Status", "name" => "status"];

        $this->form = [];
        $this->form[] = ['label' => 'Nama BSU', 'name' => 'name', 'type' => 'text', 'validation' => 'required|string|min:3|max:150', 'width' => 'col-sm-8',
            'help' => 'Cukup nama intinya (mis. "Melati 1"). Nama akan dirapikan otomatis ke format: BSU {Nama} RW {nn} Kel. {Kelurahan}.'];
        $this->form[] = ['label' => 'Tingkat', 'name' => 'tingkat', 'type' => 'select', 'dataenum' => 'kelurahan|Kelurahan;rw|RW', 'validation' => 'required|in:kelurahan,rw', 'width' => 'col-sm-4'];
        $this->form[] = ['label' => 'Kecamatan', 'name' => 'kecamatan', 'type' => 'text', 'validation' => 'required|string|max:80', 'width' => 'col-sm-6'];
        $this->form[] = ['label' => 'Kelurahan', 'name' => 'kelurahan', 'type' => 'text', 'validation' => 'required|string|max:80', 'width' => 'col-sm-6'];
        $this->form[] = ['label' => 'RW (angka)', 'name' => 'rw', 'type' => 'text', 'validation' => 'nullable|digits_between:1,3', 'width' => 'col-sm-3', 'help' => 'Wajib untuk BSU tingkat RW.'];
        $this->form[] = ['label' => 'Alamat', 'name' => 'alamat', 'type' => 'text', 'validation' => 'nullable|string|max:255', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'No. WhatsApp', 'name' => 'no_whatsapp', 'type' => 'text', 'validation' => 'nullable|string|max:30', 'width' => 'col-sm-4'];
        $this->form[] = ['label' => 'Email (untuk login)', 'name' => 'email', 'type' => 'email', 'validation' => 'required|email|unique:cms_users,email', 'width' => 'col-sm-6'];
        $this->form[] = ['label' => 'Password', 'name' => 'password', 'type' => 'password', 'validation' => 'min:8|max:100', 'width' => 'col-sm-6', 'help' => 'Wajib saat tambah BSU baru (min. 8). Kosongkan saat edit bila tidak diganti.'];
        $this->form[] = ['label' => 'Status', 'name' => 'status', 'type' => 'select', 'dataenum' => 'Active;Inactive', 'validation' => 'required|in:Active,Inactive', 'width' => 'col-sm-3'];

        $this->index_button = [];
        $this->index_button[] = ['label' => 'Tampilan per Wilayah', 'url' => CRUDBooster::mainpath('daftar'), 'icon' => 'fa fa-sitemap', 'color' => 'info'];

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

    private function rapikan(&$p)
    {
        if (($p['tingkat'] ?? '') === 'rw' && !ctype_digit(trim((string) ($p['rw'] ?? '')))) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'BSU tingkat RW wajib mengisi nomor RW (angka).', 'warning');
        }
        if (($p['tingkat'] ?? '') !== 'rw') { $p['rw'] = null; }
        $p['name'] = BsuNaming::format($p['name'] ?? '', $p['rw'] ?? null, $p['kelurahan'] ?? null);
    }

    public function getIndex() { $this->wajibPeran([1, 2, 'bsi']); return parent::getIndex(); }

    public function hook_query_index(&$query)
    {
        $query->where('cms_users.id_cms_privileges', 4);
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([1, 2]);
        if (empty($postdata['password'])) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Password wajib diisi untuk BSU baru.', 'warning');
        }
        $this->rapikan($postdata);
        $postdata['id_cms_privileges'] = 4;        // paksa role BSU
        $postdata['no_whatsapp'] = $postdata['no_whatsapp'] ?? '0';
    }

    public function hook_before_edit(&$postdata, $id)
    {
        $this->wajibPeran([1, 2]);
        $this->pastikanBsu($id);
        $this->rapikan($postdata);
        unset($postdata['id_cms_privileges']);
    }

    public function getEdit($id)   { $this->wajibPeran([1, 2]); $this->pastikanBsu($id); return parent::getEdit($id); }
    public function getDetail($id) { $this->wajibPeran([1, 2, 'bsi']); $this->pastikanBsu($id); return parent::getDetail($id); }

    private function pastikanBsu($id)
    {
        if (!DB::table('cms_users')->where('id', $id)->where('id_cms_privileges', 4)->exists()) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Data BSU tidak ditemukan.', 'warning');
        }
    }

    /** Daftar BSU dikelompokkan Kecamatan → Kelurahan, dengan pencarian & filter. */
    public function getDaftar()
    {
        $this->wajibPeran([1, 2, 'bsi']);
        $this->cbLoader();
        $q = trim((string) request('q')); $kec = request('kecamatan'); $kel = request('kelurahan');

        $semua = DB::table('cms_users')->where('id_cms_privileges', 4)->orderBy('name')
            ->get(['id', 'name', 'tingkat', 'kecamatan', 'kelurahan', 'rw', 'no_whatsapp', 'status']);
        $opsiKec = $semua->pluck('kecamatan')->filter()->unique()->sort()->values();
        $opsiKel = $semua->filter(function ($r) use ($kec) { return !$kec || $r->kecamatan === $kec; })->pluck('kelurahan')->filter()->unique()->sort()->values();

        $f = $semua->filter(function ($r) use ($q, $kec, $kel) {
            return (!$q || mb_stripos($r->name, $q) !== false)
                && (!$kec || $r->kecamatan === $kec) && (!$kel || $r->kelurahan === $kel);
        });
        $grup = $f->groupBy(function ($r) { return $r->kecamatan ?: '(Kecamatan belum diisi)'; })->sortKeys()
            ->map(function ($g) { return $g->groupBy(function ($r) { return $r->kelurahan ?: '(Kelurahan belum diisi)'; })->sortKeys(); });

        return view('admin.bsu_daftar', [
            'page_title' => 'Daftar BSU per Wilayah', 'grup' => $grup, 'total' => $f->count(),
            'q' => $q, 'kec' => $kec, 'kel' => $kel, 'opsiKec' => $opsiKec, 'opsiKel' => $opsiKel,
            'boleh' => $this->adalahPusat(),
        ]);
    }

    /** Terapkan nama seragam (hanya mengubah kolom name). */
    public function postTerapkan()
    {
        $this->wajibPeran([1, 2]);
        $id = (int) request('id');
        $b = DB::table('cms_users')->where('id', $id)->where('id_cms_privileges', 4)->first();
        if (!$b) { CRUDBooster::redirect(CRUDBooster::mainpath('daftar'), 'BSU tidak ditemukan.', 'warning'); }
        $baru = BsuNaming::format($b->name, $b->rw, $b->kelurahan);
        DB::table('cms_users')->where('id', $id)->update(['name' => $baru, 'updated_at' => now()]);
        CRUDBooster::insertLog("Nama BSU #$id dirapikan: {$b->name} -> $baru");
        CRUDBooster::redirect(CRUDBooster::mainpath('daftar'), 'Nama diperbarui menjadi: ' . $baru, 'success');
    }
}
