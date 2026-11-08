@extends('layout.header-to-dashboard')
@section('title', 'Riwayat Tabungan | EcoBuana')
@section('transaction-title', 'Riwayat Tabungan')

@section('transaction-content')
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-3">

        {{-- Filter periode (kalender) --}}
        <link rel="stylesheet" href="{{ asset('css/kalender.css') }}">
        <div class="mb-3">
            <button type="button" id="btn-periode" class="btn btn-sm w-100" style="background:#fff; border:1.5px solid #00a056; color:#00a056; font-weight:600; border-radius:12px; padding:10px;">
                <i class="bi bi-calendar3 me-1"></i>
                @if(!empty($dari)) {{ \Carbon\Carbon::parse($dari)->format('d/m/Y') }} – {{ \Carbon\Carbon::parse($sampai ?: $dari)->format('d/m/Y') }} @else Pilih periode @endif
            </button>
            <div id="wadah-kal" style="display:none; margin-top:10px;">
                <div id="kal"></div>
                <form method="get" class="mt-2 d-flex gap-2">
                    <input type="hidden" name="dari" id="dari" value="{{ $dari ?? '' }}"><input type="hidden" name="sampai" id="sampai" value="{{ $sampai ?? '' }}">
                    <button class="btn btn-success btn-sm flex-grow-1">Terapkan</button>
                    <a href="{{ url('/history/transaction') }}" class="btn btn-outline-secondary btn-sm">Semua</a>
                </form>
            </div>
        </div>

        @if (isset($transactions) && count($transactions) > 0)
            {{-- Summary Pill --}}
            <div class="d-flex align-items-center justify-content-between mb-3 px-1">
                <span style="font-size:12px; color:#64748b; font-weight:600;">
                    Total: <b style="color:#1a1a2e;">{{ count($transactions) }}</b> Setoran Sampah
                </span>
                <span class="badge" style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:600; padding:4px 10px; border-radius:20px;">
                    <i class="bi bi-shield-check me-1"></i>Tercatat Resmi
                </span>
            </div>

            {{-- Transactions List --}}
            <div class="d-flex flex-column gap-2">
                @foreach ($transactions as $transaction)
                <a href="{{ url('/transaction/'.$transaction->id.'/detail') }}" class="text-decoration-none d-block">
                    <div class="rounded-4 p-3 bg-white"
                         style="box-shadow: 0 2px 12px rgba(0,0,0,0.05); border: 1px solid #f0f0f0; border-left: 4px solid #00a056; transition: all 0.2s ease;"
                         onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(0,0,0,0.08)';"
                         onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.05)';">
                        <div class="d-flex align-items-center justify-content-between">
                            {{-- Left Column --}}
                            <div class="d-flex align-items-center gap-3">
                                <div style="width:42px; height:42px; background:linear-gradient(135deg, #e6f7ef 0%, #d1f2e2 100%); color:#00a056; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:18px; flex-shrink:0;">
                                    <i class="bi bi-recycle"></i>
                                </div>
                                <div>
                                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Setoran Sampah</h6>
                                    <div class="d-flex align-items-center gap-2 mt-1">
                                        <span style="font-size:11px; color:#64748b;">
                                            <i class="bi bi-clock me-1"></i>{{ \Carbon\Carbon::parse($transaction->created_at)->translatedFormat('d M Y, H:i') }}
                                        </span>
                                        <span class="badge" style="background:#f1f5f9; color:#475569; font-size:10px; font-weight:600;">
                                            ⚖️ {{ $transaction->total_weight }} Kg
                                        </span>
                                    </div>
                                </div>
                            </div>

                            {{-- Right Column --}}
                            <div class="text-end d-flex align-items-center gap-2">
                                <div>
                                    <div class="fw-bold" style="font-size:14px; color:#00a056;">
                                        +Rp{{ number_format($transaction->total_income, 0, ',', '.') }}
                                    </div>
                                    <div class="mt-1 d-flex align-items-center justify-content-end gap-1" style="font-size:11px; color:#d97706; font-weight:700;">
                                        <i class="bi bi-star-fill text-warning" style="font-size:10px;"></i>
                                        <span>+{{ $transaction->point_received }} Poin</span>
                                    </div>
                                </div>
                                <i class="bi bi-chevron-right" style="font-size:14px; color:#cbd5e1;"></i>
                            </div>
                        </div>
                    </div>
                </a>
                @endforeach
            </div>
        @else
            {{-- Empty State --}}
            <div class="bg-white rounded-4 p-4 text-center mt-3" style="box-shadow: 0 2px 14px rgba(0,0,0,0.05); border: 1px dashed #cbd5e1;">
                <div style="width:60px; height:60px; background:#e6f7ef; color:#00a056; border-radius:50%; display:flex; align-items:center; justify-content:center; margin: 0 auto 12px; font-size:26px;">
                    <i class="bi bi-inbox"></i>
                </div>
                <h6 class="fw-bold mb-1" style="color:#1a1a2e; font-size:15px;">Belum Ada Riwayat Setoran</h6>
                <p class="mb-3" style="font-size:12px; color:#64748b; line-height:1.5;">
                    Anda belum pernah menyetorkan sampah. Bawa sampah Anda ke Bank Sampah terdekat untuk mulai menabung dan mengumpulkan poin!
                </p>
                <a href="{{ url('/kategori-sampah') }}" class="btn btn-primary-custom px-4 py-2 rounded-pill fw-bold text-decoration-none" style="font-size:12px;">
                    <i class="bi bi-trash me-1"></i> Lihat Katalog Sampah
                </a>
            </div>
        @endif

    </div>
</main>
<script src="{{ asset('js/kalender.js') }}"></script>
<script>
document.getElementById('btn-periode').onclick=function(){var w=document.getElementById('wadah-kal');w.style.display=w.style.display==='none'?'block':'none';};
Kalender.pasang(document.getElementById('kal'),{mode:'range',dari:@json($dari ?? null),sampai:@json($sampai ?? null),
  onPilih:function(d,s){document.getElementById('dari').value=d;document.getElementById('sampai').value=s;}});
</script>
@endsection
