<?php 
// app/Http/Controllers/SalesController.php

namespace App\Http\Controllers\UserApp;

use Illuminate\Http\Request;
use App\Models\Sale;
use App\Http\Controllers\Controller;

class SalesController extends Controller
{
    public function store(Request $request)
    {
        // [SECURITY] Validasi semua input dari user
        $request->validate([
            'items'        => ['required', 'string'],
            'total_weight' => ['required', 'numeric', 'min:0.01', 'max:9999'],
            'total_price'  => ['required', 'numeric', 'min:0', 'max:999999999'],
        ]);

        $items = json_decode($request->input('items'), true);

        // [SECURITY] Pastikan items adalah array valid
        if (!is_array($items) || empty($items)) {
            return redirect()->back()->withErrors(['items' => 'Data sampah tidak valid.']);
        }

        $totalWeight = $request->input('total_weight');
        $totalPrice  = $request->input('total_price');

        $sale = Sale::create([
            'items'        => $items,
            'total_weight' => $totalWeight,
            'total_price'  => $totalPrice,
            'foto'         => '',
        ]);

        // [SECURITY] Simpan sale ID di session agar tidak bocor ke user lain
        session(['last_sale_id' => $sale->id]);

        session()->forget('cartItems');
        session()->forget('totalWeight');
        session()->forget('totalPrice');

        return redirect()->route('transaction.details');
    }

    public function showTransactionDetails()
    {
        // [SECURITY] Ambil berdasarkan sale ID di session (bukan latest() global)
        $saleId = session('last_sale_id');
        if (!$saleId) {
            return redirect('/dashboard')->with('error', 'Tidak ada transaksi ditemukan.');
        }

        $sale = Sale::findOrFail($saleId);
        $items = $sale->items;
        $totalWeight = $sale->total_weight;
        $totalPrice  = $sale->total_price;

        return view('user-app/details', compact('items', 'totalWeight', 'totalPrice'));
    }
}


?>