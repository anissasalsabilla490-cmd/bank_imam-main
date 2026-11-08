@extends('layout.main')

@section('title', 'Profil | EcoBuana')
@section('content')

{{-- Profile Header --}}
<div style="background: linear-gradient(135deg, #00c96e 0%, #005c2e 100%); padding: 2rem 1rem 4rem; position:relative; overflow:hidden;">
    {{-- Decorative circles --}}
    <div style="position:absolute; top:-20px; right:-20px; width:100px; height:100px; background:rgba(255,255,255,0.07); border-radius:50%;"></div>
    <div style="position:absolute; bottom:-30px; left:-20px; width:120px; height:120px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>
</div>

{{-- Avatar & Info --}}
<div class="text-center" style="margin-top: -50px; position:relative; z-index:10;">
    @php
        $pPic = $user->picture ?? '';
        $pPicUrl = (strpos($pPic, 'data:image') === 0 || filter_var($pPic, FILTER_VALIDATE_URL)) ? $pPic : (!empty($pPic) ? asset($pPic) : asset('images/profile3.png'));
    @endphp
    <img class="rounded-circle" style="width:96px; height:96px; border: 4px solid #ffffff; box-shadow: 0 4px 16px rgba(0,0,0,0.15); object-fit:cover;"
        src="{{ $pPicUrl }}"
        onerror="this.onerror=null; this.src='{{ asset('images/profile3.png') }}';">
    <h5 id="username" name="username" class="fw-bold mt-2 mb-0" style="font-size:18px;">
        {{ $user->username ?? 'Anonim' }}
    </h5>
    <p style="color:#6b7280; font-size:13px; margin:2px 0;">{{ $user->email ?? 'abc@gmail.com' }}</p>
    <span style="background:#e6f7ef; color:#00a056; font-size:12px; font-weight:600; padding: 3px 12px; border-radius:50px;">
        {{ $bsu_name ?? 'Bank Sampah Unit' }}
    </span>
</div>

<main class="main-container px-3 pt-4 pb-5">

    {{-- Menu Items --}}
    <div style="display:flex; flex-direction:column; gap:8px;">

        <a href="/profile" class="text-decoration-none">
            <div class="d-flex align-items-center justify-content-between px-4 py-3 rounded-3 bg-white shadow-sm" style="transition: all 0.2s ease;" onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='translateY(0)'">
                <div class="d-flex align-items-center gap-3">
                    <div style="width:40px; height:40px; background:#e6f7ef; border-radius:12px; display:flex; align-items:center; justify-content:center;">
                        <i class="bi bi-person-fill" style="font-size:18px; color:#00a056;"></i>
                    </div>
                    <p class="mb-0 fw-semibold" style="font-size:14px; color:#1a1a2e;">Edit Profil</p>
                </div>
                <i class="bi bi-chevron-right" style="font-size:14px; color:#9ca3af;"></i>
            </div>
        </a>

        <a href="{{ route('kalkulator') }}" class="text-decoration-none">
            <div class="d-flex align-items-center justify-content-between px-4 py-3 rounded-3 bg-white shadow-sm">
                <div class="d-flex align-items-center gap-3">
                    <div style="width:40px; height:40px; background:#fef3c7; border-radius:12px; display:flex; align-items:center; justify-content:center;">
                        <i class="bi bi-calculator-fill" style="font-size:18px; color:#d97706;"></i>
                    </div>
                    <p class="mb-0 fw-semibold" style="font-size:14px; color:#1a1a2e;">Kalkulator Setoran</p>
                </div>
                <i class="bi bi-chevron-right" style="font-size:14px; color:#9ca3af;"></i>
            </div>
        </a>

        <a href="{{ route('nasabah.panduan') }}" class="text-decoration-none">
            <div class="d-flex align-items-center justify-content-between px-4 py-3 rounded-3 bg-white shadow-sm" style="transition: all 0.2s ease;" onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='translateY(0)'">
                <div class="d-flex align-items-center gap-3">
                    <div style="width:40px; height:40px; background:#e8f0fe; border-radius:12px; display:flex; align-items:center; justify-content:center;">
                        <i class="bi bi-journal-text" style="font-size:18px; color:#1e4d8c;"></i>
                    </div>
                    <p class="mb-0 fw-semibold" style="font-size:14px; color:#1a1a2e;">Panduan Nasabah</p>
                </div>
                <i class="bi bi-chevron-right" style="font-size:14px; color:#9ca3af;"></i>
            </div>
        </a>

        <div class="d-flex align-items-center justify-content-between px-4 py-3 rounded-3 bg-white shadow-sm">
            <div class="d-flex align-items-center gap-3">
                <div style="width:40px; height:40px; background:#fff0e6; border-radius:12px; display:flex; align-items:center; justify-content:center;">
                    <i class="bi bi-pencil-square" style="font-size:18px; color:#d07000;"></i>
                </div>
                <p class="mb-0 fw-semibold" style="font-size:14px; color:#1a1a2e;">Syarat Dan Ketentuan</p>
            </div>
            <i class="bi bi-chevron-right" style="font-size:14px; color:#9ca3af;"></i>
        </div>

        <div class="d-flex align-items-center justify-content-between px-4 py-3 rounded-3 bg-white shadow-sm">
            <div class="d-flex align-items-center gap-3">
                <div style="width:40px; height:40px; background:#f3e8ff; border-radius:12px; display:flex; align-items:center; justify-content:center;">
                    <i class="bi bi-shield-lock-fill" style="font-size:18px; color:#7c3aed;"></i>
                </div>
                <p class="mb-0 fw-semibold" style="font-size:14px; color:#1a1a2e;">Tentang Kami</p>
            </div>
            <i class="bi bi-chevron-right" style="font-size:14px; color:#9ca3af;"></i>
        </div>
    </div>

    {{-- Aksesibilitas & Tampilan --}}
    <div id="aksesibilitas" class="mt-4 px-1">
        <div class="d-flex align-items-center gap-2 mb-2">
            <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
            <h6 class="fw-bold m-0" style="font-size:15px;">Aksesibilitas &amp; Tampilan</h6>
        </div>
        <p style="font-size:12px; color:#6b7280;">Atur ukuran huruf, ukuran ikon, dan warna agar nyaman dibaca.</p>
        <div id="a11y-full"></div>
    </div>
    <script>window.A11Y_NO_WIDGET = true; A11Y.panel(document.getElementById('a11y-full'));</script>

    {{-- Logout — POST form untuk mencegah CSRF logout attack --}}
    <div class="mt-4 px-2 pb-5">
        <form method="POST" action="{{ route('logout') }}" id="logoutForm">
            @csrf
            <button type="submit" class="btn w-100 py-3 fw-bold rounded-3"
                    style="background:#fff1f2; color:#dc2626; font-size:14px; border: 1.5px solid #fecaca; letter-spacing:0.3px;">
                <i class="bi bi-box-arrow-right me-2"></i>Keluar
            </button>
        </form>
    </div>

</main>
@endsection