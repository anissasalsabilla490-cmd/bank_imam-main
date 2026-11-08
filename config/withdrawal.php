<?php

/*
|--------------------------------------------------------------------------
| Konfigurasi Penarikan Saldo Digital
|--------------------------------------------------------------------------
| Semua nilai rupiah dalam satuan Rupiah bulat (integer).
| Kode channel mengikuti daftar resmi Xendit Payouts:
| https://docs.xendit.co/xendisburse/channel-codes
| PASTIKAN setiap channel di bawah masih didukung oleh akun Xendit Anda
| sebelum diaktifkan di produksi.
*/

return [

    // Penarikan dapat dimatikan cepat tanpa deploy ulang (WITHDRAWAL_ENABLED=false).
    'enabled' => (bool) env('WITHDRAWAL_ENABLED', true),

    'min_amount'        => (int) env('WITHDRAWAL_MIN', 10000),
    'max_amount'        => (int) env('WITHDRAWAL_MAX', 500000),
    'daily_amount_limit' => (int) env('WITHDRAWAL_DAILY_AMOUNT', 1000000),
    'daily_count_limit'  => (int) env('WITHDRAWAL_DAILY_COUNT', 3),

    // Biaya yang dipotong dari nasabah (0 = ditanggung pengelola).
    // Nasabah dipotong saldo sebesar nominal penuh; dana yang dikirim = nominal - biaya.
    'fee' => [
        'ewallet' => (int) env('WITHDRAWAL_FEE_EWALLET', 0),
        'bank'    => (int) env('WITHDRAWAL_FEE_BANK', 0),
    ],

    // Berapa menit status "pending" tanpa gateway_id dibiarkan sebelum dikirim ulang oleh reconcile.
    'stale_pending_minutes' => 3,
    // Berapa menit status "processing"/"review" dibiarkan sebelum dicek ulang ke Xendit.
    'stale_processing_minutes' => 10,

    'channels' => [
        'ID_DANA'      => ['label' => 'DANA',      'type' => 'ewallet'],
        'ID_OVO'       => ['label' => 'OVO',       'type' => 'ewallet'],
        'ID_GOPAY'     => ['label' => 'GoPay',     'type' => 'ewallet'],
        'ID_SHOPEEPAY' => ['label' => 'ShopeePay', 'type' => 'ewallet'],
        'ID_BCA'       => ['label' => 'Bank BCA',     'type' => 'bank'],
        'ID_BRI'       => ['label' => 'Bank BRI',     'type' => 'bank'],
        'ID_BNI'       => ['label' => 'Bank BNI',     'type' => 'bank'],
        'ID_MANDIRI'   => ['label' => 'Bank Mandiri', 'type' => 'bank'],
    ],
];
