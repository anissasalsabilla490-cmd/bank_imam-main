<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use Request;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\HargaService;

/** Harga & margin BSU berdasarkan harga acuan BSI. */
class AdminHargaBsuController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "name";
        $this->limit = "20";
        $this->orderby = "id,desc";
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

    private function aman()
    {
        $this->wajibPeran([4]);
        return (int) CRUDBooster::myId();
    }

    public function getIndex()
    {
        $adminId = $this->aman();
        $this->cbLoader();

        $master = DB::table('bsi_harga')->where('is_active', 1)->orderBy('kategori')->orderBy('nama')->get();
        $milik = DB::table('sampah')->where('admin_id', $adminId)->whereNotNull('bsi_harga_id')->get()->keyBy('bsi_harga_id');

        $baris = [];
        foreach ($master as $m) {
            $s = $milik->get($m->id);
            $baris[] = (object) [
                'master' => $m, 'sampah' => $s,
                'harga_nasabah' => $s ? (int) $s->price_per_kg : null,
            ];
        }
        $belumTerhubung = DB::table('sampah')->where('admin_id', $adminId)->whereNull('bsi_harga_id')
            ->orderBy('name')->get(['id', 'name', 'price_per_kg']);

        $perubahanBaru = DB::table('bsi_harga_riwayat as r')->join('bsi_harga as b', 'b.id', '=', 'r.bsi_harga_id')
            ->whereNotNull('r.harga_lama')->where('r.tanggal', '>=', now()->subDays(14)->toDateString())
            ->orderByDesc('r.id')->limit(8)->get(['b.nama', 'r.harga_lama', 'r.harga_baru', 'r.tanggal']);

        return view('admin.harga_bsu', [
            'page_title' => 'Harga & Margin Sampah',
            'baris' => $baris, 'belumTerhubung' => $belumTerhubung,
            'master' => $master, 'perubahanBaru' => $perubahanBaru,
        ]);
    }

    public function postSimpan()
    {
        $adminId = $this->aman();
        $svc = app(HargaService::class);
        $data = (array) request('margin', []);
        $ok = 0; $gagal = [];
        foreach ($data as $sampahId => $f) {
            try {
                $svc->aturMargin((int) $sampahId, $adminId, $f['type'] ?? 'nominal', $f['value'] ?? 0, !empty($f['auto']), $adminId);
                $ok++;
            } catch (\Throwable $e) {
                $gagal[] = '#' . (int) $sampahId . ': ' . $e->getMessage();
            }
        }
        $pesan = "Margin $ok jenis sampah disimpan." . ($gagal ? ' Gagal: ' . implode('; ', $gagal) : '');
        CRUDBooster::redirect(CRUDBooster::mainpath(), $pesan, $gagal ? 'warning' : 'success');
    }

    public function postAktifkan()
    {
        $adminId = $this->aman();
        try {
            app(HargaService::class)->aktifkan($adminId, (int) request('bsi_harga_id'), request('type', 'nominal'), request('value', 0), $adminId);
        } catch (\Throwable $e) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), $e->getMessage(), 'warning');
        }
        CRUDBooster::redirect(CRUDBooster::mainpath(), 'Jenis sampah diaktifkan.', 'success');
    }

    public function postHubungkan()
    {
        $adminId = $this->aman();
        try {
            $m = app(HargaService::class)->hubungkan($adminId, (int) request('sampah_id'), (int) request('bsi_harga_id'), $adminId);
        } catch (\Throwable $e) {
            CRUDBooster::redirect(CRUDBooster::mainpath(), $e->getMessage(), 'warning');
        }
        CRUDBooster::redirect(CRUDBooster::mainpath(), 'Terhubung. Harga beli nasabah tetap; margin awal ' . $this->rupiah($m) . '/kg.', 'success');
    }

    public function postPutuskan()
    {
        $adminId = $this->aman();
        app(HargaService::class)->putuskan($adminId, (int) request('sampah_id'));
        CRUDBooster::redirect(CRUDBooster::mainpath(), 'Sambungan ke harga BSI diputus. Harga kini diatur manual.', 'success');
    }

    public function getRiwayat()
    {
        $adminId = $this->aman();
        $this->cbLoader();
        $dari = request('dari'); $sampai = request('sampai');
        $q = app(HargaService::class)->riwayatBsu($adminId, 1000);
        if ($dari) { $q = $q->filter(function ($r) use ($dari) { return $r->tanggal >= $dari; }); }
        if ($sampai) { $q = $q->filter(function ($r) use ($sampai) { return $r->tanggal <= $sampai; }); }
        return view('admin.harga_bsu_riwayat', [
            'page_title' => 'Riwayat Perubahan Harga', 'rows' => $q->values(), 'dari' => $dari, 'sampai' => $sampai,
        ]);
    }
}
