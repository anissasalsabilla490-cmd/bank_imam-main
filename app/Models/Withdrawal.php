<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model
{
    const PENDING = 'pending';       // saldo sudah dipotong, payout belum dikirim
    const PROCESSING = 'processing'; // diterima Xendit, menunggu hasil
    const SUCCESS = 'success';
    const FAILED = 'failed';         // gagal, saldo sudah dikembalikan
    const REVIEW = 'review';         // hasil tidak pasti, butuh pengecekan manual

    protected $table = 'withdrawals';
    protected $guarded = [];

    protected $casts = [
        'amount'       => 'integer',
        'fee'          => 'integer',
        'net_amount'   => 'integer',
        'completed_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function isFinal()
    {
        return in_array($this->status, [self::SUCCESS, self::FAILED], true);
    }

    public function channelLabel()
    {
        $c = config('withdrawal.channels.' . $this->channel_code);
        return $c ? $c['label'] : $this->channel_code;
    }

    /** Nomor tujuan disamarkan: 0812****7890 */
    public function maskedAccount()
    {
        $n = (string) $this->account_number;
        $len = strlen($n);
        if ($len <= 6) {
            return str_repeat('*', $len);
        }
        return substr($n, 0, 4) . str_repeat('*', $len - 8) . substr($n, -4);
    }

    /** Teks status untuk nasabah (tidak membocorkan detail internal). */
    public function statusLabel()
    {
        switch ($this->status) {
            case self::PENDING:    return 'Menunggu diproses';
            case self::PROCESSING: return 'Sedang diproses';
            case self::SUCCESS:    return 'Berhasil';
            case self::FAILED:     return 'Gagal, saldo dikembalikan';
            case self::REVIEW:     return 'Sedang diverifikasi';
        }
        return ucfirst((string) $this->status);
    }
}
