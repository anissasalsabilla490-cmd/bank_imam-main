@extends('layout.main')
@section('title', 'Detail Sampah | EcoBuana')

@section('content')
@php
    $imageUrl = filter_var($sampah->image, FILTER_VALIDATE_URL) ? $sampah->image : asset($sampah->image);
    $categoryName = $sampah->category->name ?? 'Kategori Sampah';
@endphp

{{-- ======================== HEADER DETAIL ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 34px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-35px; right:-35px; width:140px; height:140px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; bottom:0; left:-25px; width:110px; height:110px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2 d-flex align-items-center gap-3" style="position:relative; z-index:1;">
        <a href="{{ url('kategori-sampah') }}" class="text-white text-decoration-none">
            <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center; backdrop-filter:blur(6px); transition:transform 0.2s ease;"
                 onmouseover="this.style.transform='scale(1.08)'"
                 onmouseout="this.style.transform='scale(1)'">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div class="flex-grow-1">
            <p class="m-0 text-white" style="font-size:11px; opacity:0.85;">Katalog Sampah</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:18px; letter-spacing:0.3px;">Detail Sampah</h5>
        </div>
        <div style="width:38px; height:38px; background:rgba(255,255,255,0.15); border-radius:12px; display:flex; align-items:center; justify-content:center;">
            <i class="bi bi-recycle text-white" style="font-size:18px;"></i>
        </div>
    </div>

    {{-- Wave SVG --}}
    <svg viewBox="0 0 428 40" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,20 C100,40 328,0 428,20 L428,40 L0,40 Z" fill="#f4f6f8"/>
    </svg>
</header>

{{-- ======================== MAIN CONTENT ======================== --}}
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-2">

        {{-- 1. HERO IMAGE & TITLE CARD --}}
        <div class="bg-white rounded-4 overflow-hidden mb-3" style="box-shadow: 0 4px 20px rgba(0,0,0,0.06); border: 1px solid #eef2f6;">
            {{-- Image Container --}}
            <div style="position:relative; width:100%; height:230px; background:#e8f0eb; overflow:hidden;">
                <img src="{{ $imageUrl }}" alt="{{ $sampah->name }}"
                     onerror="this.onerror=null; this.src='{{ asset('images/logo.png') }}'; this.style.objectFit='contain'; this.style.padding='30px';"
                     style="width:100%; height:100%; object-fit:cover; display:block; transition:transform 0.3s ease;">
                
                {{-- Floating Category Pill --}}
                <div style="position:absolute; top:12px; left:12px; background:rgba(0,160,86,0.92); backdrop-filter:blur(6px); color:#fff; font-size:11px; font-weight:700; padding:4px 12px; border-radius:30px; display:inline-flex; align-items:center; gap:5px; box-shadow:0 2px 8px rgba(0,0,0,0.15);">
                    <i class="bi bi-tag-fill" style="font-size:10px;"></i>
                    <span>{{ $categoryName }}</span>
                </div>

                {{-- Status Pill --}}
                <div style="position:absolute; top:12px; right:12px; background:rgba(255,255,255,0.92); backdrop-filter:blur(6px); color:#00a056; font-size:11px; font-weight:700; padding:4px 12px; border-radius:30px; display:inline-flex; align-items:center; gap:5px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
                    <span style="width:6px; height:6px; background:#00c96e; border-radius:50%; display:inline-block;"></span>
                    <span>Diterima</span>
                </div>
            </div>

            {{-- Title & Info --}}
            <div class="p-3">
                <div class="d-flex align-items-start justify-content-between gap-2">
                    <div>
                        <h4 class="fw-bold mb-1" style="color:#1a1a2e; font-size:20px; line-height:1.3;">
                            {{ $sampah->name }}
                        </h4>
                        <div class="d-flex align-items-center gap-2 mt-1">
                            <span class="badge" style="background:#f0fdf4; color:#00a056; font-size:11px; font-weight:600; padding:4px 8px; border:1px solid #bbf7d0;">
                                <i class="bi bi-box-seam me-1"></i>Satuan: per Kg
                            </span>
                            @if(isset($bsu) && !empty($bsu->name))
                                <span class="badge" style="background:#f1f5f9; color:#64748b; font-size:11px; font-weight:500; padding:4px 8px;">
                                    <i class="bi bi-geo-alt me-1"></i>{{ $bsu->name }}
                                </span>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- 2. PRICE & POINT VALUE CARDS --}}
        <div class="row g-2 mb-3">
            {{-- Harga Nasabah --}}
            <div class="col-6">
                <div class="h-100 p-3 rounded-4" style="background: linear-gradient(135deg, #f0fdf4 0%, #e8f8f0 100%); border: 1.5px solid #bbf7d0; box-shadow: 0 3px 12px rgba(0,160,86,0.08);">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <div style="width:30px; height:30px; background:#00a056; color:#fff; border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:14px;">
                            <i class="bi bi-cash-stack"></i>
                        </div>
                        <span style="font-size:11px; font-weight:700; color:#065f46; text-transform:uppercase; letter-spacing:0.3px;">Harga Nasabah</span>
                    </div>
                    <div class="fw-bold" style="font-size:18px; color:#007a3d; line-height:1.2;">
                        Rp {{ number_format($sampah->price_per_kg, 0, ',', '.') }}
                    </div>
                    <span style="font-size:11px; color:#047857; opacity:0.85;">per Kilogram</span>
                </div>
            </div>

            {{-- Reward Poin --}}
            <div class="col-6">
                <div class="h-100 p-3 rounded-4" style="background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%); border: 1.5px solid #fde68a; box-shadow: 0 3px 12px rgba(245,158,11,0.08);">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <div style="width:30px; height:30px; background:#f59e0b; color:#fff; border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:13px;">
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <span style="font-size:11px; font-weight:700; color:#92400e; text-transform:uppercase; letter-spacing:0.3px;">Reward Poin</span>
                    </div>
                    <div class="fw-bold" style="font-size:18px; color:#b45309; line-height:1.2;">
                        +{{ number_format($sampah->poin_per_kg ?? 0, 0, ',', '.') }}
                    </div>
                    <span style="font-size:11px; color:#92400e; opacity:0.85;">Poin per Kg</span>
                </div>
            </div>
        </div>

        {{-- 3. INTERACTIVE ESTIMATION CALCULATOR --}}
        <div class="bg-white rounded-4 p-3 mb-3" style="box-shadow: 0 4px 18px rgba(0,0,0,0.05); border: 1px solid #eef2f6;">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <div class="d-flex align-items-center gap-2">
                    <div style="width:28px; height:28px; background:#e0f2fe; color:#0284c7; border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:13px;">
                        <i class="bi bi-calculator"></i>
                    </div>
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Kalkulator Estimasi Cuan</h6>
                </div>
                <span style="font-size:10px; background:#f1f5f9; color:#475569; padding:2px 8px; border-radius:20px; font-weight:600;">Simulasi</span>
            </div>
            <p style="font-size:11px; color:#64748b; margin-bottom:12px;">Pilih atau ketik berat sampah untuk melihat estimasi hasil tabungan:</p>

            {{-- Weight quick buttons --}}
            <div class="d-flex gap-2 mb-3">
                <button type="button" class="btn btn-sm btn-calc-preset flex-fill rounded-pill" data-weight="1"
                        style="background:#f1f5f9; color:#334155; font-size:12px; font-weight:600; border:1px solid #e2e8f0;">1 Kg</button>
                <button type="button" class="btn btn-sm btn-calc-preset flex-fill rounded-pill" data-weight="3"
                        style="background:#f1f5f9; color:#334155; font-size:12px; font-weight:600; border:1px solid #e2e8f0;">3 Kg</button>
                <button type="button" class="btn btn-sm btn-calc-preset flex-fill rounded-pill" data-weight="5"
                        style="background:#00a056; color:#fff; font-size:12px; font-weight:600; border:1px solid #00a056;">5 Kg</button>
                <button type="button" class="btn btn-sm btn-calc-preset flex-fill rounded-pill" data-weight="10"
                        style="background:#f1f5f9; color:#334155; font-size:12px; font-weight:600; border:1px solid #e2e8f0;">10 Kg</button>
            </div>

            {{-- Stepper input --}}
            <div class="d-flex align-items-center justify-content-center gap-2 mb-3">
                <button type="button" id="btn-minus" class="btn rounded-circle"
                        style="width:36px; height:36px; background:#f1f5f9; border:none; display:flex; align-items:center; justify-content:center; font-weight:bold; color:#1a1a2e;">
                    <i class="bi bi-dash"></i>
                </button>
                <div style="position:relative; width:130px;">
                    <input type="number" id="calc-weight" value="5" min="0.5" step="0.5"
                           class="form-control text-center fw-bold rounded-pill"
                           style="border:1.5px solid #cbd5e1; font-size:15px; color:#1a1a2e; padding-right:32px;">
                    <span style="position:absolute; right:14px; top:50%; transform:translateY(-50%); font-size:12px; color:#64748b; font-weight:600;">Kg</span>
                </div>
                <button type="button" id="btn-plus" class="btn rounded-circle"
                        style="width:36px; height:36px; background:#f1f5f9; border:none; display:flex; align-items:center; justify-content:center; font-weight:bold; color:#1a1a2e;">
                    <i class="bi bi-plus"></i>
                </button>
            </div>

            {{-- Calculated Output Result Box --}}
            <div class="p-3 rounded-3 d-flex align-items-center justify-content-between"
                 style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); border:1px dashed #cbd5e1;">
                <div>
                    <span style="font-size:11px; color:#64748b; font-weight:500;">Estimasi Tabungan Uang:</span>
                    <div id="result-money" class="fw-bold" style="font-size:16px; color:#00a056;">
                        Rp {{ number_format($sampah->price_per_kg * 5, 0, ',', '.') }}
                    </div>
                </div>
                <div class="text-end">
                    <span style="font-size:11px; color:#64748b; font-weight:500;">Estimasi Poin:</span>
                    <div id="result-point" class="fw-bold d-flex align-items-center justify-content-end gap-1" style="font-size:16px; color:#f59e0b;">
                        <i class="bi bi-star-fill text-warning"></i> <span>+{{ number_format(($sampah->poin_per_kg ?? 0) * 5, 0, ',', '.') }} Poin</span>
                    </div>
                </div>
            </div>
        </div>

        {{-- 4. DESCRIPTION & SPECIFICATION CARD --}}
        <div class="bg-white rounded-4 p-3 mb-3" style="box-shadow: 0 4px 18px rgba(0,0,0,0.05); border: 1px solid #eef2f6;">
            <div class="d-flex align-items-center gap-2 mb-2">
                <div style="width:28px; height:28px; background:#f3e8ff; color:#9333ea; border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:13px;">
                    <i class="bi bi-file-earmark-text"></i>
                </div>
                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Deskripsi & Karakteristik</h6>
            </div>
            
            <div style="font-size:13px; color:#4b5563; line-height:1.6;">
                @if(!empty($sampah->deskripsi))
                    <p class="m-0" style="white-space: pre-line;">{{ $sampah->deskripsi }}</p>
                @else
                    <p class="m-0 text-muted" style="font-style: italic;">
                        Sampah jenis <b>{{ $sampah->name }}</b> merupakan material yang siap didaur ulang oleh Bank Sampah untuk mendukung kelestarian lingkungan dan ekonomi sirkular.
                    </p>
                @endif
            </div>
        </div>

        {{-- 5. TIPS & PANDUAN PENYETORAN --}}
        <div class="bg-white rounded-4 p-3 mb-4" style="box-shadow: 0 4px 18px rgba(0,0,0,0.05); border: 1px solid #eef2f6;">
            <div class="d-flex align-items-center gap-2 mb-3">
                <div style="width:28px; height:28px; background:#fef3c7; color:#d97706; border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:13px;">
                    <i class="bi bi-lightbulb"></i>
                </div>
                <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Tips & Panduan Penyetoran</h6>
            </div>

            <div class="d-flex flex-column gap-2">
                <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                    <div style="width:22px; height:22px; background:#e0f2fe; color:#0284c7; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:700; flex-shrink:0; margin-top:2px;">
                        1
                    </div>
                    <div>
                        <span class="fw-bold" style="font-size:12px; color:#1e293b;">Bersihkan & Keringkan</span>
                        <p class="m-0" style="font-size:11px; color:#64748b;">Pastikan bebas dari sisa cairan, minyak, tanah, atau kotoran basah.</p>
                    </div>
                </div>

                <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                    <div style="width:22px; height:22px; background:#dcfce7; color:#16a34a; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:700; flex-shrink:0; margin-top:2px;">
                        2
                    </div>
                    <div>
                        <span class="fw-bold" style="font-size:12px; color:#1e293b;">Kumpulkan Sesuai Jenis</span>
                        <p class="m-0" style="font-size:11px; color:#64748b;">Pisahkan sampah dari jenis lain agar proses sortir dan timbang lebih cepat.</p>
                    </div>
                </div>

                <div class="d-flex align-items-start gap-2 p-2 rounded-3" style="background:#f8fafc;">
                    <div style="width:22px; height:22px; background:#fef3c7; color:#d97706; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:700; flex-shrink:0; margin-top:2px;">
                        3
                    </div>
                    <div>
                        <span class="fw-bold" style="font-size:12px; color:#1e293b;">Penimbangan Resmi</span>
                        <p class="m-0" style="font-size:11px; color:#64748b;">Penyetoran dan pencatatan saldo dilakukan langsung oleh petugas Bank Sampah.</p>
                    </div>
                </div>
            </div>
        </div>

        {{-- 6. NAVIGATION CTA BUTTONS --}}
        <div class="d-flex flex-column gap-2 mb-3">
            <a href="{{ url('kategori-sampah') }}" class="btn btn-primary-custom w-100 py-3 rounded-pill fw-bold text-center text-decoration-none"
               style="font-size:14px; box-shadow:0 6px 18px rgba(0,160,86,0.25);">
                <i class="bi bi-arrow-left me-1"></i> Kembali ke Katalog Sampah
            </a>
            <a href="{{ url('dashboard') }}" class="btn btn-outline-secondary w-100 py-2 rounded-pill fw-semibold text-center text-decoration-none"
               style="font-size:12px; border-color:#cbd5e1; color:#64748b;">
                <i class="bi bi-house me-1"></i> Ke Halaman Beranda
            </a>
        </div>

    </div>
