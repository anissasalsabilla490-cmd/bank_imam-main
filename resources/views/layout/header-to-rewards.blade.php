@extends('layout.main')

@section('content')
{{-- ======================== HEADER REWARDS NAV ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 70px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-40px; right:-40px; width:180px; height:180px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; top:20px; right:80px; width:80px; height:80px; background:rgba(255,255,255,0.06); border-radius:50%;"></div>
    <div style="position:absolute; bottom:-20px; left:-30px; width:120px; height:120px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2" style="position:relative; z-index:1;">
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center gap-3">
                <a href="{{ url('/tukar-poin') }}" class="text-white text-decoration-none">
                    <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center; backdrop-filter:blur(6px); transition:transform 0.2s ease;"
                         onmouseover="this.style.transform='scale(1.08)'"
                         onmouseout="this.style.transform='scale(1)'">
                        <i class="bi bi-arrow-left" style="font-size:18px;"></i>
                    </div>
                </a>
                <div>
                    <p class="m-0 text-white" style="font-size:11px; opacity:0.85; font-weight:500;">Halo, {{ auth()->user()->username ?? 'Nasabah' }} 👋</p>
                    <h5 class="m-0 text-white fw-bold" style="font-size:18px; letter-spacing:0.3px;">
                        {{ $reward->name ?? 'Tukar Saldo' }}
                    </h5>
                </div>
            </div>
            @php
                $rPic = auth()->user()->picture ?? '';
                $rPicUrl = (strpos($rPic, 'data:image') === 0 || filter_var($rPic, FILTER_VALIDATE_URL)) ? $rPic : (!empty($rPic) ? asset($rPic) : asset('images/profile3.png'));
            @endphp
            <img src="{{ $rPicUrl }}" alt="profile"
                 onerror="this.onerror=null; this.src='{{ asset('images/profile3.png') }}';"
                 style="width: 44px; height:44px; border: 2.5px solid rgba(255,255,255,0.5); object-fit:cover;" class="rounded-circle">
        </div>
    </div>

    {{-- Saldo & Poin Card - Frosted Glass --}}
    <div class="px-4 mt-3 pt-1" style="position:relative; z-index:1;">
        <div class="rounded-4 px-4 py-3 d-flex justify-content-around align-items-center"
             style="background:rgba(255,255,255,0.18); backdrop-filter:blur(10px); border: 1px solid rgba(255,255,255,0.25); box-shadow: 0 4px 15px rgba(0,0,0,0.06);">
            <div class="text-center text-white">
                <p class="m-0" style="font-size:11px; opacity:0.85; font-weight:500;">💰 Saldo Saat Ini</p>
                <p class="m-0 fw-bold" style="font-size:20px; letter-spacing:-0.5px;">
                    Rp{{ number_format($saldo->total_saldo, 0, ',', '.') }}
                </p>
            </div>
            <div style="width:1px; height:40px; background:rgba(255,255,255,0.3);"></div>
            <div class="text-center text-white">
                <p class="m-0 d-flex align-items-center justify-content-center gap-1" style="font-size:11px; opacity:0.9; font-weight:500;">
                    <i class="bi bi-star-fill text-warning" style="font-size:11px;"></i> Poin Saat Ini
                </p>
                <p class="m-0 fw-bold" style="font-size:20px; letter-spacing:-0.5px;">
                    {{ $point->total_points ?? 0 }}
                </p>
            </div>
        </div>
    </div>

    {{-- Wave --}}
    <svg viewBox="0 0 428 50" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,25 C100,50 328,0 428,25 L428,50 L0,50 Z" fill="#f4f6f8"/>
    </svg>
</header>

<main id="reward-page" class="main-container" style="background:#f4f6f8; min-height:100vh;">
    @yield('tukar-point-content')
</main>

@endsection

@yield('scripts')