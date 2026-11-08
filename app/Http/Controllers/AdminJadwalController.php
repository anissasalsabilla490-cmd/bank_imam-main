<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;

/** Jadwal pengumpulan sampah per BSU: tabel + kalender interaktif. Nasabah melihatnya di dashboard. */
class AdminJadwalController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "judul";
        $this->limit = "25";
        $this->orderby = "tanggal,asc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = true;
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = true;
        $this->button_import = false;
        $this->button_export = false;
        $this->table = "jadwal_pengumpulan";

        $this->col = [];
        $this->col[] = ["label" => "Tanggal", "name" => "tanggal", 'callback_php' => 'date("d/m/Y", strtotime($row->tanggal))'];
        $this->col[] = ["label" => "Kegiatan", "name" => "judul"];
        $this->col[] = ["label" => "Jam", "name" => "jam_mulai", 'callback_php' => '$row->jam_mulai ? substr($row->jam_mulai,0,5).($row->jam_selesai ? " - ".substr($row->jam_selesai,0,5) : "") : "-"'];
        $this->col[] = ["label" => "Lokasi", "name" => "lokasi"];

        $this->form = [];
        $this->form[] = ['label' => 'Kegiatan', 'name' => 'judul', 'type' => 'text', 'validation' => 'required|string|min:3|max:120', 'width' => 'col-sm-8', 'help' => 'Contoh: Penimbangan sampah rutin'];
        $this->form[] = ['label' => 'Tanggal', 'name' => 'tanggal', 'type' => 'date', 'validation' => 'required|date', 'width' => 'col-sm-4'];
        $this->form[] = ['label' => 'Jam mulai', 'name' => 'jam_mulai', 'type' => 'time', 'validation' => 'nullable', 'width' => 'col-sm-3'];
        $this->form[] = ['label' => 'Jam selesai', 'name' => 'jam_selesai', 'type' => 'time', 'validation' => 'nullable', 'width' => 'col-sm-3'];
        $this->form[] = ['label' => 'Lokasi', 'name' => 'lokasi', 'type' => 'text', 'validation' => 'nullable|string|max:160', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Keterangan', 'name' => 'keterangan', 'type' => 'textarea', 'validation' => 'nullable|string|max:1000', 'width' => 'col-sm-8'];

        $this->index_button = [];
        $this->index_button[] = ['label' => 'Tampilan Kalender', 'url' => CRUDBooster::mainpath('kalender'), 'icon' => 'fa fa-calendar', 'color' => 'info'];

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

    public function getIndex() { $this->wajibPeran([1, 2, 4]); return parent::getIndex(); }

    public function hook_query_index(&$query)
    {
        if (!$this->adalahPusat()) { $query->where('jadwal_pengumpulan.admin_id', CRUDBooster::myId()); }
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([4]);
        $postdata['admin_id'] = CRUDBooster::myId();
    }

    public function hook_before_edit(&$postdata, $id)
    {
        $this->wajibPeran([4]);
        $this->wajibMilik('jadwal_pengumpulan', $id);
        unset($postdata['admin_id']);
    }

    public function getEdit($id)   { $this->wajibMilik('jadwal_pengumpulan', $id); return parent::getEdit($id); }
    public function getDetail($id) { $this->wajibMilik('jadwal_pengumpulan', $id); return parent::getDetail($id); }
    public function getDelete($id) { $this->wajibPeran([4]); $this->wajibMilik('jadwal_pengumpulan', $id); return parent::getDelete($id); }

    public function getKalender()
    {
        $this->wajibPeran([4]);
        $this->cbLoader();
        $rows = DB::table('jadwal_pengumpulan')->where('admin_id', CRUDBooster::myId())
            ->where('tanggal', '>=', now()->subMonths(6)->toDateString())->orderBy('tanggal')->orderBy('jam_mulai')
            ->get(['id', 'judul', 'tanggal', 'jam_mulai', 'jam_selesai', 'lokasi', 'keterangan']);
        return view('admin.jadwal_kalender', ['page_title' => 'Kalender Pengumpulan', 'rows' => $rows]);
    }

    /** Tambah cepat dari kalender; boleh beberapa tanggal sekaligus (rentang). */
    public function postSimpanCepat()
    {
        $this->wajibPeran([4]);
        $v = \Validator::make(request()->all(), [
            'judul' => 'required|string|min:3|max:120', 'dari' => 'required|date', 'sampai' => 'required|date|after_or_equal:dari',
            'jam_mulai' => 'nullable|date_format:H:i', 'jam_selesai' => 'nullable|date_format:H:i', 'lokasi' => 'nullable|string|max:160',
        ]);
        if ($v->fails()) { CRUDBooster::redirect(CRUDBooster::mainpath('kalender'), $v->errors()->first(), 'warning'); }

        $dari = \Carbon\Carbon::parse(request('dari')); $sampai = \Carbon\Carbon::parse(request('sampai'));
        if ($dari->diffInDays($sampai) > 92) { CRUDBooster::redirect(CRUDBooster::mainpath('kalender'), 'Rentang maksimal 93 hari.', 'warning'); }
        $n = 0;
        for ($d = $dari->copy(); $d->lte($sampai); $d->addDay()) {
            DB::table('jadwal_pengumpulan')->insert([
                'admin_id' => CRUDBooster::myId(), 'judul' => request('judul'), 'tanggal' => $d->toDateString(),
                'jam_mulai' => request('jam_mulai') ?: null, 'jam_selesai' => request('jam_selesai') ?: null,
                'lokasi' => request('lokasi'), 'created_at' => now(), 'updated_at' => now(),
            ]);
            $n++;
        }
        CRUDBooster::redirect(CRUDBooster::mainpath('kalender'), "$n jadwal ditambahkan.", 'success');
    }
}
