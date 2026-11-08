<?php

namespace App\Http\Controllers\UserApp;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PanduanController extends Controller
{

    public function index(Request $request)
    {
        // tab default = buku
        $tab = $request->get('tab', 'buku');
        return view('user-app.panduan', compact('tab'));

    }
}
