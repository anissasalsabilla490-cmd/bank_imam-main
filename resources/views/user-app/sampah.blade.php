@extends('layout.main')
@section('title', 'Katalog Sampah | EcoBuana')
@section('content')

{{-- ======================== HEADER KATALOG ======================== --}}
<header style="background: linear-gradient(150deg, #00c96e 0%, #005c2e 100%); position:relative; overflow:hidden; padding-bottom: 32px;">
    {{-- Decorative blobs --}}
    <div style="position:absolute; top:-30px; right:-30px; width:150px; height:150px; background:rgba(255,255,255,0.08); border-radius:50%;"></div>
    <div style="position:absolute; bottom:0; left:-20px; width:100px; height:100px; background:rgba(255,255,255,0.05); border-radius:50%;"></div>

    <div class="px-4 pt-4 pb-1 d-flex align-items-center gap-3" style="position:relative; z-index:1;">
        <a href="{{ url('dashboard') }}" class="text-white text-decoration-none">
            <div style="width:36px; height:36px; background:rgba(255,255,255,0.2); border-radius:10px; display:flex; align-items:center; justify-content:center;">
                <i class="bi bi-arrow-left" style="font-size:18px;"></i>
            </div>
        </a>
        <div>
            <p class="m-0 text-white" style="font-size:11px; opacity:0.8;">Temukan jenis sampah</p>
            <h5 class="m-0 text-white fw-bold" style="font-size:18px; letter-spacing:0.3px;">Katalog Sampah ♻️</h5>
        </div>
    </div>

    {{-- Wave --}}
    <svg viewBox="0 0 428 40" xmlns="http://www.w3.org/2000/svg" style="position:absolute; bottom:-1px; left:0; width:100%;">
        <path d="M0,20 C100,40 328,0 428,20 L428,40 L0,40 Z" fill="#f4f6f8"/>
    </svg>
</header>

