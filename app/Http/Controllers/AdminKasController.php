<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Exports\LaporanKasExport;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\KasService;
use Maatwebsite\Excel\Facades\Excel;

/** Buku Kas Umum BSU: catatan, saldo otomatis, laporan, ekspor PDF/Excel. */
class AdminKasController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "uraian";
        $this->limit = "25";
        $this->orderby = "tanggal,desc";
        $this->global_privilege = false;
        $this->button_table_action = true;
        $this->button_bulk_action = false;
        $this->button_action_style = "button_icon";
        $this->button_add = true;
        $this->button_edit = true;
        $this->button_delete = true;    // soft delete (kolom deleted_at)
        $this->button_detail = true;
        $this->button_show = true;
        $this->button_filter = true;
        $this->button_import = false;
        $this->button_export = false;   // ekspor memakai halaman Laporan
        $this->table = "kas_umum";

        $this->col = [];
        $this->col[] = ["label" => "Tanggal", "name" => "tanggal", 'callback_php' => 'date("d/m/Y", strtotime($row->tanggal))'];
        $this->col[] = ["label" => "Jenis", "name" => "tipe", 'callback_php' => '$row->tipe=="masuk" ? "Pemasukan" : "Pengeluaran"'];
        $this->col[] = ["label" => "Kategori", "name" => "kategori_id", "join" => "kas_kategori,nama"];
        $this->col[] = ["label" => "Uraian", "name" => "uraian"];
        $this->col[] = ["label" => "Jumlah", "name" => "jumlah", 'callback_php' => '($row->tipe=="masuk" ? "+ " : "- ")."Rp ".number_format($row->jumlah,0,",",".")'];
        $this->col[] = ["label" => "Bukti", "name" => "bukti", "image" => true];

        $uid = (int) CRUDBooster::myId();
        $this->form = [];
        $this->form[] = ['label' => 'Tanggal', 'name' => 'tanggal', 'type' => 'date', 'validation' => 'required|date|before_or_equal:today', 'width' => 'col-sm-4', 'value' => date('Y-m-d')];
        $this->form[] = ['label' => 'Jenis', 'name' => 'tipe', 'type' => 'radio', 'dataenum' => 'masuk|Pemasukan;keluar|Pengeluaran', 'validation' => 'required|in:masuk,keluar', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Kategori', 'name' => 'kategori_id', 'type' => 'select2', 'validation' => 'required|integer', 'width' => 'col-sm-8',
            'datatable' => 'kas_kategori,nama', 'datatable_where' => "is_active = 1 and (admin_id is null or admin_id = $uid)",
            'help' => 'Kategori kustom dibuat di menu Kategori Kas.'];
        $this->form[] = ['label' => 'Uraian', 'name' => 'uraian', 'type' => 'text', 'validation' => 'required|string|min:3|max:255', 'width' => 'col-sm-8'];
        $this->form[] = ['label' => 'Jumlah (Rp)', 'name' => 'jumlah', 'type' => 'number', 'validation' => 'required|integer|min:1|max:100000000000', 'width' => 'col-sm-4'];
        $this->form[] = ['label' => 'Foto Nota / Struk', 'name' => 'bukti', 'type' => 'upload', 'validation' => 'nullable|image|max:5000', 'width' => 'col-sm-8', 'help' => 'Foto langsung dari HP boleh. JPG/PNG maks 5 MB.'];

        $this->index_button = [];
        $this->index_button[] = ['label' => 'Laporan & Ekspor', 'url' => CRUDBooster::mainpath('laporan'), 'icon' => 'fa fa-file-text-o', 'color' => 'info'];

        $this->addaction = [];
        $this->button_selected = [];
        $this->alert = [];
        $this->table_row_color = [];
        $this->index_statistic = [];
        $this->script_js = null;
        $this->post_index_html = null;
        $this->load_js = [];
        $this->style_css = null;
        $this->load_css = [];
        $this->pre_index_html = null;
    }

    private function kasId()
    {
        $this->wajibPeran([4]);
        return (int) CRUDBooster::myId();
    }

    public function getIndex()
    {
        $this->wajibPeran([1, 2, 4]);
        if ($this->adalahBsu()) {
            $svc = app(KasService::class);
            $id = CRUDBooster::myId();
            $saldo = $svc->saldo($id);
            $bulan = $svc->laporan($id, 'bulanan', date('Y-m'));
            $this->pre_index_html = '<div class="row"><div class="col-sm-4"><div class="info-box bg-green"><span class="info-box-icon"><i class="fa fa-money"></i></span><div class="info-box-content"><span class="info-box-text">Saldo kas sekarang</span><span class="info-box-number" style="font-size:22px">' . e($this->rupiah($saldo)) . '</span></div></div></div>'
                . '<div class="col-sm-4"><div class="info-box"><span class="info-box-icon bg-aqua"><i class="fa fa-arrow-down"></i></span><div class="info-box-content"><span class="info-box-text">Pemasukan bulan ini</span><span class="info-box-number">' . e($this->rupiah($bulan['masuk'])) . '</span></div></div></div>'
                . '<div class="col-sm-4"><div class="info-box"><span class="info-box-icon bg-red"><i class="fa fa-arrow-up"></i></span><div class="info-box-content"><span class="info-box-text">Pengeluaran bulan ini</span><span class="info-box-number">' . e($this->rupiah($bulan['keluar'])) . '</span></div></div></div></div>';
        }
        return parent::getIndex();
    }

    public function hook_query_index(&$query)
    {
        if (!$this->adalahPusat()) {
            $query->where('kas_umum.admin_id', CRUDBooster::myId());
        }
        $query->whereNull('kas_umum.deleted_at');
    }

    public function hook_before_add(&$postdata)
    {
        $this->wajibPeran([4]);
        $postdata['admin_id'] = CRUDBooster::myId();   // tidak percaya input form
        $postdata['created_by'] = CRUDBooster::myId();
        $this->cekKategori($postdata);
    }

    public function hook_before_edit(&$postdata, $id)
    {
        $this->wajibPeran([4]);
        $this->wajibMilik('kas_umum', $id);
        unset($postdata['admin_id']);
        $this->cekKategori($postdata);
    }

    public function getEdit($id)   { $this->wajibMilik('kas_umum', $id); return parent::getEdit($id); }
    public function getDetail($id) { $this->wajibMilik('kas_umum', $id); return parent::getDetail($id); }
    public function getDelete($id) { $this->wajibPeran([4]); $this->wajibMilik('kas_umum', $id); return parent::getDelete($id); }

    /** Kategori harus bawaan atau milik BSU ini dan sesuai jenis. */
    private function cekKategori($postdata)
    {
        $k = DB::table('kas_kategori')->where('id', $postdata['kategori_id'] ?? 0)->first();
        $ok = $k && (is_null($k->admin_id) || (int) $k->admin_id === (int) CRUDBooster::myId())
            && $k->tipe === ($postdata['tipe'] ?? '');
        if (!$ok) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), 'Kategori tidak sesuai dengan jenis transaksi.', 'warning');
        }
    }

    // ---------- Laporan ----------
    private function paramLaporan()
    {
        $periode = in_array(request('periode'), ['harian', 'bulanan', 'tahunan'], true) ? request('periode') : 'bulanan';
        $nilai = request('nilai');
        if ($periode === 'harian') { $nilai = preg_match('/^\d{4}-\d{2}-\d{2}$/', (string) $nilai) ? $nilai : date('Y-m-d'); }
        if ($periode === 'bulanan') { $nilai = preg_match('/^\d{4}-\d{2}$/', (string) $nilai) ? $nilai : date('Y-m'); }
        if ($periode === 'tahunan') { $nilai = preg_match('/^\d{4}$/', (string) $nilai) ? $nilai : date('Y'); }
        return [$periode, $nilai];
    }

    public function getLaporan()
    {
        $id = $this->kasId();
        $this->cbLoader();
        [$periode, $nilai] = $this->paramLaporan();
        $lap = app(KasService::class)->laporan($id, $periode, $nilai);
        return view('admin.kas_laporan', ['page_title' => 'Laporan Kas', 'lap' => $lap, 'periode' => $periode, 'nilai' => $nilai]);
    }

    public function getExportExcel()
    {
        $id = $this->kasId();
        [$periode, $nilai] = $this->paramLaporan();
        $lap = app(KasService::class)->laporan($id, $periode, $nilai);
        $nama = DB::table('cms_users')->where('id', $id)->value('name');
        return Excel::download(new LaporanKasExport($lap, $nama), 'laporan-kas-' . $periode . '-' . $nilai . '.xlsx');
    }

    public function getExportPdf()
    {
        $id = $this->kasId();
        [$periode, $nilai] = $this->paramLaporan();
        $lap = app(KasService::class)->laporan($id, $periode, $nilai);
        $nama = DB::table('cms_users')->where('id', $id)->value('name');
        $pdf = app('dompdf.wrapper')->loadView('admin.kas_laporan_pdf', ['lap' => $lap, 'nama' => $nama])->setPaper('a4', 'portrait');
        return $pdf->download('laporan-kas-' . $periode . '-' . $nilai . '.pdf');
    }

    /** Catat penjualan ke BSI (transactions_bsi) sebagai pemasukan kas. Boleh dari tanggal tertentu. */
    public function postImporBsi()
    {
        $id = $this->kasId();
        $n = app(KasService::class)->imporPenjualanBsi($id, $id, request('mulai'));
        CRUDBooster::redirect(CRUDBooster::mainpath(), $n > 0 ? "$n penjualan ke BSI dicatat sebagai pemasukan kas." : 'Tidak ada penjualan ke BSI baru untuk dicatat.', $n > 0 ? 'success' : 'info');
    }
}
