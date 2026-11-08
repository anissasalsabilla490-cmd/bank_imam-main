@extends('layout.main')

@section('title', 'Ruang Edukasi | EcoBuana')

@section('content')
{{-- ======================== HEADER EDUKASI ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 34px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-35px; right:-35px; width:140px; height:140px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; bottom:0; left:-25px; width:110px; height:110px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-2 d-flex align-items-center gap-3" style="position:relative; z-index:1;">
        <a href="{{ url('dashboard') }}" class="text-white text-decoration-none">
            <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center; backdrop-filter:blur(6px); transition:transform 0.2s ease;"
                 onmouseover="this.style.transform='scale(1.08)'"
                 onmouseout="this.style.transform='scale(1)'">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div class="flex-grow-1">
            <p class="m-0 text-white" style="font-size:11px; opacity:0.85;">Pusat Literasi & Berita</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:18px; letter-spacing:0.3px;">Ruang Edukasi 📚</h5>
        </div>
        <div style="width:38px; height:38px; background:rgba(255,255,255,0.15); border-radius:12px; display:flex; align-items:center; justify-content:center;">
            <i class="bi bi-book-half text-white" style="font-size:18px;"></i>
        </div>
    </div>

    {{-- Wave SVG --}}
    <svg viewBox="0 0 428 35" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,18 C100,35 328,0 428,18 L428,35 L0,35 Z" fill="#f4f6f8"/>
    </svg>
</header>

{{-- ======================== MAIN CONTENT ======================== --}}
<main id="education-page" class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 120px); padding-bottom: 95px;">
    <div class="container-body px-3 pt-2">

        {{-- 1. HERO BANNER CARD --}}
        <div class="rounded-4 p-3 mb-3 text-white position-relative overflow-hidden"
             style="background: linear-gradient(135deg, #00c96e 0%, #006633 100%); box-shadow: 0 6px 20px rgba(0,160,86,0.25);">
            {{-- Decorative circles --}}
            <div style="position:absolute; top:-20px; right:-20px; width:100px; height:100px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
            <div style="position:absolute; bottom:-30px; left:40px; width:80px; height:80px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

            <div class="d-flex align-items-center justify-content-between position-relative" style="z-index:1;">
                <div style="max-width: 68%;">
                    <span class="badge rounded-pill px-2 py-1 mb-2"
                          style="background:rgba(255,255,255,0.22); font-size:10px; font-weight:600; backdrop-filter:blur(4px);">
                        🌱 Komunitas Hijau
                    </span>
                    <h5 class="fw-bold mb-1" style="font-size:16px; line-height:1.3; letter-spacing:-0.3px;">
                        Ikuti Kegiatan Sosial di Sekitarmu!
                    </h5>
                    <p class="m-0" style="font-size:11px; opacity:0.9; line-height:1.4;">
                        Tingkatkan wawasan daur ulang sampah & kepedulian lingkungan.
                    </p>
                </div>
                <div class="flex-shrink-0 text-end">
                    <img src="{{ asset('images/banner-edu.png') }}" alt="Banner Edukasi"
                         onerror="this.onerror=null; this.src='{{ asset('images/waste-management.jpg') }}';"
                         style="width: 82px; height: auto; object-fit: contain; filter: drop-shadow(0 4px 10px rgba(0,0,0,0.15));">
                </div>
            </div>
        </div>

        {{-- 2. SECTION TITLE --}}
        <div class="d-flex align-items-center justify-content-between mb-3 px-1">
            <div class="d-flex align-items-center gap-2">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:15px; color:#1a1a2e;">Kabar & Artikel Terkini</h6>
            </div>
            <span class="badge rounded-pill" style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:600; padding:4px 10px;">
                {{ count($educationalNews) }} Berita
            </span>
        </div>

        {{-- 3. NEWS FEED LIST --}}
        @if(isset($educationalNews) && count($educationalNews) > 0)
            <div class="d-flex flex-column gap-2">
                @foreach($educationalNews as $news)
                @php
                    $rawImg = $news->gambar ?? '';
                    if (filter_var($rawImg, FILTER_VALIDATE_URL)) {
                        $imgUrl = $rawImg;
                    } elseif (!empty($rawImg)) {
                        $imgUrl = asset($rawImg);
                    } else {
                        $imgUrl = asset('images/waste-management.jpg');
                    }
                    $domainName = (!empty($news->domain) && $news->domain !== 'undefined') ? $news->domain : 'EcoBuana Edukasi';
                @endphp
                <a href="{{ $news->url }}" target="_blank" rel="noopener noreferrer" class="text-decoration-none d-block">
                    <div class="rounded-4 p-3 bg-white news-card"
                         style="box-shadow: 0 3px 14px rgba(0,0,0,0.05); border: 1px solid #f0f0f0; transition: all 0.22s ease;">
                        <div class="d-flex gap-3 align-items-center">
                            {{-- Thumbnail Image --}}
                            <div class="position-relative flex-shrink-0"
                                 style="width: 90px; height: 90px; border-radius: 14px; overflow: hidden; background: #eef2f6;">
                                <img src="{{ $imgUrl }}"
                                     alt="{{ $news->judul }}"
                                     onerror="this.onerror=null; this.src='{{ asset('images/waste-management.jpg') }}';"
                                     style="width: 100%; height: 100%; object-fit: cover; display: block; transition: transform 0.3s ease;">
                            </div>

                            {{-- Content Column --}}
                            <div class="flex-grow-1 overflow-hidden d-flex flex-column justify-content-between" style="min-height: 90px;">
                                <div>
                                    <h6 class="fw-bold m-0 mb-1 news-title"
                                        style="font-size: 13.5px; color: #1a1a2e; line-height: 1.35; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;">
                                        {{ $news->judul }}
                                    </h6>
                                </div>

                                {{-- Meta Info (Domain, Time, External Icon) --}}
                                <div class="mt-auto pt-2 border-top d-flex align-items-center justify-content-between" style="border-color: #f8fafc !important;">
                                    <div class="d-flex align-items-center gap-2">
                                        <span class="d-inline-flex align-items-center text-truncate"
                                              style="font-size: 11px; color: #008744; font-weight: 600; max-width: 140px;">
                                            <i class="bi bi-globe2 me-1" style="font-size: 10px;"></i>
                                            {{ $domainName }}
                                        </span>
                                        <span style="font-size: 10px; color: #cbd5e1;">•</span>
                                        <span style="font-size: 11px; color: #94a3b8;">
                                            {{ $news->time_elapsed }}
                                        </span>
                                    </div>
                                    <div style="width: 24px; height: 24px; background: #f8fafc; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: #94a3b8;">
                                        <i class="bi bi-box-arrow-up-right" style="font-size: 11px;"></i>
                                    </div>
                                </div>
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
                    <i class="bi bi-journal-x"></i>
                </div>
                <h6 class="fw-bold mb-1" style="color:#1a1a2e; font-size:15px;">Belum Ada Kabar Edukasi</h6>
                <p class="mb-3" style="font-size:12px; color:#64748b; line-height:1.5;">
                    Kabar dan artikel edukasi seputar pengelolaan sampah akan segera hadir di sini.
                </p>
                <a href="{{ url('/dashboard') }}" class="btn btn-primary-custom px-4 py-2 rounded-pill fw-bold text-decoration-none" style="font-size:12px;">
                    <i class="bi bi-house me-1"></i> Kembali ke Beranda
                </a>
            </div>
        @endif

    </div>
</main>

<style>
    .news-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08) !important;
        border-color: #dcfce7 !important;
    }
    .news-card:hover .news-title {
        color: #008744 !important;
    }
    .news-card:hover img {
        transform: scale(1.05);
    }
</style>
@endsection
