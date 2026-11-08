<?php

namespace App\Http\Controllers\UserApp;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{

    public function profile()
    {
        return view('user-app/profile');
    }

    public function settings()
    {
        $user = Auth::user();
        $bsuName = $user->bsu ? $user->bsu->name : null;

        return view('user-app/pengaturan', [
            'user' => $user,
            'bsu_name' => $bsuName
        ]);
    }
}
