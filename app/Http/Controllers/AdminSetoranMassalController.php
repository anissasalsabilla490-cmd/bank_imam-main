<?php namespace App\Http\Controllers;

use CRUDBooster;
use DB;
use App\Http\Controllers\Concerns\CekPeran;
use App\Services\SetoranService;

/** Input setoran sampah massal + riwayat setoran per periode (khusus BSU). */
class AdminSetoranMassalController extends \crocodicstudio\crudbooster\controllers\CBController
{
    use CekPeran;

    public function cbInit()
    {
        $this->title_field = "id";
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
        $this->table = "transactions";
        $this->col = [];
        $this->form = [];
    }

    private function bsuId()
    {
        $this->wajibPeran([4]);
        return (int) CRUDBooster::myId();
    }

    public function getIndex()
    {
        $adminId = $this->bsuId();
        $this->cbLoader();
        $sampah = DB::table('sampah as s')->leftJoin('sampah_categories as c', 'c.id', '=', 's.category_id')
            ->where('s.admin_id', $adminId)->orderBy('c.name')->orderBy('s.name')
            ->get(['s.id', 's.name', 's.price_per_kg as harga', 's.poin_per_kg as poin', 'c.name as kategori']);
        return view('admin.setoran_massal', [
            'page_title' => 'Setoran Massal', 'sampah' => $sampah, 'hariIni' => now()->toDateString(),
        ]);
    }

    public function getCariNasabah()
    {
        $adminId = $this->bsuId();
        $rows = app(SetoranService::class)->cariNasabah($adminId, request('q'));
        return response()->json($rows->map(function ($u) {
            return ['id' => $u->id, 'nama' => $u->username, 'hp' => $u->phone_number, 'email' => $u->email];
        }));
    }

    public function getSalinTerakhir()
    {
        $adminId = $this->bsuId();
        $r = app(SetoranService::class)->salinTerakhir($adminId, (int) request('user_id'));
        return response()->json($r);
    }

    public function postSimpan()
    {
        $adminId = $this->bsuId();
        try {
            $hasil = app(SetoranService::class)->simpan(
                $adminId, request('tanggal'), (array) request('baris', []), $adminId, (string) request('token')
            );
            CRUDBooster::insertLog('Setoran massal: ' . $hasil['jumlah'] . ' baris, ' . $this->rupiah($hasil['total_rupiah']));
            return response()->json(['ok' => true, 'hasil' => $hasil]);
        } catch (\InvalidArgumentException $e) {
            return response()->json(['ok' => false, 'pesan' => $e->getMessage()], 422);
        } catch (\Throwable $e) {
            report($e);
            return response()->json(['ok' => false, 'pesan' => 'Terjadi kesalahan, data tidak disimpan. Coba lagi.'], 500);
        }
    }

    /** Riwayat setoran + penambahan saldo nasabah, dengan filter periode & nasabah. */
    public function getRiwayat()
    {
        $adminId = $this->bsuId();
        $this->cbLoader();
        $dari = request('dari'); $sampai = request('sampai'); $q = trim((string) request('q'));

        $base = DB::table('transactions as t')->join('users as u', 'u.id', '=', 't.user_id')
            ->leftJoin('sampah as s', 's.id', '=', 't.sampah_id')->where('t.admin_id', $adminId);
        if ($dari)   { $base->whereDate('t.created_at', '>=', $dari); }
        if ($sampai) { $base->whereDate('t.created_at', '<=', $sampai); }
        if ($q !== '') {
            $like = '%' . str_replace(['%', '_'], ['\%', '\_'], $q) . '%';
            $base->where(function ($w) use ($like) { $w->where('u.username', 'like', $like)->orWhere('u.phone_number', 'like', $like); });
        }
        $tot = (clone $base)->selectRaw('COUNT(*) n, COALESCE(SUM(t.total_weight),0) kg, COALESCE(SUM(t.total_income),0) rp, COALESCE(SUM(t.point_received),0) poin')->first();
        $rows = $base->orderByDesc('t.created_at')->orderByDesc('t.id')
            ->select('t.id', 't.created_at', 'u.username', 's.name as sampah', 't.total_weight', 't.total_income', 't.point_received')
            ->paginate(50)->appends(request()->query());

        return view('admin.setoran_riwayat', [
            'page_title' => 'Riwayat Setoran', 'rows' => $rows, 'tot' => $tot, 'dari' => $dari, 'sampai' => $sampai, 'q' => $q,
        ]);
    }
}
