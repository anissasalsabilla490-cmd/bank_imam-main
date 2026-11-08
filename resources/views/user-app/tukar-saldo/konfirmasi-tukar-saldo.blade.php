@extends('layout.header-transaksi')

@section('title', 'Konfirmasi Tukar Saldo | EcoBuana')
@section('transaction-title', 'KONFIRMASI PENARIKAN')

@section('transaction-content')
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-3">

        {{-- Main Card Container --}}
        <div class="rounded-4 overflow-hidden p-4"
             style="background:#ffffff; box-shadow: 0 4px 20px rgba(0,0,0,0.06); border: 1px solid #f0f0f0;">

            {{-- Big Nominal Hero --}}
            <div class="text-center py-3 px-2 mb-3 rounded-4"
                 style="background: linear-gradient(135deg, #f0fdf4 0%, #e6f7ef 100%); border: 1.5px solid #bbf7d0;">
                <div class="d-inline-flex align-items-center justify-content-center rounded-circle mb-2"
                     style="width:52px; height:52px; background:linear-gradient(135deg, #00c96e 0%, #008744 100%); color:#ffffff; box-shadow:0 4px 12px rgba(0,160,86,0.3);">
                    <i class="bi bi-cash-stack" style="font-size:24px;"></i>
                </div>
                <p class="m-0 text-muted" style="font-size:12px; font-weight:600; text-transform:uppercase; letter-spacing:0.5px;">
                    Nominal Penarikan
                </p>
                <h3 class="fw-bold my-1" style="font-size:28px; color:#008744; letter-spacing:-0.5px;">
                    Rp {{ number_format($selected_nominal, 0, ',', '.') }}
                </h3>
                <span class="badge rounded-pill px-3 py-1"
                      style="background:#dcfce7; color:#166534; font-size:11px; font-weight:600;">
                    Tukar Saldo Reward
                </span>
            </div>

            {{-- Section Title --}}
            <div class="d-flex align-items-center gap-2 mb-3">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:15px; color:#1a1a2e;">Detail Pengajuan</h6>
            </div>

            {{-- Details List --}}
            <div class="rounded-3 p-3 mb-3" style="background:#f9fafb; border: 1px solid #e5e7eb;">
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:13px;">
                        <i class="bi bi-person text-success"></i> Nama Pengguna
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ auth()->user()->username }}
                    </span>
                </div>
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:13px;">
                        <i class="bi bi-calendar3 text-success"></i> Waktu Pengajuan
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ $time }}
                    </span>
                </div>
                <div class="d-flex justify-content-between align-items-center py-2">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:13px;">
                        <i class="bi bi-gift text-success"></i> Produk
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ $reward->name }}
                    </span>
                </div>
            </div>

            {{-- Section Title --}}
            <div class="d-flex align-items-center gap-2 mb-3">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:15px; color:#1a1a2e;">Rincian Saldo</h6>
            </div>

            {{-- Balance Breakdown Box --}}
            <div class="rounded-3 p-3 mb-3" style="background:#ffffff; border: 1.5px dashed #cbd5e1;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span style="font-size:13px; color:#64748b;">Saldo Saat Ini</span>
                    <span class="fw-bold" style="font-size:14px; color:#1e293b;">
                        Rp {{ number_format($saldo->total_saldo, 0, ',', '.') }}
                    </span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span style="font-size:13px; color:#64748b;">Nominal Ditarik</span>
                    <span class="fw-bold text-danger" style="font-size:14px;">
                        - Rp {{ number_format($selected_nominal, 0, ',', '.') }}
                    </span>
                </div>
                <div class="pt-2 border-top d-flex justify-content-between align-items-center">
                    <span class="fw-bold" style="font-size:13px; color:#334155;">Sisa Saldo</span>
                    @if ($saldo_left < 0)
                        <span class="fw-bold text-danger" style="font-size:15px;">
                            - Rp {{ number_format(abs($saldo_left), 0, ',', '.') }}
                        </span>
                    @else
                        <span class="fw-bold" style="font-size:15px; color:#008744;">
                            Rp {{ number_format($saldo_left, 0, ',', '.') }}
                        </span>
                    @endif
                </div>
            </div>

            {{-- Info Notice --}}
            <div class="d-flex align-items-start gap-2 p-3 mb-4 rounded-3"
                 style="background:#eff6ff; border:1px solid #bfdbfe; font-size:12px; color:#1e40af;">
                <i class="bi bi-info-circle-fill mt-1 flex-shrink-0" style="font-size:14px;"></i>
                <div>
                    Pengajuan penarikan saldo Anda akan diverifikasi oleh pengelola BSU. Saldo akan otomatis disesuaikan setelah dikonfirmasi.
                </div>
            </div>

            {{-- Action Buttons --}}
            @if ($saldo->total_saldo < $selected_nominal)
                <div class="alert alert-danger d-flex align-items-center gap-2 py-2 px-3 rounded-3 mb-3" style="font-size:12px;">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <span>Saldo tidak mencukupi untuk melakukan penarikan ini.</span>
                </div>
                <a href="{{ url('/tukar-saldo/reward/'.$reward->id) }}"
                   class="btn w-100 py-3 rounded-pill fw-bold btn-outline-secondary"
                   style="font-size:14px;">
                    <i class="bi bi-arrow-left me-1"></i> Kembali & Ubah Nominal
                </a>
            @elseif ($reward->stock < 1)
                <div class="alert alert-warning d-flex align-items-center gap-2 py-2 px-3 rounded-3 mb-3" style="font-size:12px;">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <span>Stok hadiah sedang tidak tersedia.</span>
                </div>
                <a href="{{ url('/tukar-saldo/reward/'.$reward->id) }}"
                   class="btn w-100 py-3 rounded-pill fw-bold btn-outline-secondary"
                   style="font-size:14px;">
                    <i class="bi bi-arrow-left me-1"></i> Kembali
                </a>
            @else
                <form action="{{ url('/tukar-saldo/reward/'.$reward->id) }}" method="post" class="mb-2">
                    @csrf
                    <input type="hidden" name="selected_nominal" id="selected_nominal" value="{{ $selected_nominal }}">
                    <button type="submit"
                            class="btn w-100 py-3 rounded-pill fw-bold text-white d-flex align-items-center justify-content-center gap-2"
                            style="background: linear-gradient(135deg, #00c96e 0%, #008744 100%); box-shadow: 0 6px 18px rgba(0,160,86,0.35); border:none; font-size:15px; letter-spacing:0.3px; transition:all 0.2s ease;"
                            onmouseover="this.style.transform='translateY(-2px)'"
                            onmouseout="this.style.transform='translateY(0)'">
                        <span>Konfirmasi Penarikan</span>
                        <i class="bi bi-check2-circle" style="font-size:18px;"></i>
                    </button>
                </form>

                <div class="text-center mt-2">
                    <a href="{{ url('/tukar-saldo/reward/'.$reward->id) }}"
                       class="text-decoration-none text-muted"
                       style="font-size:13px; font-weight:600;">
                        <i class="bi bi-arrow-left me-1"></i> Ubah Nominal
                    </a>
                </div>
            @endif

        </div>

    </div>
</main>
@endsection
