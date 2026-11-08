@extends('layout.header-transaksi')

@section('title', 'Konfirmasi Penarikan | MeBank')
@section('transaction-title', 'KONFIRMASI PENARIKAN')

@section('transaction-content')
@php
    $net = $data['amount'] - $fee;
    $left = $balance - $data['amount'];
    $rp = function ($n) { return 'Rp ' . number_format($n, 0, ',', '.'); };
@endphp
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-3">
        <div class="rounded-4 p-4" style="background:#fff; box-shadow:0 4px 20px rgba(0,0,0,.06); border:1px solid #f0f0f0;">

            <div class="text-center py-3 mb-3 rounded-4" style="background: linear-gradient(135deg, #f0fdf4 0%, #e6f7ef 100%); border:1.5px solid #bbf7d0;">
                <p class="m-0 text-muted" style="font-size:12px; font-weight:600; text-transform:uppercase;">Nominal Penarikan</p>
                <h3 class="fw-bold my-1" style="font-size:28px; color:#008744;">{{ $rp($data['amount']) }}</h3>
            </div>

            <div class="rounded-3 p-3 mb-3" style="background:#f9fafb; border:1px solid #e5e7eb; font-size:13px;">
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Tujuan</span><span class="fw-bold">{{ $channel['label'] }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Nomor</span><span class="fw-bold">{{ $data['account_number'] }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Atas nama</span><span class="fw-bold">{{ $data['account_name'] }}</span></div>
                <div class="d-flex justify-content-between py-2 border-bottom"><span class="text-muted">Biaya</span><span class="fw-bold">{{ $rp($fee) }}</span></div>
                <div class="d-flex justify-content-between py-2"><span class="text-muted">Dana diterima</span><span class="fw-bold" style="color:#008744;">{{ $rp($net) }}</span></div>
            </div>

            <div class="rounded-3 p-3 mb-3" style="border:1.5px dashed #cbd5e1; font-size:13px;">
                <div class="d-flex justify-content-between mb-2"><span class="text-muted">Saldo saat ini</span><span class="fw-bold">{{ $rp($balance) }}</span></div>
                <div class="d-flex justify-content-between mb-2"><span class="text-muted">Dipotong</span><span class="fw-bold text-danger">- {{ $rp($data['amount']) }}</span></div>
                <div class="d-flex justify-content-between pt-2 border-top"><span class="fw-bold">Sisa saldo</span><span class="fw-bold" style="color:#008744;">{{ $rp(max($left, 0)) }}</span></div>
            </div>

            <div class="d-flex gap-2 p-3 mb-4 rounded-3" style="background:#fffbeb; border:1px solid #fde68a; font-size:12px; color:#92400e;">
                <i class="bi bi-exclamation-triangle-fill mt-1"></i>
                <div>Pastikan nomor dan nama sudah benar. Dana yang terkirim ke tujuan yang salah <b>tidak dapat ditarik kembali</b>. Saldo dipotong saat Anda menekan tombol di bawah.</div>
            </div>

            @if ($left < 0)
                <div class="alert alert-danger py-2 px-3 rounded-3" style="font-size:12px;">Saldo tidak mencukupi untuk penarikan ini.</div>
                <a href="{{ route('tarikSaldo.index') }}" class="btn btn-outline-secondary w-100 py-3 rounded-pill fw-bold">Ubah nominal</a>
            @else
                <form action="{{ route('tarikSaldo.store') }}" method="post" id="storeForm">
                    @csrf
                    <input type="hidden" name="submit_token" value="{{ $token }}">
                    <input type="hidden" name="channel_code" value="{{ $data['channel_code'] }}">
                    <input type="hidden" name="account_number" value="{{ $data['account_number'] }}">
                    <input type="hidden" name="account_name" value="{{ $data['account_name'] }}">
                    <input type="hidden" name="amount" value="{{ $data['amount'] }}">
                    <button type="submit" id="storeBtn" class="btn w-100 py-3 rounded-pill fw-bold text-white"
                            style="background: linear-gradient(135deg, #00c96e 0%, #008744 100%); border:none; font-size:15px;">
                        Tarik sekarang <i class="bi bi-check2-circle ms-1"></i>
                    </button>
                </form>
                <div class="text-center mt-3">
                    <a href="{{ route('tarikSaldo.index') }}" class="text-decoration-none text-muted" style="font-size:13px; font-weight:600;">
                        <i class="bi bi-arrow-left me-1"></i>Ubah data
                    </a>
                </div>
            @endif
        </div>
    </div>
</main>
@endsection

@section('scripts')
<script>
document.getElementById('storeForm') && document.getElementById('storeForm').addEventListener('submit', function () {
    var b = document.getElementById('storeBtn'); b.disabled = true; b.textContent = 'Memproses...';
});
</script>
@endsection
