@extends('layout.main')
@section('title', 'Kalkulator Setoran | EcoBuana')

@section('content')
<link rel="stylesheet" href="{{ asset('css/kalkulator.css') }}">
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); padding-bottom: 18px;">
    <div class="px-4 pt-4 pb-2 d-flex align-items-center gap-3">
        <a href="{{ url('/dashboard') }}" class="text-white text-decoration-none" aria-label="Kembali">
            <div style="width:38px; height:38px; background:rgba(255,255,255,0.2); border-radius:12px; display:flex; align-items:center; justify-content:center;">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div class="flex-grow-1">
            <p class="m-0 text-white" style="font-size:11px; opacity:0.85;">Perkiraan tabungan</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:17px;">Kalkulator Setoran</h5>
        </div>
        <i class="bi bi-calculator text-white" style="font-size:22px;"></i>
    </div>
</header>

<main class="main-container px-3 pt-3 pb-5">
    <p style="font-size:13px; color:#4b5563;">Hitung berat dan perkiraan saldo sebelum menyetor. <b>Boleh memakai koma</b>, misalnya 1,7 atau 1,7kg 2,5kg. Nilai akhir mengikuti penimbangan di unit.</p>
    <div id="kalk"></div>
</main>

<script src="{{ asset('js/berat.js') }}"></script>
<script src="{{ asset('js/kalkulator.js') }}"></script>
<script>Kalkulator.pasang(document.getElementById('kalk'), {sampah: @json($sampah)});</script>
@endsection
