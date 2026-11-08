@extends('layout.header-transaksi')

@section('title', 'Status Penarikan | MeBank')
@section('transaction-title', 'STATUS PENARIKAN')

@section('transaction-content')
@php
    $rp = function ($n) { return 'Rp ' . number_format($n, 0, ',', '.'); };
    $steps = [
        ['Diajukan', true],
        ['Diproses', in_array($w->status, ['processing', 'success', 'review', 'failed'])],
        [$w->status === 'failed' ? 'Gagal' : 'Berhasil', in_array($w->status, ['success', 'failed'])],
    ];
    $color = $w->status === 'success' ? '#008744' : ($w->status === 'failed' ? '#dc2626' : '#d97706');
    $icon = $w->status === 'success' ? 'bi-check-circle-fill' : ($w->status === 'failed' ? 'bi-x-circle-fill' : 'bi-hourglass-split');
@endphp
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-3">
        <div class="rounded-4 p-4" style="background:#fff; box-shadow:0 4px 20px rgba(0,0,0,.06); border:1px solid #f0f0f0;">
            <div class="text-center mb-3">
                <i class="bi {{ $icon }}" id="wdIcon" style="font-size:52px; color:{{ $color }};"></i>
                <h5 class="fw-bold mt-2 mb-0" id="wdLabel">{{ $w->statusLabel() }}</h5>
                <p class="text-muted m-0" style="font-size:12px;">{{ $w->reference_id }}</p>
            </div>

            @if ($w->status === 'failed')
                <div class="alert alert-danger py-2 px-3 rounded-3" style="font-size:12px;">
                    Penarikan tidak berhasil. Saldo sebesar {{ $rp($w->amount) }} sudah dikembalikan ke akun Anda. Silakan coba lagi atau hubungi pengelola BSU.
                </div>
            @elseif ($w->status === 'review')
                <div class="alert alert-warning py-2 px-3 rounded-3" style="font-size:12px;">
                    Penarikan Anda sedang diverifikasi oleh pengelola. Saldo tidak akan hilang: jika gagal akan dikembalikan.
                </div>
            @elseif ($w->status !== 'success')
                <div class="alert alert-info py-2 px-3 rounded-3" style="font-size:12px;">Halaman ini diperbarui otomatis. Anda boleh menutupnya; hasilnya tetap tercatat di riwayat.</div>
            @endif

            <div class="d-flex justify-content-between mb-4 px-2">
                @foreach ($steps as $i => $s)
                    <div class="text-center flex-fill">
                        <div class="mx-auto rounded-circle d-flex align-items-center justify-content-center"
                             style="width:30px;height:30px;background:{{ $s[1] ? $color : '#e5e7eb' }};color:#fff;font-size:14px;">
                            <i class="bi {{ $s[1] ? 'bi-check-lg' : 'bi-circle' }}"></i>
                        </div>
                        <div style="font-size:11px; margin-top:4px; color:{{ $s[1] ? '#111827' : '#9ca3af' }};">{{ $s[0] }}</div>
                    </div>
                @endforeach
            </div>

            <div class="rounded-3 p-3" style="background:#f9fafb; border:1px solid #e5e7eb; font-size:13px;">
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Tujuan</span><span class="fw-bold">{{ $w->channelLabel() }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Nomor</span><span class="fw-bold">{{ $w->maskedAccount() }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Nominal</span><span class="fw-bold">{{ $rp($w->amount) }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Dana diterima</span><span class="fw-bold">{{ $rp($w->net_amount) }}</span></div>
                <div class="d-flex justify-content-between py-2"><span class="text-muted">Diajukan</span><span class="fw-bold">{{ $w->created_at->format('d/m/Y H:i') }}</span></div>
            </div>

            <a href="{{ route('tarikSaldo.riwayat') }}" class="btn btn-outline-success w-100 py-3 rounded-pill fw-bold mt-4">Lihat riwayat</a>
        </div>
    </div>
</main>
@endsection

@section('scripts')
@if (!$w->isFinal())
<script>
(function poll() {
    setTimeout(function () {
        fetch("{{ route('tarikSaldo.status', $w->id) }}", { headers: { 'Accept': 'application/json' }, credentials: 'same-origin' })
            .then(function (r) { return r.ok ? r.json() : null; })
            .then(function (d) {
                if (d && d.final) { location.reload(); }
                else {
                    if (d) { document.getElementById('wdLabel').textContent = d.label; }
                    poll();
                }
            })
            .catch(function () { poll(); });
    }, 5000);
})();
</script>
@endif
@endsection
