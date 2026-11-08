{{-- Ringkasan bulan ini, harga terbaru, jadwal pengumpulan (dashboard nasabah) --}}
<section class="px-4 mt-4">
    <div class="d-flex align-items-center gap-2 mb-3">
        <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
        <h6 class="fw-bold m-0" style="font-size:15px;">Ringkasan Bulan Ini</h6>
    </div>
    <div class="row g-2 mb-3">
        <div class="col-6">
            <div class="rounded-3 p-3 h-100" style="background:#e6f7ef; border:1px solid #b7e4cd;">
                <p class="m-0" style="font-size:12px; color:#047857;"><i class="bi bi-arrow-down-circle-fill me-1"></i>Saldo masuk</p>
                <p class="m-0 fw-bold" style="font-size:17px; color:#065f46;">Rp{{ number_format($ringkasan['masuk']->rp, 0, ',', '.') }}</p>
                <p class="m-0" style="font-size:11px; color:#047857;">{{ $ringkasan['masuk']->n }}× setor · {{ rtrim(rtrim(number_format($ringkasan['masuk']->kg, 2, ',', '.'), '0'), ',') }} kg</p>
            </div>
        </div>
        <div class="col-6">
            <div class="rounded-3 p-3 h-100" style="background:#fff1f2; border:1px solid #fecdd3;">
                <p class="m-0" style="font-size:12px; color:#be123c;"><i class="bi bi-arrow-up-circle-fill me-1"></i>Saldo keluar</p>
                <p class="m-0 fw-bold" style="font-size:17px; color:#9f1239;">Rp{{ number_format($ringkasan['keluar'], 0, ',', '.') }}</p>
                <p class="m-0" style="font-size:11px; color:#be123c;">penukaran & penarikan</p>
            </div>
        </div>
    </div>

    <a href="{{ route('kalkulator') }}" class="d-flex align-items-center gap-3 rounded-3 p-3 mb-3 text-decoration-none" style="background:#fffbeb; border:1px solid #fde68a;">
        <i class="bi bi-calculator-fill" style="font-size:22px; color:#d97706;"></i>
        <span style="font-size:13px; color:#1a1a2e;"><b>Kalkulator Setoran</b><br><span style="font-size:11px; color:#6b7280;">Hitung perkiraan saldo, boleh pakai koma (1,7 kg)</span></span>
        <i class="bi bi-chevron-right ms-auto" style="color:#9ca3af;"></i>
    </a>

    @if(count($ringkasan['jadwal']))
    <div class="rounded-3 p-3 mb-3" style="background:#fff; box-shadow:0 1px 8px rgba(0,0,0,.07);">
        <p class="fw-bold mb-2" style="font-size:13px;"><i class="bi bi-calendar-event me-1" style="color:#00a056;"></i>Jadwal pengumpulan sampah</p>
        @foreach($ringkasan['jadwal'] as $j)
        <p class="mb-1" style="font-size:12px; color:#374151;">
            <b>{{ \Carbon\Carbon::parse($j->tanggal)->translatedFormat('l, d M Y') }}</b>
            @if($j->jam_mulai) · {{ substr($j->jam_mulai,0,5) }}{{ $j->jam_selesai ? '–'.substr($j->jam_selesai,0,5) : '' }}@endif
            <br><span style="color:#6b7280;">{{ $j->judul }}{{ $j->lokasi ? ' · '.$j->lokasi : '' }}</span>
        </p>
        @endforeach
    </div>
    @endif

    @if(count($ringkasan['harga']))
    <div class="rounded-3 p-3" style="background:#fff; box-shadow:0 1px 8px rgba(0,0,0,.07);">
        <div class="d-flex justify-content-between mb-2">
            <p class="fw-bold m-0" style="font-size:13px;"><i class="bi bi-graph-up-arrow me-1" style="color:#d97706;"></i>Harga sampah terbaru</p>
            <a href="{{ url('/kategori-sampah') }}" class="text-decoration-none" style="font-size:12px; color:#00a056; font-weight:600;">Katalog →</a>
        </div>
        @foreach($ringkasan['harga'] as $h)
        <div class="d-flex justify-content-between" style="font-size:12px;">
            <span>{{ $h->name }}</span>
            <span><s style="color:#9ca3af;">Rp{{ number_format($h->harga_lama,0,',','.') }}</s>
                <b style="color:{{ $h->harga_baru > $h->harga_lama ? '#047857' : '#be123c' }};">{{ $h->harga_baru > $h->harga_lama ? '▲' : '▼' }} Rp{{ number_format($h->harga_baru,0,',','.') }}</b></span>
        </div>
        @endforeach
    </div>
    @endif
</section>