<main class="main-container" style="background:#f4f6f8;">
    <div class="container-body px-3 pt-3 pb-5">

    {{-- Pencarian jenis sampah & istilah --}}
    <div class="mb-3">
        <input type="search" id="cari-sampah" class="form-control" placeholder="🔍 Cari jenis sampah atau istilah (mis. botol, kardus, bodong)…"
               style="border-radius:12px; padding:12px 14px; font-size:14px; border:1.5px solid #cbd5e1;" autocomplete="off">
    </div>

    {{-- Filter Tags --}}
    @if (isset($barang) || !empty($sampahByCategory))
        <div class="mb-3">
            <div class="filter-tags-wrapper">
                <div class="filter-tag active" data-filter="all">✨ Semua</div>
                @foreach ($sampahByCategory as $categoryId => $sampah)
                    @if(count($sampah) > 0)
                        <div class="filter-tag" data-filter="{{ $categoryId }}">{{ $categoryId }}</div>
                    @endif
                @endforeach
            </div>
        </div>

        {{-- Category Groups --}}
        @foreach ($sampahByCategory as $categoryId => $sampah)
            @if(count($sampah) > 0)
                <div class="category-group mb-4" data-category="{{ $categoryId }}" style="display:block !important; width:100% !important;">
                    {{-- Section Title --}}
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                        <h6 class="fw-bold m-0" style="font-size:15px; color:#1a1a2e;">{{ $categoryId }}</h6>
                    </div>

                    {{-- Items Grid --}}
                    <div class="row g-3">
                        @foreach ($sampah as $item)
                        @php
                            $imgUrl = filter_var($item->image, FILTER_VALIDATE_URL) ? $item->image : asset($item->image);
                        @endphp
                        <div class="col-6 item-card" data-category="{{ $categoryId }}" data-cari="{{ mb_strtolower($item->name.' '.$item->deskripsi.' '.$categoryId) }}">
                            <a href="{{ url('/sampah/'.$item->id.'/detail') }}" class="text-decoration-none d-block h-100">
                                <div class="rounded-3 overflow-hidden h-100 d-flex flex-column"
                                     style="background:#ffffff; box-shadow: 0 2px 10px rgba(0,0,0,0.07); border: 1px solid #f0f0f0; transition: all 0.22s ease;"
                                     onmouseover="this.style.transform='translateY(-3px)'; this.style.boxShadow='0 8px 24px rgba(0,0,0,0.12)'"
                                     onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 10px rgba(0,0,0,0.07)'">
                                    {{-- Image --}}
                                    <div style="position:relative; overflow:hidden; background:#eef2f6; height:130px; display:flex; align-items:center; justify-content:center;">
                                        <img src="{{ $imgUrl }}" alt="{{ $item->name }}"
                                             onerror="this.onerror=null; this.src='{{ asset('images/logo.png') }}'; this.style.objectFit='contain'; this.style.padding='16px';"
                                             style="width:100%; height:130px; object-fit:cover; display:block;">
                                        {{-- Ikon informasi (penjelasan jenis sampah) --}}
                                        <button type="button" class="info-sampah" aria-label="Penjelasan {{ $item->name }}"
                                                data-nama="{{ $item->name }}" data-desk="{{ $item->deskripsi }}"
                                                style="position:absolute; top:6px; right:6px; z-index:3; width:34px; height:34px; border-radius:50%; border:0; background:#fff; color:#0d47a1; font-weight:700; font-size:16px; box-shadow:0 2px 6px rgba(0,0,0,.25);">ⓘ</button>
                                        {{-- Category badge --}}
                                        <span style="position:absolute; top:8px; left:8px; z-index:2; background:rgba(0,160,86,0.92); backdrop-filter:blur(4px); color:#fff; font-size:10px; font-weight:700; padding: 2px 8px; border-radius:20px; box-shadow:0 2px 6px rgba(0,0,0,0.15);">
                                            {{ $categoryId }}
                                        </span>
                                    </div>
                                    {{-- Info --}}
                                    <div class="p-2 d-flex flex-column justify-content-between flex-grow-1">
                                        <div>
                                            <h6 class="fw-bold m-0 mb-1" style="font-size:13px; color:#1a1a2e; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                                {{ $item->name }}
                                            </h6>
                                            @if($item->deskripsi != "")
                                                <p style="font-size:11px; color:#9ca3af; margin:0 0 6px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                                    {{ $item->deskripsi }}
                                                </p>
                                            @endif
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-auto pt-1">
                                            <span style="font-size:13px; font-weight:700; color:#1e4d8c;">
                                                Rp{{ number_format($item->price_per_kg, 0, ',', '.') }}<span style="font-weight:400; color:#9ca3af; font-size:11px;">/kg</span>
                                            </span>
                                            <span style="font-size:12px; font-weight:700; color:#d97706; display:inline-flex; align-items:center; gap:3px;">
                                                <i class="bi bi-star-fill" style="color:#f59e0b; font-size:11px;"></i>+{{ $item->poin_per_kg }}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        @endforeach
                    </div>
                </div>
            @endif
        @endforeach
    @else
        <div class="text-center py-5 mt-4">
            <p style="font-size:40px; margin-bottom:8px;">♻️</p>
            <h6 class="fw-bold" style="color:#1a1a2e;">Katalog Belum Tersedia</h6>
            <p style="font-size:13px; color:#9ca3af;">Tunggu update selanjutnya ya!</p>
        </div>
    @endif

    </div>

    {{-- Istilah khusus --}}
    @if(isset($istilah) && count($istilah))
    <section class="px-3 pb-4" id="blok-istilah">
        <div class="d-flex align-items-center gap-2 mb-2">
            <div style="width:4px; height:18px; background:#d97706; border-radius:4px;"></div>
            <h6 class="fw-bold m-0" style="font-size:15px;">Istilah Khusus</h6>
        </div>
        @foreach($istilah as $t)
        <div class="rounded-3 p-3 mb-2 item-istilah" data-cari="{{ mb_strtolower($t->istilah.' '.$t->penjelasan) }}" style="background:#fffbeb; border:1px solid #fde68a;">
            <p class="fw-bold m-0" style="font-size:13px;">{{ $t->istilah }}</p>
            <p class="m-0" style="font-size:12px; color:#4b5563;">{{ $t->penjelasan }}</p>
        </div>
        @endforeach
    </section>
    @endif

    {{-- Panel penjelasan (ⓘ) --}}
    <div id="panel-info" role="dialog" aria-modal="true" style="display:none; position:fixed; left:0; right:0; bottom:0; z-index:9999; background:#fff; border-radius:18px 18px 0 0; padding:18px 20px 28px; box-shadow:0 -6px 24px rgba(0,0,0,.25);">
        <div class="d-flex justify-content-between align-items-start">
            <h6 class="fw-bold" id="panel-info-nama" style="font-size:16px;"></h6>
            <button type="button" id="panel-info-tutup" aria-label="Tutup" style="border:0; background:#f1f5f9; border-radius:50%; width:36px; height:36px; font-size:18px;">✕</button>
        </div>
        <p id="panel-info-desk" style="font-size:14px; color:#374151; margin:6px 0 0;"></p>
    </div>

    {{-- Sticky Cart (tersembunyi) --}}
    <div id="cart" class="p-4 d-none">
        <div id="cart-summary" class="d-flex justify-content-between align-items-center w-100 px-2">
            <p id="cart-weight" class="m-0"><b>Jual</b> · 0 kg | 0 jenis</p>
            <b id="cart-total" class="m-0">Rp. 0</b>
        </div>
        <form action="{{ route('sales.store') }}" method="POST" id="sales-form">
            @csrf
            <input type="hidden" name="items" id="cart-items-input">
            <input type="hidden" name="total_weight" id="total-weight-input">
            <input type="hidden" name="total_price" id="total-price-input">
            <button type="submit" class="btn btn-primary d-inline"> > </button>
        </form>
    </div>
