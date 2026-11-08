@extends('layout.header-transaksi')

@section('title', 'Riwayat Penarikan | MeBank')
@section('transaction-title', 'RIWAYAT PENARIKAN')

@section('transaction-content')
@php
    $badge = ['success' => '#dcfce7;color:#166534', 'failed' => '#fee2e2;color:#991b1b', 'processing' => '#fef3c7;color:#92400e', 'pending' => '#fef3c7;color:#92400e', 'review' => '#e0e7ff;color:#3730a3'];
@endphp
<main class="main-container" style="background:#f4f6f8; min-height: calc(100vh - 64px); padding-bottom: 110px;">
    <div class="px-3 pt-3">
        @if (session('error'))
            <div class="alert alert-warning py-2 px-3 rounded-3" style="font-size:13px;">{{ session('error') }}</div>
        @endif

        @forelse ($items as $w)
            <a href="{{ route('tarikSaldo.show', $w->id) }}" class="text-decoration-none d-block mb-2">
                <div class="rounded-4 p-3 d-flex justify-content-between align-items-center" style="background:#fff; border:1px solid #f0f0f0; box-shadow:0 1px 6px rgba(0,0,0,.05);">
                    <div>
                        <div class="fw-bold" style="font-size:14px; color:#111827;">Rp {{ number_format($w->amount, 0, ',', '.') }} &rarr; {{ $w->channelLabel() }}</div>
                        <div class="text-muted" style="font-size:11px;">{{ $w->maskedAccount() }} &middot; {{ $w->created_at->format('d/m/Y H:i') }}</div>
                    </div>
                    <span class="badge rounded-pill px-3 py-2" style="background:{{ $badge[$w->status] ?? '#e5e7eb;color:#374151' }}; font-size:11px;">{{ $w->statusLabel() }}</span>
                </div>
            </a>
        @empty
            <div class="text-center text-muted py-5" style="font-size:13px;">Belum ada penarikan.</div>
        @endforelse

        <div class="mt-3">{{ $items->links('pagination::bootstrap-4') }}</div>
        <a href="{{ route('tarikSaldo.index') }}" class="btn btn-success w-100 py-3 rounded-pill fw-bold mt-3">Tarik saldo</a>
    </div>
</main>
@endsection
