<?php

namespace App\Jobs;

use App\Models\Withdrawal;
use App\Services\WithdrawalService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

/**
 * Mengirim payout ke Xendit. Aman diulang: Idempotency-key = reference_id,
 * dan WithdrawalService::send() hanya memproses withdrawal berstatus pending.
 */
class SendPayoutJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $tries = 4;
    public $backoff = [15, 60, 180];

    protected $withdrawalId;

    public function __construct($withdrawalId)
    {
        $this->withdrawalId = (int) $withdrawalId;
    }

    public function handle(WithdrawalService $service)
    {
        $service->send($this->withdrawalId);
    }

    /** Semua percobaan habis: jangan refund (payout mungkin terkirim); serahkan ke manusia. */
    public function failed(\Throwable $e)
    {
        Log::error('SendPayoutJob gagal permanen', ['withdrawal' => $this->withdrawalId, 'error' => $e->getMessage()]);

        $w = Withdrawal::find($this->withdrawalId);
        if ($w && $w->status === Withdrawal::PENDING) {
            app(WithdrawalService::class)->markReview(
                $this->withdrawalId,
                'Gagal menghubungi Xendit setelah beberapa percobaan: ' . mb_substr($e->getMessage(), 0, 120)
            );
        }
    }
}
