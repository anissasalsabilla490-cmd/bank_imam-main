@extends('layout.header-rewards')
@section('title', 'Riwayat Poin | EcoBuana')
@section('transaction-title', 'Riwayat Poin')

@section('transaction-content')
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-3">

        @if (isset($transactions) && count($transactions) > 0)
            {{-- Summary Pill --}}
            <div class="d-flex align-items-center justify-content-between mb-3 px-1">
                <span style="font-size:12px; color:#64748b; font-weight:600;">
                    Riwayat Perolehan Poin
                </span>
                <span class="badge" style="background:#fffbeb; color:#b45309; font-size:11px; font-weight:600; padding:4px 10px; border-radius:20px; border:1px solid #fde68a;">
                    <i class="bi bi-star-fill text-warning me-1"></i>Poin Setoran
                </span>
            </div>

            {{-- Transactions List --}}
            <div class="d-flex flex-column gap-2">
                @foreach ($transactions as $transaction)
                <div class="rounded-4 p-3 bg-white"
                     style="box-shadow: 0 2px 12px rgba(0,0,0,0.05); border: 1px solid #f0f0f0; border-left: 4px solid #f59e0b; transition: all 0.2s ease;"
                     onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(0,0,0,0.08)';"
                     onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.05)';">
                    <div class="d-flex align-items-center justify-content-between">
                        {{-- Left Column --}}
                        <div class="d-flex align-items-center gap-3">
                            <div style="width:42px; height:42px; background:linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%); color:#f59e0b; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:18px; flex-shrink:0;">
                                <i class="bi bi-star-fill"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Poin Setoran Sampah</h6>
                                <div class="d-flex align-items-center gap-2 mt-1">
                                    <span style="font-size:11px; color:#64748b;">
                                        <i class="bi bi-clock me-1"></i>{{ \Carbon\Carbon::parse($transaction->created_at)->translatedFormat('d M Y, H:i') }}
                                    </span>
                                    <span class="badge" style="background:#f0fdf4; color:#16a34a; font-size:10px; font-weight:600;">
                                        Rp{{ number_format($transaction->total_income, 0, ',', '.') }}
                                    </span>
                                </div>
                            </div>
                        </div>

                        {{-- Right Column --}}
                        <div class="text-end">
                            <div class="fw-bold d-flex align-items-center justify-content-end gap-1" style="font-size:15px; color:#d97706;">
                                <i class="bi bi-star-fill text-warning" style="font-size:11px;"></i>
                                <span>+{{ $transaction->point_received }}</span>
                            </div>
                            <span class="badge" style="background:#f1f5f9; color:#475569; font-size:10px; font-weight:600; padding:2px 8px; border-radius:10px;">
                                Masuk
                            </span>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        @else
            {{-- Empty State --}}
            <div class="bg-white rounded-4 p-4 text-center mt-3" style="box-shadow: 0 2px 14px rgba(0,0,0,0.05); border: 1px dashed #cbd5e1;">
                <div style="width:60px; height:60px; background:#fffbeb; color:#f59e0b; border-radius:50%; display:flex; align-items:center; justify-content:center; margin: 0 auto 12px; font-size:26px;">
                    <i class="bi bi-star"></i>
                </div>
                <h6 class="fw-bold mb-1" style="color:#1a1a2e; font-size:15px;">Belum Ada Riwayat Poin</h6>
                <p class="mb-3" style="font-size:12px; color:#64748b; line-height:1.5;">
                    Setiap sampah yang Anda setorkan akan memberikan poin reward yang dapat ditukarkan dengan berbagai hadiah menarik!
                </p>
                <a href="{{ url('/kategori-sampah') }}" class="btn btn-primary-custom px-4 py-2 rounded-pill fw-bold text-decoration-none" style="font-size:12px;">
                    <i class="bi bi-recycle me-1"></i> Mulai Nabung Sampah
                </a>
            </div>
        @endif

    </div>
</main>
@endsection