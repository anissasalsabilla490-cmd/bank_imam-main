@extends('layout.main')

@section('title', 'EcoBuana | Landing Page')

@section('content')
  <main id="home-page" class="main-container pt-0" style="background:#ffffff; min-height:100vh;">
    
    {{-- ==================== 1. BRAND LOGO SECTION ==================== --}}
    <section class="text-center pt-5 pb-2 px-4" style="background: #ffffff;">
      <div class="d-flex justify-content-center align-items-center py-2">
        <img src="{{ asset('images/logo.png') }}" alt="EcoBuana" style="max-width: 210px; width: 100%; height: auto; object-fit: contain;">
      </div>
    </section>

    {{-- ==================== 2. HERO GREETING & CTA ==================== --}}
    <section class="container px-4 text-center">
      <h1 class="mt-3 fw-bold mb-1" style="font-size:26px; letter-spacing:-0.5px; color:#1a1a2e;">
        Halo! 👋
      </h1>
      <h3 class="fw-bold mb-2" style="font-size:18px; color:#00a056;">
        Selamat Datang di EcoBuana!
      </h3>
      <p class="mt-1 mb-3 text-muted mx-auto" style="font-size:13px; max-width:320px; line-height:1.6;">
        Ayo tukarkan sampah anorganikmu dan dapatkan tabungan tunai serta reward menarik sekarang juga!
      </p>

      {{-- Action Buttons --}}
      <div class="d-flex flex-column gap-2 mb-4">
        <a class="btn btn-primary-custom btn-lg rounded-pill fw-bold text-center text-decoration-none" href="{{ url('login') }}" 
           style="padding: 0.75rem; font-size:15px; box-shadow: 0 4px 15px rgba(0,160,86,0.25);">
          Masuk Sekarang <i class="bi bi-arrow-right ms-1"></i>
        </a>
        <a class="btn btn-outline-custom btn-lg rounded-pill fw-bold text-center text-decoration-none" href="{{ url('register') }}" 
           style="padding: 0.75rem; font-size:15px;">
          Buat Akun Baru
        </a>
      </div>

      {{-- 3 Value Pills --}}
      <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
        <span class="badge rounded-pill" style="background:#f0fdf4; color:#16a34a; font-size:11px; padding:6px 12px; border:1px solid #bbf7d0;">
          🌱 Ramah Lingkungan
        </span>
        <span class="badge rounded-pill" style="background:#eff6ff; color:#1e4d8c; font-size:11px; padding:6px 12px; border:1px solid #bfdbfe;">
          💵 Cuan Sampah
        </span>
        <span class="badge rounded-pill" style="background:#fffbeb; color:#b45309; font-size:11px; padding:6px 12px; border:1px solid #fde68a;">
          ⭐ Poin Reward
        </span>
      </div>
    </section>

    {{-- ==================== 3. APA ITU ECOBUANA ==================== --}}
    <section class="container mt-4 pt-2 px-4">
      <div class="text-center mb-3">
        <span class="badge rounded-pill mb-2 px-3 py-1" style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:700; letter-spacing:0.5px;">
          🌱 TENTANG KAMI
        </span>
        <h4 class="fw-bold mb-1" style="font-size:22px; color:#1a1a2e; letter-spacing:-0.5px;">
          Apa Itu <span style="color:#00a056;">EcoBuana</span>?
        </h4>
        <p class="text-muted mx-auto mb-0" style="font-size:13px; max-width:320px; line-height:1.5;">
          Aplikasi bank sampah digital untuk warga dalam mengubah sampah anorganik menjadi rupiah & reward berkah.
        </p>
      </div>

      {{-- 3 Benefit Mini Cards (Compact & Visual) --}}
      <div class="row g-2 mt-1">
        {{-- Benefit 1: Tabungan --}}
        <div class="col-4">
          <div class="p-3 text-center rounded-4 h-100 d-flex flex-column align-items-center justify-content-center"
               style="background:#f0fdf4; border:1px solid #bbf7d0; box-shadow:0 2px 8px rgba(0,160,86,0.06); transition:transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div style="width:42px; height:42px; background:#dcfce7; color:#16a34a; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:20px;" class="mb-2">
              <i class="bi bi-wallet2"></i>
            </div>
            <div class="fw-bold" style="font-size:12px; color:#166534;">Tabungan Tunai</div>
            <div class="text-muted mt-1" style="font-size:10px; line-height:1.3;">Sampah jadi saldo rupiah</div>
          </div>
        </div>

        {{-- Benefit 2: Poin --}}
        <div class="col-4">
          <div class="p-3 text-center rounded-4 h-100 d-flex flex-column align-items-center justify-content-center"
               style="background:#fffbeb; border:1px solid #fde68a; box-shadow:0 2px 8px rgba(245,158,11,0.06); transition:transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div style="width:42px; height:42px; background:#fef3c7; color:#d97706; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:20px;" class="mb-2">
              <i class="bi bi-star-fill text-warning"></i>
            </div>
            <div class="fw-bold" style="font-size:12px; color:#92400e;">Poin Reward</div>
            <div class="text-muted mt-1" style="font-size:10px; line-height:1.3;">Tukar barang impian</div>
          </div>
        </div>

        {{-- Benefit 3: Lingkungan Bersih --}}
        <div class="col-4">
          <div class="p-3 text-center rounded-4 h-100 d-flex flex-column align-items-center justify-content-center"
               style="background:#eff6ff; border:1px solid #bfdbfe; box-shadow:0 2px 8px rgba(30,77,140,0.06); transition:transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div style="width:42px; height:42px; background:#dbeafe; color:#2563eb; border-radius:12px; display:flex; align-items:center; justify-content:center; font-size:20px;" class="mb-2">
              <i class="bi bi-tree-fill"></i>
            </div>
            <div class="fw-bold" style="font-size:12px; color:#1e40af;">Bumi Lestari</div>
            <div class="text-muted mt-1" style="font-size:10px; line-height:1.3;">Kurangi beban sampah TPA</div>
          </div>
        </div>
      </div>

      {{-- Partnership Pill / Sub-info --}}
      <div class="mt-2 text-center">
        <span class="d-inline-flex align-items-center gap-1 px-3 py-1 rounded-pill" style="background:#f8fafc; border:1px solid #e2e8f0; font-size:11px; color:#64748b;">
          <i class="bi bi-shield-check text-success"></i> Dikembangkan oleh Universitas Mercu Buana
        </span>
      </div>
    </section>

    {{-- ==================== 4. ALUR PENANGANAN SAMPAH ==================== --}}
    <section class="container mt-5 pt-2 px-4">
      <div class="text-center mb-3">
        <span class="badge rounded-pill mb-2 px-3 py-1" style="background:#eff6ff; color:#1e4d8c; font-size:11px; font-weight:700; letter-spacing:0.5px;">
          🔄 EKOSISTEM ECOBUANA
        </span>
        <h4 class="fw-bold mb-1" style="font-size:22px; color:#1a1a2e; letter-spacing:-0.5px;">
          Alur Penanganan Sampah
        </h4>
        <p class="text-muted m-0" style="font-size:13px;">4 pilar sinergi pengolahan sampah berkelanjutan</p>

        {{-- Banner Artwork --}}
        <div class="mt-3 rounded-4 overflow-hidden" style="box-shadow: 0 4px 16px rgba(0,0,0,0.06); border: 1px solid #f0f0f0;">
          <img class="w-100" src="{{ asset('images/waste-art-1.jpg') }}" alt="Alur Penanganan Sampah" style="height: 150px; object-fit: cover;">
        </div>
      </div>

      {{-- 2x2 Pilar Grid --}}
      <div class="row g-2 mt-1">
        {{-- Pilar 1: Pemberdayaan Masyarakat --}}
        <div class="col-6">
          <div class="rounded-4 p-3 bg-white h-100 d-flex flex-column justify-content-between"
               style="box-shadow: 0 2px 10px rgba(0,0,0,0.04); border: 1px solid #e2e8f0; border-top: 3px solid #00a056; transition: transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div>
              <div style="width:38px; height:38px; background:#e6f7ef; color:#00a056; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:18px;" class="mb-2">
                <i class="bi bi-people-fill"></i>
              </div>
              <h6 class="fw-bold mb-1" style="font-size:13px; color:#1a1a2e;">Pemberdayaan</h6>
              <p class="m-0 text-muted" style="font-size:11px; line-height:1.4;">
                Mengajak warga & komunitas RT/RW aktif memilah sampah sejak dari rumah.
              </p>
            </div>
            <div class="mt-2 pt-2 border-top d-flex align-items-center justify-content-between" style="border-color:#f1f5f9 !important;">
              <span class="badge" style="background:#f0fdf4; color:#16a34a; font-size:9px; padding:3px 6px;">Partisipasi</span>
              <span style="font-size:10px; color:#94a3b8; font-weight:700;">#01</span>
            </div>
          </div>
        </div>

        {{-- Pilar 2: Edukasi --}}
        <div class="col-6">
          <div class="rounded-4 p-3 bg-white h-100 d-flex flex-column justify-content-between"
               style="box-shadow: 0 2px 10px rgba(0,0,0,0.04); border: 1px solid #e2e8f0; border-top: 3px solid #1e4d8c; transition: transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div>
              <div style="width:38px; height:38px; background:#eff6ff; color:#1e4d8c; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:18px;" class="mb-2">
                <i class="bi bi-book-half"></i>
              </div>
              <h6 class="fw-bold mb-1" style="font-size:13px; color:#1a1a2e;">Edukasi & Literasi</h6>
              <p class="m-0 text-muted" style="font-size:11px; line-height:1.4;">
                Bimbingan klasifikasi jenis sampah higienis & teknik daur ulang kreatif.
              </p>
            </div>
            <div class="mt-2 pt-2 border-top d-flex align-items-center justify-content-between" style="border-color:#f1f5f9 !important;">
              <span class="badge" style="background:#eff6ff; color:#1e4d8c; font-size:9px; padding:3px 6px;">Literasi</span>
              <span style="font-size:10px; color:#94a3b8; font-weight:700;">#02</span>
            </div>
          </div>
        </div>

        {{-- Pilar 3: Reward & Cuan --}}
        <div class="col-6">
          <div class="rounded-4 p-3 bg-white h-100 d-flex flex-column justify-content-between"
               style="box-shadow: 0 2px 10px rgba(0,0,0,0.04); border: 1px solid #e2e8f0; border-top: 3px solid #f59e0b; transition: transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div>
              <div style="width:38px; height:38px; background:#fffbeb; color:#f59e0b; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:18px;" class="mb-2">
                <i class="bi bi-gift-fill"></i>
              </div>
              <h6 class="fw-bold mb-1" style="font-size:13px; color:#1a1a2e;">Reward & Saldo</h6>
              <p class="m-0 text-muted" style="font-size:11px; line-height:1.4;">
                Apresiasi saldo tabungan rupiah dan bonus poin bintang ⭐ bagi nasabah.
              </p>
            </div>
            <div class="mt-2 pt-2 border-top d-flex align-items-center justify-content-between" style="border-color:#f1f5f9 !important;">
              <span class="badge" style="background:#fffbeb; color:#b45309; font-size:9px; padding:3px 6px;">Insentif</span>
              <span style="font-size:10px; color:#94a3b8; font-weight:700;">#03</span>
            </div>
          </div>
        </div>

        {{-- Pilar 4: Siklus Ekonomi --}}
        <div class="col-6">
          <div class="rounded-4 p-3 bg-white h-100 d-flex flex-column justify-content-between"
               style="box-shadow: 0 2px 10px rgba(0,0,0,0.04); border: 1px solid #e2e8f0; border-top: 3px solid #8b5cf6; transition: transform 0.2s;"
               onmouseover="this.style.transform='translateY(-2px)'"
               onmouseout="this.style.transform='translateY(0)'">
            <div>
              <div style="width:38px; height:38px; background:#f5f3ff; color:#7c3aed; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:18px;" class="mb-2">
                <i class="bi bi-arrow-repeat"></i>
              </div>
              <h6 class="fw-bold mb-1" style="font-size:13px; color:#1a1a2e;">Sirkular Ekonomi</h6>
              <p class="m-0 text-muted" style="font-size:11px; line-height:1.4;">
                Menyalurkan sampah terpilah ke industri daur ulang, kurangi beban TPA.
              </p>
            </div>
            <div class="mt-2 pt-2 border-top d-flex align-items-center justify-content-between" style="border-color:#f1f5f9 !important;">
              <span class="badge" style="background:#f5f3ff; color:#7c3aed; font-size:9px; padding:3px 6px;">Berkelanjutan</span>
              <span style="font-size:10px; color:#94a3b8; font-weight:700;">#04</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    {{-- ==================== 5. CARA PENYETORAN SAMPAH ==================== --}}
    <section class="container mt-5 pt-3 px-4 pb-5">
      <div class="row">
        <div class="col-12 text-center mb-3">
          <span class="badge rounded-pill mb-2 px-3 py-2" style="background:#e6f7ef; color:#00a056; font-size:11px; font-weight:700; letter-spacing:0.5px;">
            ♻️ CARA MENABUNG SAMPAH
          </span>
          <h4 class="fw-bold mb-1" style="font-size:20px; color:#1a1a2e; letter-spacing:-0.5px;">
            Alur Penyetoran Sampah Ke <span style="color:#00a056;">EcoBuana</span>
          </h4>
          <p class="text-muted m-0" style="font-size:13px;">Ikuti 6 langkah mudah berikut untuk menukarkan sampah menjadi saldo & poin</p>

          {{-- Illustrated Banner --}}
          <div class="mt-3 rounded-4 overflow-hidden" style="box-shadow: 0 4px 20px rgba(0,0,0,0.08); border: 1px solid #f0f0f0;">
            <img class="w-100" src="{{ asset('images/waste-management.jpg') }}" alt="alur penyetoran sampah" style="height: 180px; object-fit: cover;">
          </div>
        </div>

        {{-- Step Cards (Timeline Flow) --}}
        <div class="col-12">
          <div class="d-flex flex-column gap-3 mt-2">

            {{-- Step 1 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #00a056; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #00c96e 0%, #00a056 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(0,160,86,0.25);">
                  1
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Pilah Sampah dari Rumah</h6>
                    <span class="badge" style="background:#f0fdf4; color:#16a34a; font-size:10px; font-weight:600;">Bersih & Kering</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Pisahkan sampah anorganik (plastik, kardus, kaleng, botol, dll) sesuai kategori yang diterima dalam keadaan bersih dan kering.
                  </p>
                </div>
              </div>
            </div>

            {{-- Step 2 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #1e4d8c; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #3b82f6 0%, #1e4d8c 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(30,77,140,0.25);">
                  2
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Daftarkan Akun Nasabah</h6>
                    <span class="badge" style="background:#eff6ff; color:#1e4d8c; font-size:10px; font-weight:600;">Gratis & Cepat</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Bagi warga yang belum terdaftar, lakukan registrasi secara online melalui aplikasi EcoBuana dan pilih unit BSU terdekat.
                  </p>
                </div>
              </div>
            </div>

            {{-- Step 3 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #00a056; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #00c96e 0%, #00a056 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(0,160,86,0.25);">
                  3
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Antar ke Bank Sampah Unit (BSU)</h6>
                    <span class="badge" style="background:#f0fdf4; color:#16a34a; font-size:10px; font-weight:600;">Jadwal Operasional</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Antarkan sampah yang telah dipilah ke Bank Sampah Unit (BSU) terdekat sesuai jam dan jadwal pengumpulan yang ditentukan.
                  </p>
                </div>
              </div>
            </div>

            {{-- Step 4 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #f59e0b; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #f59e0b 0%, #d97706 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(245,158,11,0.25);">
                  4
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Penimbangan & Verifikasi</h6>
                    <span class="badge" style="background:#fffbeb; color:#b45309; font-size:10px; font-weight:600;">Transparan</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Sampah yang disetorkan langsung diperiksa kualitasnya dan ditimbang oleh petugas resmi dengan timbangan digital yang akurat.
                  </p>
                </div>
              </div>
            </div>

            {{-- Step 5 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #00a056; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #00c96e 0%, #00a056 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(0,160,86,0.25);">
                  5
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Terima Saldo Tunai & Poin Reward</h6>
                    <span class="badge" style="background:#f0fdf4; color:#16a34a; font-size:10px; font-weight:600;">Otomatis Masuk</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Transaksi dicatat di sistem. Anda otomatis menerima <b>Saldo Uang</b> (harga per Kg) serta bonus <b>Poin Reward ⭐</b> secara instan.
                  </p>
                </div>
              </div>
            </div>

            {{-- Step 6 --}}
            <div class="rounded-4 p-3 bg-white"
                 style="box-shadow: 0 2px 14px rgba(0,0,0,0.06); border: 1px solid #f0f0f0; border-left: 4px solid #8b5cf6; transition: transform 0.2s;"
                 onmouseover="this.style.transform='translateY(-2px)'"
                 onmouseout="this.style.transform='translateY(0)'">
              <div class="d-flex align-items-start gap-3">
                <div style="width:36px; height:36px; background:linear-gradient(135deg, #a78bfa 0%, #8b5cf6 100%); color:#fff; border-radius:12px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0; box-shadow:0 3px 10px rgba(139,92,246,0.25);">
                  6
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="fw-bold m-0" style="font-size:14px; color:#1a1a2e;">Pantau Tabungan & Tukar Reward</h6>
                    <span class="badge" style="background:#f5f3ff; color:#7c3aed; font-size:10px; font-weight:600;">Banyak Pilihan</span>
                  </div>
                  <p class="m-0 text-muted" style="font-size:12px; line-height:1.5;">
                    Pantau saldo dan poin melalui dashboard kapan saja, lalu tukarkan poin dengan hadiah barang impian atau tarik saldo tunai ke rekening.
                  </p>
                </div>
              </div>
            </div>

          </div>
        </div>

        {{-- Closing CTA Card --}}
        <div class="col-12 mt-4 text-center">
          <div class="rounded-4 p-4 text-white"
               style="background: linear-gradient(145deg, #00c96e 0%, #005c2e 100%); box-shadow: 0 8px 24px rgba(0,160,86,0.28); position:relative; overflow:hidden;">
            {{-- Decorative blob --}}
            <div style="position:absolute; top:-20px; right:-20px; width:100px; height:100px; background:rgba(255,255,255,0.1); border-radius:50%;"></div>
            
            <h5 class="fw-bold mb-2" style="font-size:17px; position:relative; z-index:1;">Mulailah Kelola Sampah Bersama Kami! 🌿</h5>
            <p class="mb-3" style="font-size:13px; opacity:0.9; line-height:1.5; position:relative; z-index:1;">
              Daftar sekarang, pilah sampah dari rumah, dan jadikan sampah Anda sumber pendapatan yang berkah.
            </p>
            <a href="{{ url('register') }}" class="btn btn-light rounded-pill fw-bold px-4 py-2 text-decoration-none"
               style="color:#007a3d; font-size:13px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); position:relative; z-index:1;">
              Daftar Jadi Nasabah <i class="bi bi-arrow-right ms-1"></i>
            </a>
          </div>
        </div>

      </div>
    </section>
  </main>
@endsection

@section('scripts')
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script>
    var swiper = new Swiper(".sampahSlider", {
      pagination: {
        el: ".swiper-pagination",
      },
    });
  </script>
@endsection