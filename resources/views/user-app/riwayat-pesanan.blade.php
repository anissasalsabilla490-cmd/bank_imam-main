@extends('layout.header-rewards')
@section('title', 'Riwayat Penukaran | EcoBuana')
@section('transaction-title', 'Riwayat Penukaran')

@section('transaction-content')
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-3">

        {{-- Filter Tabs --}}
        <div class="d-flex gap-2 mb-3">
            <button type="button" class="btn btn-sm flex-fill rounded-pill tab-btn active" data-tab="all"
                    style="background:#00a056; color:#fff; font-size:12px; font-weight:600; border:none; padding:6px 12px;">
                ✨ Semua
            </button>
            <button type="button" class="btn btn-sm flex-fill rounded-pill tab-btn" data-tab="barang"
                    style="background:#ffffff; color:#475569; font-size:12px; font-weight:600; border:1px solid #e2e8f0; padding:6px 12px;">
                🎁 Barang ({{ count($tukarPoin_history ?? []) }})
            </button>
            <button type="button" class="btn btn-sm flex-fill rounded-pill tab-btn" data-tab="saldo"
                    style="background:#ffffff; color:#475569; font-size:12px; font-weight:600; border:1px solid #e2e8f0; padding:6px 12px;">
                💵 Saldo ({{ count($tukarSaldo_history ?? []) }})
            </button>
        </div>

        {{-- ================= SECTION: TUKAR BARANG ================= --}}
        <div class="history-section mb-4" id="section-barang">
            <div class="d-flex align-items-center gap-2 mb-2 px-1">
                <div style="width:4px; height:16px; background:#1e4d8c; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Tukar Poin → Barang</h6>
            </div>

            @if (isset($tukarPoin_history) && count($tukarPoin_history) > 0)
                <div class="d-flex flex-column gap-2">
                    @foreach($tukarPoin_history as $tukar_poin)
                    @php
                        $rawImg = $tukar_poin->reward->image ?? '';
                        $imgUrl = filter_var($rawImg, FILTER_VALIDATE_URL) ? $rawImg : asset($rawImg);
                        $status = trim($tukar_poin->status ?? 'Pending');
                    @endphp
                    <a href="{{ url('/tukarPoin/'.$tukar_poin->id.'/detail') }}" class="text-decoration-none d-block">
                        <div class="rounded-4 p-3 bg-white"
                             style="box-shadow: 0 2px 12px rgba(0,0,0,0.05); border: 1px solid #f0f0f0; border-left: 4px solid #1e4d8c; transition: all 0.2s ease;"
                             onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(0,0,0,0.08)';"
                             onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.05)';">
                            <div class="d-flex align-items-center justify-content-between">
                                {{-- Left info --}}
                                <div class="d-flex align-items-center gap-3">
                                    <div style="width:46px; height:46px; border-radius:12px; overflow:hidden; background:#f1f5f9; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <img src="{{ $imgUrl }}" alt="reward"
                                             onerror="this.onerror=null; this.src='{{ asset('images/logo.png') }}'; this.style.objectFit='contain'; this.style.padding='8px';"
                                             style="width:100%; height:100%; object-fit:cover;">
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">
                                            {{ $tukar_poin->reward->name ?? 'Reward Barang' }}
                                        </h6>
                                        <div class="d-flex align-items-center gap-2 mt-1">
                                            <span style="font-size:11px; color:#64748b;">
                                                <i class="bi bi-clock me-1"></i>{{ \Carbon\Carbon::parse($tukar_poin->created_at)->translatedFormat('d M Y, H:i') }}
                                            </span>
                                            @if(isset($tukar_poin->reward->price))
                                            <span style="font-size:11px; font-weight:700; color:#d97706;">
                                                <i class="bi bi-star-fill text-warning"></i> {{ $tukar_poin->reward->price }} Poin
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                {{-- Right status pill --}}
                                <div class="text-end d-flex align-items-center gap-2">
                                    @if($status == 'Pending')
                                        <span class="badge" style="background:#fef3c7; color:#92400e; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #fde68a;">
                                            ⏳ Menunggu
                                        </span>
                                    @elseif($status == 'On Proses')
                                        <span class="badge" style="background:#e0f2fe; color:#0369a1; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #bae6fd;">
                                            🚚 Diproses
                                        </span>
                                    @elseif($status == 'Selesai' || $status == 'Success')
                                        <span class="badge" style="background:#dcfce7; color:#15803d; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #bbf7d0;">
                                            ✅ Selesai
                                        </span>
                                    @else
                                        <span class="badge" style="background:#f1f5f9; color:#475569; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px;">
                                            {{ $status }}
                                        </span>
                                    @endif
                                    <i class="bi bi-chevron-right" style="font-size:14px; color:#cbd5e1;"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    @endforeach
                </div>
            @else
                <div class="bg-white rounded-3 p-3 text-center" style="border: 1px dashed #cbd5e1;">
                    <p class="m-0" style="font-size:12px; color:#94a3b8;">Belum ada riwayat penukaran barang</p>
                </div>
            @endif
        </div>

        {{-- ================= SECTION: TUKAR SALDO ================= --}}
        <div class="history-section mb-3" id="section-saldo">
            <div class="d-flex align-items-center gap-2 mb-2 px-1">
                <div style="width:4px; height:16px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Tukar Saldo → Uang Tunai</h6>
            </div>

            @if (isset($tukarSaldo_history) && count($tukarSaldo_history) > 0)
                <div class="d-flex flex-column gap-2">
                    @foreach($tukarSaldo_history as $tukar_saldo)
                    @php
                        $rawImg = $tukar_saldo->reward->image ?? '';
                        $imgUrl = filter_var($rawImg, FILTER_VALIDATE_URL) ? $rawImg : (empty($rawImg) ? asset('images/uang.jpeg') : asset($rawImg));
                        $status = trim($tukar_saldo->status ?? 'Pending');
                    @endphp
                    <a href="{{ url('/tukarSaldo/'.$tukar_saldo->id.'/detail') }}" class="text-decoration-none d-block">
                        <div class="rounded-4 p-3 bg-white"
                             style="box-shadow: 0 2px 12px rgba(0,0,0,0.05); border: 1px solid #f0f0f0; border-left: 4px solid #00a056; transition: all 0.2s ease;"
                             onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(0,0,0,0.08)';"
                             onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.05)';">
                            <div class="d-flex align-items-center justify-content-between">
                                {{-- Left info --}}
                                <div class="d-flex align-items-center gap-3">
                                    <div style="width:46px; height:46px; border-radius:12px; overflow:hidden; background:#f1f5f9; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <img src="{{ $imgUrl }}" alt="Uang Cash"
                                             onerror="this.onerror=null; this.src='{{ asset('images/uang.jpeg') }}';"
                                             style="width:100%; height:100%; object-fit:cover;">
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0" style="font-size:14px; color:#00a056;">
                                            Rp{{ number_format($tukar_saldo->total_price, 0, ',', '.') }}
                                        </h6>
                                        <div class="d-flex align-items-center gap-2 mt-1">
                                            <span style="font-size:11px; color:#64748b;">
                                                <i class="bi bi-clock me-1"></i>{{ \Carbon\Carbon::parse($tukar_saldo->created_at)->translatedFormat('d M Y, H:i') }}
                                            </span>
                                            <span class="badge" style="background:#e6f7ef; color:#00a056; font-size:10px; font-weight:600;">
                                                💵 Penarikan Saldo
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                {{-- Right status pill --}}
                                <div class="text-end d-flex align-items-center gap-2">
                                    @if($status == 'Pending')
                                        <span class="badge" style="background:#fef3c7; color:#92400e; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #fde68a;">
                                            ⏳ Menunggu
                                        </span>
                                    @elseif($status == 'On Proses')
                                        <span class="badge" style="background:#e0f2fe; color:#0369a1; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #bae6fd;">
                                            🚚 Diproses
                                        </span>
                                    @elseif($status == 'Selesai' || $status == 'Success')
                                        <span class="badge" style="background:#dcfce7; color:#15803d; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px; border:1px solid #bbf7d0;">
                                            ✅ Selesai
                                        </span>
                                    @else
                                        <span class="badge" style="background:#f1f5f9; color:#475569; font-size:11px; font-weight:600; padding:5px 10px; border-radius:20px;">
                                            {{ $status }}
                                        </span>
                                    @endif
                                    <i class="bi bi-chevron-right" style="font-size:14px; color:#cbd5e1;"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    @endforeach
                </div>
            @else
                <div class="bg-white rounded-3 p-3 text-center" style="border: 1px dashed #cbd5e1;">
                    <p class="m-0" style="font-size:12px; color:#94a3b8;">Belum ada riwayat penarikan saldo</p>
                </div>
            @endif
        </div>

    </div>
</main>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const tabBtns = document.querySelectorAll('.tab-btn');
    const secBarang = document.getElementById('section-barang');
    const secSaldo = document.getElementById('section-saldo');

    tabBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const tab = this.getAttribute('data-tab');

            tabBtns.forEach(b => {
                b.style.background = '#ffffff';
                b.style.color = '#475569';
                b.style.border = '1px solid #e2e8f0';
            });
            this.style.background = '#00a056';
            this.style.color = '#ffffff';
            this.style.border = 'none';

            if (tab === 'all') {
                secBarang.style.display = 'block';
                secSaldo.style.display = 'block';
            } else if (tab === 'barang') {
                secBarang.style.display = 'block';
                secSaldo.style.display = 'none';
            } else if (tab === 'saldo') {
                secBarang.style.display = 'none';
                secSaldo.style.display = 'block';
            }
        });
    });
});
</script>
@endsection