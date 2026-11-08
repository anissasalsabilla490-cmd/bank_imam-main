@extends('layout.header-tukar-poin')
@section('title', 'Tukar Reward | MeBank')

@section('tukar-point-content')
<div class="px-3 pb-5">

    {{-- ===== SECTION: Tarik Saldo Digital ===== --}}
    <div class="mt-3">
        <div class="d-flex align-items-center gap-2 mb-3 px-1">
            <div style="width:4px; height:18px; background:#d07000; border-radius:4px;"></div>
            <h6 class="fw-bold m-0" style="font-size:15px;">Tarik Saldo → E-Wallet / Bank</h6>
        </div>
        <a class="text-decoration-none d-block mb-3" href="{{ route('tarikSaldo.index') }}">
            <div class="d-flex align-items-center rounded-3 overflow-hidden"
                 style="background:#ffffff; box-shadow: 0 2px 12px rgba(0,0,0,0.07); border: 1px solid #f0f0f0;">
                <div class="d-flex align-items-center justify-content-center flex-shrink-0"
                     style="width:100px; height:90px; background:#fff4e0;">
                    <i class="bi bi-wallet2" style="font-size:36px; color:#d07000;"></i>
                </div>
                <div class="px-3 py-2 flex-fill">
                    <p class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Tarik Saldo Digital</p>
                    <p class="m-0 mt-1" style="font-size:12px; color:#6b7280;">Kirim saldo langsung ke DANA, OVO, GoPay, ShopeePay, atau rekening bank.</p>
                    <span class="mt-2 d-inline-block px-2 py-1 rounded-2" style="background:#fff4e0; color:#d07000; font-size:11px; font-weight:600;">
                        Otomatis
                    </span>
                </div>
                <div class="pe-3">
                    <i class="bi bi-chevron-right" style="color:#9ca3af;"></i>
                </div>
            </div>
        </a>
    </div>

    {{-- ===== SECTION: Uang ===== --}}
    <div class="mt-3">
        <div class="d-flex align-items-center gap-2 mb-3 px-1">
            <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
            <h6 class="fw-bold m-0" style="font-size:15px;">Tukar Saldo → Uang Tunai</h6>
        </div>

        @if (isset($uang) || !empty($uang))
        @forelse ($uang as $reward)
        <a class="text-decoration-none d-block mb-3" href="{{ url("/tukar-saldo/reward/{$reward->id}") }}">
            <div class="d-flex align-items-center rounded-3 overflow-hidden"
                 style="background:#ffffff; box-shadow: 0 2px 12px rgba(0,0,0,0.07); border: 1px solid #f0f0f0; transition: all 0.2s ease;"
                 onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(0,0,0,0.1)'"
                 onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.07)'">
                @php
                    $uangImg = filter_var($reward->image, FILTER_VALIDATE_URL) ? $reward->image : asset($reward->image);
                @endphp
                <img src="{{ $uangImg }}" alt="{{ $reward->name }}"
                     onerror="this.onerror=null; this.src='{{ asset('images/uang.jpeg') }}';"
                     style="width:100px; height:90px; object-fit:cover; object-position:center; flex-shrink:0;">
                <div class="px-3 py-2 flex-fill">
                    <p class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">{{ $reward->name }}</p>
                    <p class="m-0 mt-1" style="font-size:12px; color:#6b7280;">Tukarkan saldo anda menjadi uang tunai!</p>
                    <span class="mt-2 d-inline-block px-2 py-1 rounded-2" style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:600;">
                        💵 Saldo
                    </span>
                </div>
                <div class="pe-3">
                    <i class="bi bi-chevron-right" style="color:#9ca3af;"></i>
                </div>
            </div>
        </a>
        @empty
        <div class="rounded-3 p-4 text-center" style="background:#ffffff; border: 1.5px dashed #d1d5db;">
            <p class="m-0" style="font-size:13px; color:#9ca3af;">Reward belum tersedia</p>
        </div>
        @endforelse
        @endif
    </div>

    {{-- ===== SECTION: Barang ===== --}}
    <div class="mt-4">
        <div class="d-flex align-items-center gap-2 mb-3 px-1">
            <div style="width:4px; height:18px; background:#1e4d8c; border-radius:4px;"></div>
            <h6 class="fw-bold m-0" style="font-size:15px;">Tukar Poin → Barang</h6>
        </div>

        <div class="row g-3 px-1">
            @if (isset($barang) || !empty($barang))
            @forelse ($barang as $reward)
            <div class="col-6">
                <a class="text-decoration-none d-block" href="{{ url("/tukar-poin/reward/{$reward->id}") }}">
                    <div class="rounded-3 overflow-hidden h-100"
                         style="background:#ffffff; box-shadow: 0 2px 12px rgba(0,0,0,0.07); border: 1px solid #f0f0f0; transition: all 0.2s ease;"
                         onmouseover="this.style.transform='translateY(-3px)'; this.style.boxShadow='0 8px 24px rgba(0,0,0,0.12)'"
                         onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 12px rgba(0,0,0,0.07)'">
                        @php
                            $barangImg = filter_var($reward->image, FILTER_VALIDATE_URL) ? $reward->image : asset($reward->image);
                        @endphp
                        <div style="position:relative; overflow:hidden; background:#eef2f6; height:130px; display:flex; align-items:center; justify-content:center;">
                            <img src="{{ $barangImg }}" alt="{{ $reward->name }}"
                                 onerror="this.onerror=null; this.src='{{ asset('images/logo.png') }}'; this.style.objectFit='contain'; this.style.padding='16px';"
                                 style="width:100%; height:130px; object-fit:cover; object-position:center; display:block;">
                        </div>
                        <div class="p-2 pt-2">
                            <p class="fw-bold m-0 mb-1" style="font-size:13px; color:#1a1a2e; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                {{ $reward->name }}
                            </p>
                            <div class="d-flex align-items-center gap-1">
                                <i class="bi bi-star-fill" style="color:#f59e0b; font-size:12px;"></i>
                                <span style="font-size:13px; font-weight:700; color:#d97706;">{{ $reward->price }} Poin</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            @empty
            <div class="col-12">
                <div class="rounded-3 p-4 text-center" style="background:#ffffff; border: 1.5px dashed #d1d5db;">
                    <p class="m-0" style="font-size:13px; color:#9ca3af;">Reward barang belum tersedia</p>
                </div>
            </div>
            @endforelse
            @endif
        </div>
    </div>

</div>
@endsection
