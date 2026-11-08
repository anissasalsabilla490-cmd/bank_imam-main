@extends('layout.header-rewards')
@section('title', 'Detail Pesanan Saldo | EcoBuana')

@section('transaction-content')
@section('transaction-title', 'DETAIL PESANAN')
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-2">
        <div class="rounded-4 overflow-hidden p-4"
             style="background:#ffffff; box-shadow: 0 4px 20px rgba(0,0,0,0.06); border: 1px solid #f0f0f0;">

            {{-- Header ID & Status --}}
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="badge rounded-pill px-3 py-2 fw-bold"
                      style="background:#f1f5f9; color:#475569; font-size:12px; border:1px solid #e2e8f0;">
                    ID #{{ $tukar_saldo->id }}
                </span>
                @if($tukar_saldo->status == 'Pending')
                    <span class="badge rounded-pill px-3 py-2 fw-bold"
                          style="background:#fef3c7; color:#92400e; font-size:12px;">
                        <i class="bi bi-clock me-1"></i> Menunggu Verifikasi
                    </span>
                @elseif($tukar_saldo->status == 'On Proses')
                    <span class="badge rounded-pill px-3 py-2 fw-bold"
                          style="background:#dbeafe; color:#1e40af; font-size:12px;">
                        <i class="bi bi-hourglass-split me-1"></i> Sedang Diproses
                    </span>
                @else
                    <span class="badge rounded-pill px-3 py-2 fw-bold"
                          style="background:#dcfce7; color:#166534; font-size:12px;">
                        <i class="bi bi-check-circle-fill me-1"></i> Selesai
                    </span>
                @endif
            </div>

            {{-- Big Nominal Hero --}}
            <div class="text-center py-3 px-2 mb-3 rounded-4"
                 style="background: linear-gradient(135deg, #f0fdf4 0%, #e6f7ef 100%); border: 1.5px solid #bbf7d0;">
                <p class="m-0 text-muted" style="font-size:11px; font-weight:600; text-transform:uppercase; letter-spacing:0.5px;">
                    Total Penarikan Saldo
                </p>
                <h3 class="fw-bold my-1" style="font-size:26px; color:#008744; letter-spacing:-0.5px;">
                    Rp {{ number_format($tukar_saldo->total_price, 0, ',', '.') }}
                </h3>
                <span class="text-muted" style="font-size:11px;">
                    {{ $tukar_saldo->reward->name ?? 'Tukar Saldo' }}
                </span>
            </div>

            {{-- Detail Items --}}
            <div class="d-flex align-items-center gap-2 mb-2">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Informasi Penukaran</h6>
            </div>

            <div class="rounded-3 p-3 mb-3" style="background:#f9fafb; border: 1px solid #e5e7eb;">
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:12px;">
                        <i class="bi bi-person text-success"></i> Nasabah
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ auth()->user()->username }}
                    </span>
                </div>
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:12px;">
                        <i class="bi bi-calendar3 text-success"></i> Waktu Pengajuan
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ $tukar_saldo->created_at }}
                    </span>
                </div>
                @if($tukar_saldo->status == 'Diterima' && isset($bsu))
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:12px;">
                        <i class="bi bi-check2-circle text-success"></i> Diproses Oleh
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ $bsu->name }}
                    </span>
                </div>
                <div class="d-flex justify-content-between align-items-center py-2">
                    <span class="text-muted d-flex align-items-center gap-2" style="font-size:12px;">
                        <i class="bi bi-clock-history text-success"></i> Waktu Selesai
                    </span>
                    <span class="fw-bold text-dark" style="font-size:13px;">
                        {{ $tukar_saldo->updated_at }}
                    </span>
                </div>
                @endif
            </div>

            {{-- Status Banner Notice --}}
            @if( $tukar_saldo->status == 'Pending')
            <div class="d-flex align-items-center gap-2 p-3 rounded-3"
                 style="background:#fef3c7; border:1px solid #fde68a; color:#92400e; font-size:12px;">
                <i class="bi bi-hourglass-split fs-5 flex-shrink-0"></i>
                <div>
                    <strong>Pesanan Sedang Diverifikasi:</strong> Pengajuan penarikan saldo Anda sedang dalam antrean pengecekan pengelola BSU.
                </div>
            </div>
            @elseif( $tukar_saldo->status == 'On Proses' )
            <div class="d-flex align-items-center gap-2 p-3 rounded-3"
                 style="background:#dbeafe; border:1px solid #bfdbfe; color:#1e40af; font-size:12px;">
                <i class="bi bi-arrow-repeat fs-5 flex-shrink-0"></i>
                <div>
                    <strong>Pesanan Diproses:</strong> Pengajuan Anda telah disetujui. Silakan kunjungi unit BSU Anda untuk serah terima saldo/uang kas.
                </div>
            </div>
            @else
            <div class="d-flex align-items-center gap-2 p-3 rounded-3"
                 style="background:#dcfce7; border:1px solid #bbf7d0; color:#166534; font-size:12px;">
                <i class="bi bi-check-circle-fill fs-5 flex-shrink-0"></i>
                <div>
                    <strong>Penarikan Selesai:</strong> Transaksi penarikan saldo telah berhasil diselesaikan oleh pihak BSU.
                </div>
            </div>
            @endif

            {{-- Back to Dashboard Button --}}
            <div class="mt-4">
                <a href="{{ url('/tukar-poin') }}"
                   class="btn w-100 py-3 rounded-pill fw-bold text-white d-flex align-items-center justify-content-center gap-2"
                   style="background: linear-gradient(135deg, #00c96e 0%, #008744 100%); box-shadow: 0 6px 18px rgba(0,160,86,0.35); border:none; font-size:14px; letter-spacing:0.3px;">
                    <i class="bi bi-arrow-left"></i>
                    <span>Kembali ke Halaman Rewards</span>
                </a>
            </div>

        </div>
    </div>
</main>
@endsection