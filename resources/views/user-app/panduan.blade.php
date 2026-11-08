@extends('layout.main')
@section('title', 'Panduan Nasabah | EcoBuana')

@section('content')
{{-- ======================== HEADER PANDUAN ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 30px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-35px; right:-35px; width:140px; height:140px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; bottom:0; left:-25px; width:110px; height:110px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2 d-flex align-items-center gap-3" style="position:relative; z-index:1;">
        <a href="{{ url('settings') }}" class="text-white text-decoration-none">
            <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center; backdrop-filter:blur(6px); transition:transform 0.2s ease;"
                 onmouseover="this.style.transform='scale(1.08)'"
                 onmouseout="this.style.transform='scale(1)'">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div class="flex-grow-1">
            <p class="m-0 text-white" style="font-size:11px; opacity:0.85;">Pusat Bantuan</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:17px; letter-spacing:0.3px;">Panduan Nasabah</h5>
        </div>
        <div style="width:38px; height:38px; background:rgba(255,255,255,0.15); border-radius:12px; display:flex; align-items:center; justify-content:center;">
            <i class="bi bi-book text-white" style="font-size:18px;"></i>
        </div>
    </div>

    {{-- Wave SVG --}}
    <svg viewBox="0 0 428 35" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,18 C100,35 328,0 428,18 L428,35 L0,35 Z" fill="#f4f6f8"/>
    </svg>
</header>

{{-- ======================== MAIN CONTENT ======================== --}}
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-2">

        {{-- Tab Switcher --}}
        <div class="d-flex gap-2 mb-3">
            <a href="{{ route('nasabah.panduan', ['tab' => 'buku']) }}" 
               class="btn btn-sm flex-fill rounded-pill text-decoration-none d-flex align-items-center justify-content-center gap-1"
               style="{{ $tab == 'buku' ? 'background:#00a056; color:#fff; border:none; box-shadow:0 4px 12px rgba(0,160,86,0.25);' : 'background:#ffffff; color:#475569; border:1px solid #e2e8f0;' }} font-size:12px; font-weight:600; padding:8px 12px;">
                <span>📘</span> Buku Panduan (PDF)
            </a>
            <a href="{{ route('nasabah.panduan', ['tab' => 'video']) }}" 
               class="btn btn-sm flex-fill rounded-pill text-decoration-none d-flex align-items-center justify-content-center gap-1"
               style="{{ $tab == 'video' ? 'background:#00a056; color:#fff; border:none; box-shadow:0 4px 12px rgba(0,160,86,0.25);' : 'background:#ffffff; color:#475569; border:1px solid #e2e8f0;' }} font-size:12px; font-weight:600; padding:8px 12px;">
                <span>🎥</span> Video Tutorial
            </a>
        </div>

        {{-- TAB 1: BUKU PANDUAN --}}
        @if($tab == 'buku')
            <div class="bg-white rounded-4 p-3 mb-3" style="box-shadow: 0 4px 18px rgba(0,0,0,0.05); border: 1px solid #eef2f6;">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <div class="d-flex align-items-center gap-2">
                        <div style="width:32px; height:32px; background:#e0f2fe; color:#0284c7; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:15px;">
                            <i class="bi bi-file-earmark-pdf"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Buku Panduan Nasabah 2025</h6>
                            <p class="m-0 text-muted" style="font-size:11px;">Format dokumen PDF resmi</p>
                        </div>
                    </div>
                    <a href="{{ asset('files/Buku-Panduan-Bank-Imam-Nasabah-2025.pdf') }}" target="_blank"
                       class="btn btn-sm rounded-pill fw-semibold text-decoration-none"
                       style="background:#f0fdf4; color:#00a056; border:1px solid #bbf7d0; font-size:11px; padding:4px 10px;">
                        <i class="bi bi-box-arrow-up-right me-1"></i> Buka Penuh
                    </a>
                </div>
                <p style="font-size:12px; color:#64748b; line-height:1.5; margin-bottom:12px;">
                    Pelajari panduan tata cara pemilihan sampah, jadwal setor ke Bank Sampah Unit, dan sistem perhitungan tabungan serta poin reward.
                </p>

                {{-- PDF Embed Container --}}
                <div class="rounded-3 overflow-hidden" style="height:520px; border:1px solid #e2e8f0; background:#f8fafc;">
                    <iframe src="{{ asset('files/Buku-Panduan-Bank-Imam-Nasabah-2025.pdf') }}#toolbar=0" 
                            width="100%" height="100%" style="border:none;"
                            title="Buku Panduan Nasabah">
                        <div class="p-4 text-center">
                            <p class="text-muted" style="font-size:13px;">Browser Anda tidak dapat menampilkan pratinjau PDF langsung.</p>
                            <a href="{{ asset('files/Buku-Panduan-Bank-Imam-Nasabah-2025.pdf') }}" target="_blank" class="btn btn-primary-custom btn-sm rounded-pill">
                                Unduh / Buka Dokumen PDF
                            </a>
                        </div>
                    </iframe>
                </div>
            </div>

        {{-- TAB 2: VIDEO TUTORIAL --}}
        @elseif($tab == 'video')
            <div class="bg-white rounded-4 p-3 mb-3" style="box-shadow: 0 4px 18px rgba(0,0,0,0.05); border: 1px solid #eef2f6;">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <div style="width:32px; height:32px; background:#fef3c7; color:#d97706; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:15px;">
                        <i class="bi bi-play-circle-fill"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Video Panduan Nasabah</h6>
                        <p class="m-0 text-muted" style="font-size:11px;">Tutorial langkah demi langkah</p>
                    </div>
                </div>

                {{-- Video Player Container --}}
                <div class="rounded-3 overflow-hidden mb-3" style="background:#000; box-shadow: 0 4px 14px rgba(0,0,0,0.08);">
                    <video width="100%" controls style="display:block; max-height:300px;" preload="metadata">
                        <source src="{{ asset('files/Panduan_nasabah.mp4') }}" type="video/mp4">
                        Browser Anda tidak mendukung pemutar video HTML5.
                    </video>
                </div>

                {{-- Key Steps Card --}}
                <h6 class="fw-bold mb-2" style="font-size:13px; color:#1e293b;">📌 3 Langkah Mudah Menabung Sampah:</h6>
                <div class="d-flex flex-column gap-2">
                    <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                        <span class="badge" style="background:#00a056; color:#fff; font-size:10px; border-radius:50%; width:20px; height:20px; display:flex; align-items:center; justify-content:center; flex-shrink:0; margin-top:2px;">1</span>
                        <div>
                            <span class="fw-bold" style="font-size:12px; color:#1e293b;">Pilah dari Rumah</span>
                            <p class="m-0" style="font-size:11px; color:#64748b;">Pisahkan sampah anorganik (plastik, kardus, kaleng, kertas) dari sampah basah/organik.</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                        <span class="badge" style="background:#00a056; color:#fff; font-size:10px; border-radius:50%; width:20px; height:20px; display:flex; align-items:center; justify-content:center; flex-shrink:0; margin-top:2px;">2</span>
                        <div>
                            <span class="fw-bold" style="font-size:12px; color:#1e293b;">Setor ke Bank Sampah Unit (BSU)</span>
                            <p class="m-0" style="font-size:11px; color:#64748b;">Bawa sampah Anda sesuai jadwal operasional unit BSU terdekat untuk ditimbang.</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                        <span class="badge" style="background:#00a056; color:#fff; font-size:10px; border-radius:50%; width:20px; height:20px; display:flex; align-items:center; justify-content:center; flex-shrink:0; margin-top:2px;">3</span>
                        <div>
                            <span class="fw-bold" style="font-size:12px; color:#1e293b;">Dapatkan Saldo & Poin Reward</span>
                            <p class="m-0" style="font-size:11px; color:#64748b;">Petugas mencatat transaksi, saldo rupiah dan poin langsung masuk ke akun Anda!</p>
                        </div>
                    </div>
                </div>
            </div>
        @endif

    </div>
</main>
@endsection
