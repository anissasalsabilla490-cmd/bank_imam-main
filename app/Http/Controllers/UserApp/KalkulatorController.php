<?php

namespace App\Http\Controllers\UserApp;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

/** Kalkulator estimasi setoran untuk nasabah: memakai harga jenis sampah di BSU-nya. Angka koma didukung. */
class KalkulatorController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $sampah = DB::table('sampah as s')->leftJoin('sampah_categories as c', 'c.id', '=', 's.category_id')
            ->where('s.admin_id', $user->cms_user_id)->orderBy('c.name')->orderBy('s.name')
            ->get(['s.id', 's.name', 's.price_per_kg as harga', 's.poin_per_kg as poin', 'c.name as kategori']);

        return view('user-app/kalkulator', ['sampah' => $sampah]);
    }
}
