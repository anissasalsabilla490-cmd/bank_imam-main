@extends('layout.header-transaksi')

@section('title', 'Tarik Saldo | MeBank')
@section('transaction-title', 'TARIK SALDO')

@section('transaction-content')
@php
    $balance = $saldo ? (int) $saldo->total_saldo : 0;
    $min = (int) config('withdrawal.min_amount');
    $max = (int) config('withdrawal.max_amount');
    $groups = ['ewallet' => 'E-Wallet', 'bank' => 'Transfer Bank'];
@endphp
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-3">

        @if (session('error'))
            <div class="alert alert-danger py-2 px-3 rounded-3" style="font-size:13px;">{{ session('error') }}</div>
        @endif
        @if ($errors->any())
            <div class="alert alert-danger py-2 px-3 rounded-3" style="font-size:13px;">
                @foreach ($errors->all() as $e)<div>{{ $e }}</div>@endforeach
            </div>
        @endif
        @if (!$enabled)
            <div class="alert alert-warning py-2 px-3 rounded-3" style="font-size:13px;">Penarikan saldo sedang dinonaktifkan sementara.</div>
        @endif

        <div class="rounded-4 p-4 mb-3 text-center" style="background: linear-gradient(135deg, #f0fdf4 0%, #e6f7ef 100%); border: 1.5px solid #bbf7d0;">
            <p class="m-0 text-muted" style="font-size:12px; font-weight:600; text-transform:uppercase; letter-spacing:.5px;">Saldo Anda</p>
            <h3 class="fw-bold my-1" style="font-size:28px; color:#008744;">Rp {{ number_format($balance, 0, ',', '.') }}</h3>
            <a href="{{ route('tarikSaldo.riwayat') }}" class="text-decoration-none" style="font-size:12px; font-weight:600; color:#008744;">
                <i class="bi bi-clock-history me-1"></i>Riwayat penarikan
            </a>
        </div>

        <form action="{{ route('tarikSaldo.confirm') }}" method="post" id="wdForm" class="rounded-4 p-4"
              style="background:#fff; box-shadow:0 4px 20px rgba(0,0,0,.06); border:1px solid #f0f0f0;">
            @csrf

            <h6 class="fw-bold mb-2" style="font-size:15px;">Tujuan penarikan</h6>
            @foreach ($groups as $type => $title)
                <p class="mb-1 mt-2 text-muted" style="font-size:12px; font-weight:600;">{{ $title }}</p>
                <div class="row g-2">
                    @foreach ($channels as $code => $ch)
                        @if ($ch['type'] === $type)
                            <div class="col-6">
                                <input type="radio" class="btn-check" name="channel_code" id="ch_{{ $code }}" value="{{ $code }}"
                                       data-type="{{ $type }}" {{ old('channel_code') === $code ? 'checked' : '' }} required>
                                <label class="btn btn-outline-success w-100 py-2 rounded-3" for="ch_{{ $code }}" style="font-size:13px; font-weight:600;">
                                    {{ $ch['label'] }}
                                </label>
                            </div>
                        @endif
                    @endforeach
                </div>
            @endforeach

            <div class="mt-3">
                <label class="form-label fw-semibold" style="font-size:13px;" id="numLabel">Nomor e-wallet / rekening</label>
                <input type="text" inputmode="numeric" name="account_number" class="form-control rounded-3" maxlength="30"
                       placeholder="081234567890" value="{{ old('account_number', $last ? $last->account_number : '') }}" required autocomplete="off">
            </div>
            <div class="mt-3">
                <label class="form-label fw-semibold" style="font-size:13px;">Nama pemilik akun / rekening</label>
                <input type="text" name="account_name" class="form-control rounded-3" maxlength="60"
                       value="{{ old('account_name', $last ? $last->account_name : auth()->user()->username) }}" required autocomplete="off">
                <div class="form-text" style="font-size:11px;">Harus sama dengan nama pada akun tujuan.</div>
            </div>
            <div class="mt-3">
                <label class="form-label fw-semibold" style="font-size:13px;">Nominal (Rp)</label>
                <input type="number" name="amount" id="amount" class="form-control rounded-3" min="{{ $min }}" max="{{ min($max, max($balance, $min)) }}" step="1"
                       placeholder="{{ $min }}" value="{{ old('amount') }}" required>
                <div class="form-text" style="font-size:11px;">
                    Minimal Rp {{ number_format($min, 0, ',', '.') }}, maksimal Rp {{ number_format($max, 0, ',', '.') }} per transaksi.
                </div>
                <div class="d-flex flex-wrap gap-2 mt-2">
                    @foreach ([25000, 50000, 100000, 200000] as $q)
                        @if ($q >= $min && $q <= $max)
                            <button type="button" class="btn btn-sm btn-outline-secondary rounded-pill quick" data-v="{{ $q }}">{{ number_format($q / 1000, 0) }}rb</button>
                        @endif
                    @endforeach
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-pill quick" data-v="{{ min($balance, $max) }}">Maks</button>
                </div>
            </div>

            <button type="submit" class="btn w-100 py-3 rounded-pill fw-bold text-white mt-4" {{ $enabled ? '' : 'disabled' }}
                    style="background: linear-gradient(135deg, #00c96e 0%, #008744 100%); border:none; font-size:15px;">
                Lanjut <i class="bi bi-arrow-right ms-1"></i>
            </button>
        </form>
    </div>
</main>
@endsection

@section('scripts')
<script>
document.querySelectorAll('.quick').forEach(function (b) {
    b.addEventListener('click', function () { document.getElementById('amount').value = b.dataset.v; });
});
document.querySelectorAll('input[name=channel_code]').forEach(function (r) {
    r.addEventListener('change', function () {
        document.getElementById('numLabel').textContent = r.dataset.type === 'bank' ? 'Nomor rekening' : 'Nomor e-wallet (terdaftar)';
    });
});
</script>
@endsection
