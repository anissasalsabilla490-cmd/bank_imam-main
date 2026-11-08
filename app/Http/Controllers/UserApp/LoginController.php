<?php

namespace App\Http\Controllers\UserApp;

use App\Models\User;
use App\Models\Point;
use App\Models\Saldo;
use App\Models\TukarPoin;
use App\Models\TukarSaldo;
use App\Models\Transaction;
use App\Models\BSU;
use App\Models\Pengumuman;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function index()
    {
        return view('user-app/login');
    }

    public function store(Request $request)
    {
        $request->validate([
            'username' => ['required', 'string'],
            'password' => ['required']
        ]);

        $loginInput = $request->input('username');
        $fieldType = filter_var($loginInput, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

        $credentials = [
            $fieldType => $loginInput,
            'password' => $request->input('password')
        ];

        $remember = $request->has('remember');

        if (Auth::attempt($credentials, $remember)) {
            $user = Auth::user();
            $point = Point::where('user_id', $user->id)->first();
            $saldo = Saldo::where('user_id', $user->id)->first();
            $transactions = Transaction::where('user_id', $user->id)->latest()->limit(3)->get();
            $tukar_poin = TukarPoin::where('user_id', $user->id)->count();      

            return redirect()->intended('dashboard')->with([
                'user' => $user,
                'point' => $point,
                'saldo' => $saldo,
                'transactions' => $transactions,
                'tukar_poin' => $tukar_poin,
            ]);
        }

        return back()->with('loginError', 'Username atau password salah.')->withInput($request->only('username'));
    }

    public function login()
    {
        $user = Auth::user();
        $point = Point::where('user_id', $user->id)->first();
        $saldo = Saldo::where('user_id', $user->id)->first();
        $transactions = Transaction::where('user_id', $user->id)->latest()->limit(3)->get();

        $total_tukar_poin_count = TukarPoin::where('user_id', $user->id)->count();

        $total_tukar_saldo_count = TukarSaldo::where('user_id', $user->id)->count();

        $total_reward_count = $total_tukar_poin_count + $total_tukar_saldo_count;

        $total_weight = Transaction::where('user_id', $user->id)->sum('total_weight');

        $bsuName = $user->bsu ? $user->bsu->name : null;

        $pengumuman = Pengumuman::where('admin_id', $user->cms_user_id)
        ->where('status', 'On Proses')
        ->first();

        return view('user-app/dashboard')->with([
            'user' => $user,
            'point' => $point,
            'saldo' => $saldo,
            'transactions' => $transactions,
            'total_reward_count' => $total_reward_count,
            'total_weight' => $total_weight, 
            'bsu_name' => $bsuName,
            'pengumuman' => $pengumuman,
            'ringkasan' => \App\Services\RingkasanNasabah::untuk($user),
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }

    public function forgotPasswordDirect(Request $request)
    {
        $request->validate([
            'username'     => ['required', 'string'],
            'email'        => ['required', 'email'],
            'new_password' => ['required', 'string', 'min:6'],
        ], [
            'username.required'     => 'Username wajib diisi.',
            'email.required'        => 'Email wajib diisi.',
            'email.email'           => 'Format email tidak valid.',
            'new_password.required' => 'Password baru wajib diisi.',
            'new_password.min'      => 'Password baru minimal 6 karakter.',
        ]);

        $user = User::where('username', $request->username)
                    ->where('email', $request->email)
                    ->first();

        if (!$user) {
            return back()->with('loginError', 'Data akun tidak ditemukan. Pastikan username dan email sesuai saat pendaftaran.');
        }

        $user->password = Hash::make($request->new_password);
        $user->save();

        return redirect()->route('login')->with('success', 'Password berhasil diperbarui! Silakan masuk dengan kata sandi baru Anda.');
    }
}
