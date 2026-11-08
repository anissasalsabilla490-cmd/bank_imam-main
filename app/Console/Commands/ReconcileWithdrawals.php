<?php

namespace App\Console\Commands;

use App\Jobs\SendPayoutJob;
use App\Models\Withdrawal;
use App\Services\WithdrawalService;
use App\Services\XenditPayoutClient;
use Illuminate\Console\Command;

/**
 * Jaring pengaman jika webhook terlambat/hilang:
 *  - pending lama (job tidak jalan)       -> kirim ulang (aman: idempotency-key)
 *  - processing/review lama dengan gateway_id -> tanya status ke Xendit lalu terapkan
 */
class ReconcileWithdrawals extends Command
{
    protected $signature = 'withdrawals:reconcile';
    protected $description = 'Sinkronkan penarikan yang menggantung dengan status di Xendit';

    public function handle(WithdrawalService $service, XenditPayoutClient $client)
    {
        $resent = 0;
        $checked = 0;

        $stalePending = now()->subMinutes((int) config('withdrawal.stale_pending_minutes'));
        Withdrawal::where('status', Withdrawal::PENDING)
            ->whereNull('gateway_id')
            ->where('updated_at', '<=', $stalePending)
            ->orderBy('id')->limit(50)->get()
            ->each(function ($w) use (&$resent) {
                SendPayoutJob::dispatch($w->id);
                $resent++;
            });

        $staleProcessing = now()->subMinutes((int) config('withdrawal.stale_processing_minutes'));
        Withdrawal::whereIn('status', [Withdrawal::PROCESSING, Withdrawal::REVIEW])
            ->whereNotNull('gateway_id')
            ->where('updated_at', '<=', $staleProcessing)
            ->orderBy('id')->limit(50)->get()
            ->each(function ($w) use ($service, $client, &$checked) {
                $r = $client->find($w->gateway_id);
                if (!$r['ok'] || !$r['status']) {
                    return;
                }
                $service->applyGatewayStatus($w->id, $r['status'], $r['body'], 'reconcile');
                $checked++;
            });

        $this->info("Dikirim ulang: {$resent}, disinkronkan: {$checked}");
        return 0;
    }
}
