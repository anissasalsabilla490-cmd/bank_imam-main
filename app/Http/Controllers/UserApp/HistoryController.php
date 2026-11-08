<?php

namespace App\Http\Controllers\UserApp;

use App\Models\Sampah;
use App\Models\TukarPoin;
use App\Models\TukarSaldo;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class HistoryController extends Controller
{
    public function show($id)
    {
        // [SECURITY] IDOR fix: pastikan transaksi milik nasabah yang login
        $transaction = Transaction::where('id', $id)
            ->where('user_id', auth()->user()->id)
            ->firstOrFail();

        $sampah = Sampah::where('id', $transaction->sampah_id)->first();
        $admin = DB::table('cms_users')->where('id', $transaction->admin_id)->first();
        return view('user-app/detail-transaksi')->with([
            'transaction' => $transaction,
            'sampah' => $sampah,
            'admin' => $admin
        ]);
    }

    public function transactionHistory()
    {
        $dari = request('dari'); $sampai = request('sampai');
        $valid = function ($d) { return $d && preg_match('/^\d{4}-\d{2}-\d{2}$/', $d) ? $d : null; };
        $dari = $valid($dari); $sampai = $valid($sampai);

        $q = Transaction::where('user_id', auth()->user()->id);
        if ($dari)   { $q->whereDate('created_at', '>=', $dari); }
        if ($sampai) { $q->whereDate('created_at', '<=', $sampai); }
        $transactions = $q->latest()->get()->all();

        return view('user-app/riwayat-transaksi')->with(['transactions' => $transactions, 'dari' => $dari, 'sampai' => $sampai]);
    }

    public function pointHistory()
    {
        $transactions = Transaction::where('user_id', auth()->user()->id)->latest()->get()->all();
        return view('user-app/riwayat-poin')->with(['transactions' => $transactions]);
    }

    public function tukarPointHistory()
    {
        $tukarPoin_history = TukarPoin::where('user_id', auth()->user()->id)->latest()->get();
    
        $tukarSaldo_history = TukarSaldo::where('user_id', auth()->user()->id)->latest()->get();
    
        return view('user-app/riwayat-pesanan')->with([
            'tukarPoin_history' => $tukarPoin_history,
            'tukarSaldo_history' => $tukarSaldo_history,
        ]);
    }
    
}