</main>

<script src="{{ asset('js/sampah.js') }}?v={{ time() }}"></script>
<script>
// Filter inline backup to ensure browser cache doesn't break the layout
document.addEventListener("DOMContentLoaded", function () {
    const filterTags = document.querySelectorAll(".filter-tag");
    const categoryGroups = document.querySelectorAll(".category-group");

    filterTags.forEach((tag) => {
        tag.addEventListener("click", function () {
            const filter = this.dataset.filter;
            categoryGroups.forEach((group) => {
                if (filter === "all" || group.dataset.category === filter) {
                    group.style.setProperty('display', 'block', 'important');
                } else {
                    group.style.setProperty('display', 'none', 'important');
                }
            });
        });
    });
});
</script>
<script>
(function(){
  var q=document.getElementById('cari-sampah'); if(!q) return;
  function cari(){
    var t=q.value.trim().toLowerCase();
    document.querySelectorAll('.item-card').forEach(function(e){ e.style.display=(!t||e.dataset.cari.indexOf(t)>-1)?'':'none'; });
    document.querySelectorAll('.category-group').forEach(function(g){
      var ada=g.querySelectorAll('.item-card:not([style*="display: none"])').length; g.style.setProperty('display', (t&&!ada)?'none':'block','important');
    });
    document.querySelectorAll('.item-istilah').forEach(function(e){ e.style.display=(!t||e.dataset.cari.indexOf(t)>-1)?'':'none'; });
  }
  q.addEventListener('input',cari);
  var p=document.getElementById('panel-info');
  document.addEventListener('click',function(e){
    var b=e.target.closest ? e.target.closest('.info-sampah') : null;
    if(b){ e.preventDefault(); e.stopPropagation();
      document.getElementById('panel-info-nama').textContent=b.dataset.nama;
      document.getElementById('panel-info-desk').textContent=b.dataset.desk||'Belum ada penjelasan untuk jenis sampah ini.';
      p.style.display='block'; return; }
    if(e.target.id==='panel-info-tutup'||(p.style.display==='block'&&!p.contains(e.target))) p.style.display='none';
  },true);
})();
</script>
@endsection
