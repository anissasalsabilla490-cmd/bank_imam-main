<?php 
namespace App\Http\Controllers\UserApp;

use App\Http\Controllers\Controller;
use App\Models\Point;
use App\Models\Saldo;
use App\Models\Reward;
use App\Models\TukarPoin;
use Illuminate\Support\Facades\DB;

class TukarPoinController extends Controller
{
    public function index()
    {
        $userId = auth()->user()->id;
        $cmsUserId = auth()->user()->cms_user_id; 
        
        $barang = Reward::where('category', 'barang')
            ->where('admin_id', $cmsUserId)
            ->get()
            ->all();
        $uang = Reward::where('category', 'uang')
            ->where('admin_id', $cmsUserId)
            ->get()
            ->all();

        $point = Point::where('user_id', $userId)->first();
        $saldo = Saldo::where('user_id', $userId)->first();

        return view('user-app.tukar-poin.tukar-poin-page')->with([
            'barang' => $barang,
            'uang' => $uang,
            'point' => $point,
            'saldo' => $saldo,
        ]);
    }

    public function show($id)
    {
        $userId = auth()->user()->id;
        $cmsUserId = auth()->user()->cms_user_id;

        $reward = Reward::where('id', $id)
            ->where('admin_id', $cmsUserId)
            ->firstOrFail();

        $point = Point::where('user_id', $userId)->first();
        $saldo = Saldo::where('user_id', $userId)->first();

        return view('user-app/tukar-poin/reward')->with([
            'reward' => $reward, 
            'point' => $point,
            'saldo' => $saldo 
        ]);
    }

    public function detail($id)
    {
        // [SECURITY] IDOR fix: pastikan pesanan poin milik nasabah yang login
        $tukar_poin = TukarPoin::where('id', $id)
            ->where('user_id', auth()->user()->id)
            ->firstOrFail();

        $admin = DB::table('cms_users')->where('id', $tukar_poin->admin_id)->first();

        return view('user-app/detail-pesanan-poin')->with([
            'tukar_poin' => $tukar_poin,
            'bsu' => $admin
        ]);
    }

    public function confirm($id)
    {
        $userId = auth()->user()->id;
        $cmsUserId = auth()->user()->cms_user_id;

        $reward = Reward::where('id', $id)
            ->where('admin_id', $cmsUserId)
            ->firstOrFail();
        $point = Point::where('user_id', $userId)->first();
        $time = date("Y-m-d");
        $point_left = $point->total_points - $reward->price;

        return view('user-app/tukar-poin/konfirmasi-tukar-poin')->with([
            'reward' => $reward,
            'point' => $point,
            'time' => $time,
            'point_left' => $point_left
        ]);
    }

    public function store($id)
    {
        $userId = auth()->user()->id;
        $cmsUserId = auth()->user()->cms_user_id;

        $reward = Reward::where('id', $id)
            ->where('admin_id', $cmsUserId)
            ->firstOrFail();
        $point = Point::where('user_id', $userId)->first();

        if ($point->total_points >= $reward->price && $reward->stock >= 1) {
            TukarPoin::create([
                'user_id' => $userId,
                'reward_id' => $reward->id,
                'quantity' => 1,
                'total_price' => $reward->price,
                'status' => 'Pending'
            ]);

            $reward->update([
                'stock' => ($reward->stock - 1)
            ]);

            $point->update([
                'total_points' => ($point->total_points - $reward->price)
            ]);

            return view('user-app/tukar-poin/success');
        }

        return view('user-app/tukar-poin/failed');
    }
}

?>