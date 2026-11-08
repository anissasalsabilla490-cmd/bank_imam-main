<?php

namespace App\Http\Controllers\UserApp;

use App\Models\EducationalNews;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class EducationalNewsController extends Controller
{
    public function index()
    {
        // Mengambil semua data berita edukasi dan mengurutkannya berdasarkan waktu updated_at
        $educationalNews = EducationalNews::orderBy('updated_at', 'desc')->get();

        // Proses untuk mengekstrak domain dan menghitung waktu yang telah berlalu
        $educationalNews->transform(function ($news) {
            $news->domain = $this->getHostFromUrl($news->url); // Menambahkan properti 'domain' ke dalam objek berita

            // Menghitung waktu yang telah berlalu
            $news->time_elapsed = Carbon::parse($news->updated_at)->diffForHumans();

            return $news;
        });

        // Kirim data ke view
        return view('user-app.edukasi', compact('educationalNews'));
    }
    // Fungsi helper untuk mengambil domain utama dari URL
    private function getHostFromUrl($url)
    {
        if (empty($url) || trim($url) === '') {
            return 'EcoBuana Edukasi';
        }
        if (!preg_match('~^(?:f|ht)tps?://~i', $url)) {
            $url = 'https://' . ltrim($url, '/');
        }
        $parsedUrl = parse_url($url);
        $host = $parsedUrl['host'] ?? 'EcoBuana Edukasi';
        if (empty($host) || $host === 'undefined') {
            return 'EcoBuana Edukasi';
        }
        return preg_replace('/^www\./', '', $host);
    }
}

