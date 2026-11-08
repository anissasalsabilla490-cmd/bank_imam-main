@extends('layout.main')

@section('content')
{{-- ======================== HEADER REWARDS NAV ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 28px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-35px; right:-35px; width:140px; height:140px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; bottom:0; left:-25px; width:110px; height:110px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2 d-flex align-items-center gap-3" style="position:relative; z-index:1;">
        <a href="{{ url('/tukar-poin') }}" class="text-white text-decoration-none">
            <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center; backdrop-filter:blur(6px); transition:transform 0.2s ease;"
                 onmouseover="this.style.transform='scale(1.08)'"
                 onmouseout="this.style.transform='scale(1)'">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div class="flex-grow-1">
            <p class="m-0 text-white" style="font-size:11px; opacity:0.85;">Rewards & Penukaran</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:17px; letter-spacing:0.3px;">
                @yield('transaction-title')
            </h5>
        </div>
    </div>

    {{-- Wave SVG --}}
    <svg viewBox="0 0 428 35" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,18 C100,35 328,0 428,18 L428,35 L0,35 Z" fill="#f4f6f8"/>
    </svg>
</header>

@yield('transaction-content')
@endsection
