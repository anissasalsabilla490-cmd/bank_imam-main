<?php

namespace App\Http\Controllers\UserApp;

use App\Models\User;
use App\Models\Point;
use App\Models\BSU;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function index()
    {
        $data_bsu = BSU::unit()->get();

        return view('user-app.register', compact('data_bsu'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'username' => 'required|max:255|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6|max:255',
            'cms_user_id' => 'required|exists:cms_users,id,id_cms_privileges,4'
        ]);

        $validatedData['password'] = Hash::make($validatedData['password']);
        
        $selectedBsuId = $request->input('cms_user_id');

        $user = User::create($validatedData);

        Point::create([
            'user_id' => $user->id,
            'total_points' => 0,
        ]);

        $selectedBsu = BSU::find($selectedBsuId);

        return redirect('/login')->with('success', 'Registrasi Berhasil! Silahkan Login.');
    }
}