</main>
@endsection

@section('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const pricePerKg = {{ (int) $sampah->price_per_kg }};
    const pointPerKg = {{ (int) ($sampah->poin_per_kg ?? 0) }};

    const inputWeight = document.getElementById('calc-weight');
    const resultMoney = document.getElementById('result-money');
    const resultPoint = document.getElementById('result-point');
    const btnMinus = document.getElementById('btn-minus');
    const btnPlus = document.getElementById('btn-plus');
    const presetButtons = document.querySelectorAll('.btn-calc-preset');

    function formatNumber(num) {
        return new Intl.NumberFormat('id-ID').format(Math.round(num));
    }

    function calculate() {
        let weight = parseFloat(inputWeight.value);
        if (isNaN(weight) || weight < 0) {
            weight = 0;
        }
        const totalMoney = weight * pricePerKg;
        const totalPoint = weight * pointPerKg;

        resultMoney.textContent = 'Rp ' + formatNumber(totalMoney);
        resultPoint.innerHTML = '<i class="bi bi-star-fill text-warning"></i> <span>+' + formatNumber(totalPoint) + ' Poin</span>';
    }

    function setActivePreset(weightVal) {
        presetButtons.forEach(btn => {
            const w = parseFloat(btn.getAttribute('data-weight'));
            if (w === weightVal) {
                btn.style.background = '#00a056';
                btn.style.color = '#fff';
                btn.style.borderColor = '#00a056';
            } else {
                btn.style.background = '#f1f5f9';
                btn.style.color = '#334155';
                btn.style.borderColor = '#e2e8f0';
            }
        });
    }

    if (inputWeight) {
        inputWeight.addEventListener('input', function() {
            calculate();
            setActivePreset(parseFloat(this.value));
        });
    }

    if (btnMinus) {
        btnMinus.addEventListener('click', function() {
            let cur = parseFloat(inputWeight.value) || 1;
            if (cur > 0.5) {
                cur = Math.max(0.5, cur - 0.5);
                inputWeight.value = cur % 1 === 0 ? cur : cur.toFixed(1);
                calculate();
                setActivePreset(cur);
            }
        });
    }

    if (btnPlus) {
        btnPlus.addEventListener('click', function() {
            let cur = parseFloat(inputWeight.value) || 0;
            cur = cur + 0.5;
            inputWeight.value = cur % 1 === 0 ? cur : cur.toFixed(1);
            calculate();
            setActivePreset(cur);
        });
    }

    presetButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const weightVal = parseFloat(this.getAttribute('data-weight'));
            inputWeight.value = weightVal;
            calculate();
            setActivePreset(weightVal);
        });
    });

    calculate();
});
</script>
@endsection