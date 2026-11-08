@extends('layout.main')

@section('title', 'Beranda | MeBank')

@section('content')
{{-- ======================== HEADER BERANDA ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 60px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-40px; right:-40px; width:200px; height:200px; background:rgba(255,255,255,0.07); border-radius:50%;"></div>
    <div style="position:absolute; top:30px; right:90px; width:70px; height:70px; background:rgba(255,255,255,0.06); border-radius:50%;"></div>
    <div style="position:absolute; bottom:20px; left:-30px; width:120px; height:120px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2 d-flex justify-content-between align-items-center" style="position:relative; z-index:1;">
        <div>
            <p class="m-0 text-white" style="font-size:12px; opacity:0.8; font-weight:500;">Selamat Datang 👋</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:20px;">{{ $user->username }}</h5>
        </div>
        @php
            $dPic = $user->picture ?? '';
            $dPicUrl = (strpos($dPic, 'data:image') === 0 || filter_var($dPic, FILTER_VALIDATE_URL)) ? $dPic : (!empty($dPic) ? asset($dPic) : asset('images/profile3.png'));
        @endphp
        <img src="{{ $dPicUrl }}" alt="profile"
             onerror="this.onerror=null; this.src='{{ asset('images/profile3.png') }}';"
             style="width: 46px; height:46px; border: 2.5px solid rgba(255,255,255,0.5); object-fit:cover;" class="rounded-circle">
    </div>

    {{-- Pengumuman --}}
    @if($pengumuman)
    <div class="mx-4 mt-2 mb-1 px-3 py-2 rounded-3" style="background:rgba(255,255,255,0.15); backdrop-filter:blur(6px); border:1px solid rgba(255,255,255,0.2); position:relative; z-index:1;">
        <p class="m-0 text-white" style="font-size:12px; opacity:0.85; font-weight:500;">📢 {{ $pengumuman->deskripsi }}</p>
    </div>
    @endif

    {{-- BSU Info --}}
    <div class="mx-4 mt-2" style="position:relative; z-index:1;">
        <p class="m-0 text-white" style="font-size:12px; opacity:0.75;">
            🏦 <span style="font-weight:600;">{{ $bsu_name }}</span>
        </p>
    </div>

    {{-- Wave --}}
    <svg viewBox="0 0 428 50" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,25 C100,50 328,0 428,25 L428,50 L0,50 Z" fill="#f4f6f8"/>
    </svg>
</header>

{{-- ======================== BODY ======================== --}}
<main style="background:#f4f6f8; min-height:100vh;" class="pb-5">

    {{-- ===== Stats Cards (floating over header) ===== --}}
    <div class="px-4" style="margin-top: -28px; position:relative; z-index:10;">
        <div class="rounded-4 overflow-hidden" style="background:#ffffff; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
            <div class="d-flex">
                {{-- 1. Poin --}}
                <div class="flex-fill text-center py-3 px-2 d-flex flex-column justify-content-between" style="border-right: 1px solid #f0f0f0;">
                    <div class="d-flex align-items-center justify-content-center" style="min-height: 28px;">
                        <p class="m-0 fw-bold" style="font-size:18px; color:#00a056; line-height:1.2;">
                            @if($point->total_points != 0) {{ $point->total_points }} @else 0 @endif
                        </p>
                    </div>
                    <p class="m-0 d-flex align-items-center justify-content-center gap-1 mt-1" style="font-size:11px; color:#6b7280; font-weight:500;">
                        <i class="bi bi-star-fill" style="color:#f59e0b; font-size:10px;"></i> Poin
                    </p>
                </div>

                {{-- 2. Saldo --}}
                <div class="flex-fill text-center py-3 px-2 d-flex flex-column justify-content-between" style="border-right: 1px solid #f0f0f0;">
                    <div class="d-flex align-items-center justify-content-center" style="min-height: 28px;">
                        <p class="m-0 fw-bold" style="font-size:15px; color:#1e4d8c; line-height:1.2;">
                            Rp{{ number_format($saldo->total_saldo, 0, ',', '.') }}
                        </p>
                    </div>
                    <p class="m-0 d-flex align-items-center justify-content-center gap-1 mt-1" style="font-size:11px; color:#6b7280; font-weight:500;">
                        <span>💰</span> Saldo
                    </p>
                </div>

                {{-- 3. Sampah --}}
                <div class="flex-fill text-center py-3 px-2 d-flex flex-column justify-content-between">
                    <div class="d-flex align-items-center justify-content-center" style="min-height: 28px;">
                        <p class="m-0 fw-bold" style="font-size:18px; color:#d07000; line-height:1.2;">
                            {{ $total_weight }} kg
                        </p>
                    </div>
                    <p class="m-0 d-flex align-items-center justify-content-center gap-1 mt-1" style="font-size:11px; color:#6b7280; font-weight:500;">
                        <span>♻️</span> Sampah
                    </p>
                </div>
            </div>
        </div>
    </div>

    {{-- ===== Banner CTA ===== --}}
    <div class="px-4 mt-4">
        <a href="/tukar-poin" class="d-block text-decoration-none">
            <div class="rounded-4 overflow-hidden d-flex align-items-stretch"
                 style="background: linear-gradient(135deg, #00c96e 0%, #005c2e 100%); box-shadow: 0 6px 20px rgba(0,160,86,0.3); min-height:90px; position:relative;">
                {{-- Decorative circle --}}
                <div style="position:absolute; right:-20px; top:-20px; width:100px; height:100px; background:rgba(255,255,255,0.1); border-radius:50%;"></div>
                <div class="d-flex align-items-center justify-content-between w-100 px-4 py-3" style="position:relative; z-index:1;">
                    <div>
                        <p class="m-0 text-white fw-bold" style="font-size:16px;">Tukar Poinmu Sekarang!</p>
                        <p class="m-0 text-white" style="font-size:12px; opacity:0.85;">Dapatkan reward menarik 🎁</p>
                        <span class="d-inline-block mt-2 px-3 py-1 rounded-pill text-white fw-semibold"
                              style="background:rgba(255,255,255,0.2); font-size:11px; border:1px solid rgba(255,255,255,0.3);">
                            Klik di sini →
                        </span>
                    </div>
                    <i class="bi bi-gift-fill text-white" style="font-size: 3rem; opacity:0.9;"></i>
                </div>
            </div>
        </a>
    </div>

    {{-- ===== Quick Actions ===== --}}
    <div class="px-4 mt-4">
        <div class="d-flex gap-3">
            <a href="/kategori-sampah" class="text-decoration-none flex-fill">
                <div class="text-center rounded-3 py-3 px-2"
                     style="background:#ffffff; box-shadow: 0 1px 6px rgba(0,0,0,0.06); border:1px solid #f0f0f0;">
                    <div style="width:40px; height:40px; background:#e6f7ef; border-radius:12px; display:flex; align-items:center; justify-content:center; margin:0 auto 6px;">
                        <i class="bi bi-trash3-fill" style="font-size:18px; color:#00a056;"></i>
                    </div>
                    <p class="m-0 fw-semibold" style="font-size:12px; color:#1a1a2e;">Katalog</p>
                </div>
            </a>
            <a href="/history/transaction" class="text-decoration-none flex-fill">
                <div class="text-center rounded-3 py-3 px-2"
                     style="background:#ffffff; box-shadow: 0 1px 6px rgba(0,0,0,0.06); border:1px solid #f0f0f0;">
                    <div style="width:40px; height:40px; background:#e8f0fe; border-radius:12px; display:flex; align-items:center; justify-content:center; margin:0 auto 6px;">
                        <i class="bi bi-clock-history" style="font-size:18px; color:#1e4d8c;"></i>
                    </div>
                    <p class="m-0 fw-semibold" style="font-size:12px; color:#1a1a2e;">Riwayat</p>
                </div>
            </a>
            <a href="{{ route('tarikSaldo.index') }}" class="text-decoration-none flex-fill">
                <div class="text-center rounded-3 py-3 px-2"
                     style="background:#ffffff; box-shadow: 0 1px 6px rgba(0,0,0,0.06); border:1px solid #f0f0f0;">
                    <div style="width:40px; height:40px; background:#fff4e0; border-radius:12px; display:flex; align-items:center; justify-content:center; margin:0 auto 6px;">
                        <i class="bi bi-wallet2" style="font-size:18px; color:#d07000;"></i>
                    </div>
                    <p class="m-0 fw-semibold" style="font-size:12px; color:#1a1a2e;">Tarik Saldo</p>
                </div>
            </a>
            <a href="/edukasi" class="text-decoration-none flex-fill">
                <div class="text-center rounded-3 py-3 px-2"
                     style="background:#ffffff; box-shadow: 0 1px 6px rgba(0,0,0,0.06); border:1px solid #f0f0f0;">
                    <div style="width:40px; height:40px; background:#fff0e6; border-radius:12px; display:flex; align-items:center; justify-content:center; margin:0 auto 6px;">
                        <i class="bi bi-book-fill" style="font-size:18px; color:#d07000;"></i>
                    </div>
                    <p class="m-0 fw-semibold" style="font-size:12px; color:#1a1a2e;">Edukasi</p>
                </div>
            </a>
        </div>
    </div>

    @isset($ringkasan)
        @include('user-app.partials.ringkasan', ['ringkasan' => $ringkasan])
    @endisset

    {{-- ===== Riwayat Transaksi ===== --}}
    <section class="px-4 mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div class="d-flex align-items-center gap-2">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:15px;">Riwayat Tabungan</h6>
            </div>
            <a class="text-decoration-none" href="/history/transaction"
               style="font-size:12px; color:#00a056; font-weight:600;">Lihat Semua →</a>
        </div>

        @if (isset($transactions) || !empty($transactions))
        @forelse ($transactions as $transaction)
        <div class="rounded-3 mb-2 overflow-hidden"
             style="background:#ffffff; box-shadow: 0 1px 8px rgba(0,0,0,0.07); border-left: 4px solid #00a056;">
            <div class="px-3 py-3">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <p class="fw-bold mb-1" style="font-size:14px; color:#1a1a2e;">♻️ Setoran Sampah</p>
                        <p class="mb-0" style="font-size:12px; color:#6b7280;">
                            Berat: <span class="fw-bold" style="color:#00a056;">{{ $transaction->total_weight }} kg</span>
                        </p>
                        <p class="mb-0" style="font-size:11px; color:#9ca3af;">{{ $transaction->created_at }}</p>
                    </div>
                    <div class="text-end">
                        <p class="fw-bold mb-0" style="font-size:14px; color:#00a056;">
                            +Rp{{ number_format($transaction->total_income, 0, ',', '.') }}
                        </p>
                        <span class="px-2 py-1 rounded-pill d-inline-block mt-1"
                              style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:600;">
                            +{{ $transaction->point_received }} Poin
                        </span>
                    </div>
                </div>
            </div>
        </div>
        @empty
        <div class="rounded-3 p-4 text-center" style="background:#ffffff; border: 1.5px dashed #d1d5db;">
            <p style="font-size:24px; margin-bottom:4px;">♻️</p>
            <p class="m-0" style="font-size:13px; color:#9ca3af;">Belum ada riwayat setoran sampah.</p>
        </div>
        @endforelse
        @endif
    </section>

</main>
@endsection