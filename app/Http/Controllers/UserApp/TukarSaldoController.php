<?php

namespace App\Http\Controllers\UserApp;

use App\Http\Controllers\Controller;
use App\Models\Point;
use App\Models\Saldo;
use App\Models\Reward;
use App\Models\TukarPoin;
use App\Models\TukarSaldo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Exceptions\InsufficientBalanceException;
use App\Services\SaldoService;

class TukarSaldoController extends Controller
{
    public function index()
    {
        $cmsUserId = auth()->user()->cms_user_id;
        
        $barang = Reward::where('category', 'barang')
            ->where('admin_id', $cmsUserId)
            ->get();
        $uang = Reward::where('category', 'uang')
            ->where('admin_id', $cmsUserId)
            ->get();

        $point = Point::where('user_id', auth()->user()->id)->first();
        $saldo = Saldo::where('user_id', auth()->user()->id)->first();
        
        return view('user-app.tukar-poin.tukar-poin-page')->with([
            'barang' => $barang,
            'uang' => $uang,
            'point' => $point,
            'saldo' => $saldo,
        ]);
    }

    public function show($id)
    {
        $cmsUserId = auth()->user()->cms_user_id; 

        $reward = Reward::where('id', $id)
            ->where('admin_id', $cmsUserId)
            ->firstOrFail();
        $point = Point::where('user_id', auth()->user()->id)->first();
        $saldo = Saldo::where('user_id', auth()->user()->id)->first();

        return view('user-app/tukar-saldo/reward')->with([
            'reward' => $reward, 
            'point' => $point,
            'saldo' => $saldo 
        ]);
    }

    public function detail($id)
    {
        // [SECURITY] IDOR fix: pastikan pesanan saldo milik nasabah yang login
        $tukar_saldo = TukarSaldo::where('id', $id)
            ->where('user_id', auth()->user()->id)
            ->firstOrFail();

        $admin = DB::table('cms_users')->where('id', $tukar_saldo->admin_id)->first();

        return view('user-app/detail-pesanan-saldo')->with([
            'tukar_saldo' => $tukar_saldo,
            'bsu' => $admin
        ]);
    }

    public function confirm(Request $request, $id)
    {
        $cmsUserId = auth()->user()->cms_user_id; 

        $reward = Reward::where('id', $id)
            ->where('admin_id', $cmsUserId)
            ->firstOrFail();
        $saldo = Saldo::where('user_id', auth()->user()->id)->first()
            ?: new Saldo(['user_id' => auth()->user()->id, 'total_saldo' => 0]);

        // Hanya bilangan bulat positif (mencegah nominal desimal/negatif).
        $request->validate([
            'selected_nominal' => 'required|integer|min:1|max:100000000',
        ]);

        $selected_nominal = (int) $request->input('selected_nominal');
        $time = date("Y-m-d");
        $saldo_left = $saldo->total_saldo - $selected_nominal;

        return view('user-app/tukar-saldo/konfirmasi-tukar-saldo')->with([
            'reward' => $reward,
            'saldo' => $saldo,
            'time' => $time,
            'saldo_left' => $saldo_left,
            'selected_nominal' => $selected_nominal
        ]);
    }

    public function store(Request $request, $id)
    {
        $cmsUserId = auth()->user()->cms_user_id; 
        $userId = auth()->user()->id;

        // [SECURITY] store() bisa dipanggil langsung tanpa lewat confirm(), jadi validasi ulang di sini.
        // Sebelumnya nominal negatif lolos dan justru MENAMBAH saldo.
        $validator = Validator::make($request->all(), [
            'selected_nominal' => 'required|integer|min:1|max:100000000',
        ]);
        if ($validator->fails()) {
            return view('user-app/tukar-saldo/failed');
        }
        $selected_nominal = (int) $request->input('selected_nominal');

        try {
            // Satu transaksi atomik: kunci reward (stok) + kunci saldo + ledger.
            DB::transaction(function () use ($id, $cmsUserId, $userId, $selected_nominal) {
                $reward = Reward::where('id', $id)
                    ->where('admin_id', $cmsUserId)
                    ->lockForUpdate()
                    ->firstOrFail();

                if ($reward->stock < 1) {
                    throw new \DomainException('Stok habis');
                }

                $tukar = TukarSaldo::create([
                    'user_id' => $userId,
                    'reward_id' => $reward->id,
                    'quantity' => 1,
                    'total_price' => $selected_nominal,
                    'status' => 'Pending'
                ]);

                // Melempar InsufficientBalanceException (dan membatalkan semuanya) bila saldo kurang.
                app(SaldoService::class)->debit(
                    $userId, $selected_nominal, 'tukar_saldo', 'tukar_saldo', $tukar->id,
                    'Tukar saldo reward #' . $reward->id
                );

                $reward->update([
                    'stock' => $reward->stock - 1
                ]);
            });
        } catch (InsufficientBalanceException $e) {
            return view('user-app/tukar-saldo/failed');
        } catch (\DomainException $e) {
            // Hanya stok habis; error database/lainnya sengaja TIDAK ditelan agar terlihat di log.
            return view('user-app/tukar-saldo/failed');
        }

        return view('user-app/tukar-saldo/success');
    }
}
