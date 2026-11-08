<?php

namespace App\Services;

use App\Exceptions\InsufficientBalanceException;
use App\Exceptions\TransientGatewayException;
use App\Exceptions\WithdrawalException;
use App\Models\Saldo;
use App\Models\User;
use App\Models\Withdrawal;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

/**
 * Alur uang penarikan saldo:
 *
 *   create()  -> potong saldo + catat withdrawal (status pending), dalam SATU transaksi DB
 *   send()    -> kirim payout ke Xendit (dipanggil job, aman diulang berkat idempotency-key)
 *   applyGatewayStatus() -> terapkan hasil dari webhook / reconcile (success | failed + refund)
 *
 * Aturan emas: uang nasabah tidak pernah di-refund bila payout MUNGKIN sudah terkirim.
 * Kondisi tidak pasti dimasukkan ke status "review" untuk diputuskan manusia.
 */
class WithdrawalService
{
    private $saldo;
    private $client;

    public function __construct(SaldoService $saldo, XenditPayoutClient $client)
    {
        $this->saldo = $saldo;
        $this->client = $client;
    }

    /* ------------------------------------------------------------------ */
    /*  1. Pengajuan                                                       */
    /* ------------------------------------------------------------------ */

    /**
     * @param array $data channel_code, account_number, account_name, amount
     * @throws WithdrawalException pesan aman untuk nasabah
     */
    /** Fitur hanya tersedia bila dinyalakan DAN kunci Xendit sudah diisi (saldo tidak boleh terpotong tanpa jalur kirim). */
    public function available()
    {
        return (bool) config('withdrawal.enabled') && $this->client->isConfigured();
    }

    public function create(User $user, array $data, $ip = null)
    {
        if (!$this->available()) {
            throw new WithdrawalException('Penarikan saldo sedang tidak tersedia. Coba lagi nanti.');
        }

        $channel = config('withdrawal.channels.' . ($data['channel_code'] ?? ''));
        if (!$channel) {
            throw new WithdrawalException('Tujuan penarikan tidak didukung.');
        }

        $amount = (int) ($data['amount'] ?? 0);
        $fee = (int) config('withdrawal.fee.' . $channel['type'], 0);
        $min = (int) config('withdrawal.min_amount');
        $max = (int) config('withdrawal.max_amount');

        if ($amount < $min) {
            throw new WithdrawalException('Penarikan minimal Rp ' . number_format($min, 0, ',', '.') . '.');
        }
        if ($amount > $max) {
            throw new WithdrawalException('Penarikan maksimal Rp ' . number_format($max, 0, ',', '.') . ' per transaksi.');
        }
        if ($amount <= $fee) {
            throw new WithdrawalException('Nominal harus lebih besar dari biaya penarikan.');
        }

        return DB::transaction(function () use ($user, $data, $channel, $amount, $fee, $ip) {
            // Kunci baris saldo: semua pengajuan satu nasabah berjalan berurutan.
            $saldo = Saldo::where('user_id', $user->id)->lockForUpdate()->first();
            if (!$saldo || (int) $saldo->total_saldo < $amount) {
                throw new WithdrawalException('Saldo tidak mencukupi.');
            }

            $today = Withdrawal::where('user_id', $user->id)
                ->where('status', '!=', Withdrawal::FAILED)
                ->where('created_at', '>=', now()->startOfDay());

            if ((clone $today)->count() >= (int) config('withdrawal.daily_count_limit')) {
                throw new WithdrawalException('Batas jumlah penarikan hari ini sudah tercapai. Coba lagi besok.');
            }
            if ((int) (clone $today)->sum('amount') + $amount > (int) config('withdrawal.daily_amount_limit')) {
                throw new WithdrawalException('Batas total penarikan harian sudah tercapai. Coba lagi besok.');
            }

            $w = Withdrawal::create([
                'reference_id'   => 'WD-' . date('Ymd') . '-' . strtoupper(Str::random(8)),
                'user_id'        => $user->id,
                'admin_id'       => $user->cms_user_id,
                'amount'         => $amount,
                'fee'            => $fee,
                'net_amount'     => $amount - $fee,
                'channel_code'   => $data['channel_code'],
                'channel_type'   => $channel['type'],
                'account_number' => $data['account_number'],
                'account_name'   => $data['account_name'],
                'status'         => Withdrawal::PENDING,
                'request_ip'     => $ip,
            ]);

            try {
                $this->saldo->debit($user->id, $amount, 'tarik_saldo', 'withdrawal', $w->id, 'Penarikan ' . $w->reference_id);
            } catch (InsufficientBalanceException $e) {
                throw new WithdrawalException('Saldo tidak mencukupi.');
            }

            return $w;
        });
    }

    /* ------------------------------------------------------------------ */
    /*  2. Pengiriman ke Xendit                                            */
    /* ------------------------------------------------------------------ */

    /**
     * @throws TransientGatewayException bila perlu dicoba ulang oleh antrian
     */
    public function send($withdrawalId)
    {
        $lock = Cache::lock('withdrawal-send-' . $withdrawalId, 90);
        if (!$lock->get()) {
            return; // proses lain sedang mengirim
        }

        try {
            $w = Withdrawal::find($withdrawalId);
            if (!$w || $w->status !== Withdrawal::PENDING) {
                return;
            }

            if (!$this->client->isConfigured()) {
                Log::critical('Xendit belum dikonfigurasi (XENDIT_SECRET_KEY kosong); penarikan ditahan.', ['withdrawal' => $w->id]);
                throw new TransientGatewayException('Xendit belum dikonfigurasi.');
            }

            $r = $this->client->create($w);

            switch ($r['outcome']) {
                case 'accepted':
                    $this->recordAccepted($w, $r);
                    break;

                case 'rejected':
                    Log::error('Xendit menolak payout', ['withdrawal' => $w->id, 'result' => $r]);
                    $this->failAndRefund($w->id, $r['error_code'] ?? 'REJECTED', $r['message'] ?? 'Ditolak gateway', $r['body'] ?? []);
                    break;

                case 'duplicate':
                    Log::warning('Xendit: idempotency-key sudah ada, menunggu webhook/tinjau manual', ['withdrawal' => $w->id]);
                    $this->markReview($w->id, 'Xendit melaporkan permintaan duplikat; periksa dashboard Xendit.', $r['body'] ?? []);
                    break;

                default: // retry
                    throw new TransientGatewayException($r['message'] ?? 'Gangguan sementara pada gateway.');
            }
        } finally {
            $lock->release();
        }
    }

    private function recordAccepted(Withdrawal $w, array $r)
    {
        $w->forceFill([
            'gateway_id'       => $r['gateway_id'],
            'gateway_status'   => $r['status'],
            'gateway_response' => json_encode($r['body']),
        ])->save();

        // Status awal bisa saja sudah final (jarang); terapkan lewat jalur yang sama.
        $this->applyGatewayStatus($w->id, $r['status'], $r['body'], 'create');
    }

    /* ------------------------------------------------------------------ */
    /*  3. Hasil dari gateway (webhook / reconcile)                        */
    /* ------------------------------------------------------------------ */

    /**
     * @return string processing | success | failed | review | ignored
     */
    public function applyGatewayStatus($withdrawalId, $gatewayStatus, array $body = [], $via = 'webhook')
    {
        $gatewayStatus = strtoupper((string) $gatewayStatus);

        return DB::transaction(function () use ($withdrawalId, $gatewayStatus, $body, $via) {
            $w = Withdrawal::where('id', $withdrawalId)->lockForUpdate()->first();
            if (!$w) {
                return 'ignored';
            }

            $update = ['gateway_status' => $gatewayStatus];
            if (!empty($body['id']) && !$w->gateway_id) {
                $update['gateway_id'] = $body['id'];
            }
            if (!empty($body)) {
                $update['gateway_response'] = json_encode($body);
            }

            $code = $body['failure_code'] ?? null;

            switch ($gatewayStatus) {
                case 'ACCEPTED':
                case 'REQUESTED':
                case 'LOCKED':
                    if (in_array($w->status, [Withdrawal::PENDING, Withdrawal::REVIEW], true)) {
                        $update['status'] = Withdrawal::PROCESSING;
                        $update['failure_reason'] = null;
                    }
                    $w->forceFill($update)->save();
                    return 'processing';

                case 'SUCCEEDED':
                    if ($w->status === Withdrawal::FAILED) {
                        // Sudah di-refund tetapi Xendit bilang sukses: uang bisa keluar dua kali. Tahan untuk manusia.
                        Log::critical('ANOMALI: payout SUCCEEDED setelah withdrawal di-refund', ['withdrawal' => $w->id]);
                        $update['status'] = Withdrawal::REVIEW;
                        $update['failure_reason'] = 'ANOMALI: Xendit melaporkan SUCCEEDED setelah saldo dikembalikan. Periksa manual.';
                        $w->forceFill($update)->save();
                        return 'review';
                    }
                    if ($w->status !== Withdrawal::SUCCESS) {
                        $update['status'] = Withdrawal::SUCCESS;
                        $update['completed_at'] = now();
                        $update['failure_code'] = null;
                        $update['failure_reason'] = null;
                    }
                    $w->forceFill($update)->save();
                    return 'success';

                case 'FAILED':
                case 'CANCELLED':
                case 'REVERSED':
                    if ($w->status === Withdrawal::SUCCESS && $gatewayStatus !== 'REVERSED') {
                        Log::critical('ANOMALI: payout ' . $gatewayStatus . ' setelah withdrawal sukses', ['withdrawal' => $w->id]);
                        $update['status'] = Withdrawal::REVIEW;
                        $update['failure_reason'] = 'ANOMALI: Xendit melaporkan ' . $gatewayStatus . ' setelah sukses. Periksa manual.';
                        $w->forceFill($update)->save();
                        return 'review';
                    }
                    $w->forceFill($update)->save();
                    $this->refundLocked($w, $code ?: $gatewayStatus, 'Payout ' . $gatewayStatus . ' (' . $via . ')', null);
                    return 'failed';
            }

            Log::warning('Status gateway tidak dikenal', ['withdrawal' => $w->id, 'status' => $gatewayStatus]);
            return 'ignored';
        });
    }

    /* ------------------------------------------------------------------ */
    /*  4. Gagal / tinjau                                                  */
    /* ------------------------------------------------------------------ */

    public function failAndRefund($withdrawalId, $code, $reason, array $body = [], $resolvedBy = null)
    {
        return DB::transaction(function () use ($withdrawalId, $code, $reason, $body, $resolvedBy) {
            $w = Withdrawal::where('id', $withdrawalId)->lockForUpdate()->first();
            if (!$w) {
                return 'ignored';
            }
            if (!empty($body)) {
                $w->gateway_response = json_encode($body);
            }
            $this->refundLocked($w, $code, $reason, $resolvedBy);
            return 'failed';
        });
    }

    /** Wajib dipanggil di dalam transaksi dengan baris $w yang sudah dikunci. */
    private function refundLocked(Withdrawal $w, $code, $reason, $resolvedBy)
    {
        if ($w->status !== Withdrawal::FAILED) {
            $w->forceFill([
                'status'         => Withdrawal::FAILED,
                'failure_code'   => mb_substr((string) $code, 0, 60),
                'failure_reason' => mb_substr((string) $reason, 0, 255),
                'completed_at'   => now(),
                'resolved_by'    => $resolvedBy,
            ])->save();
        }

        // Idempoten: ledger menolak refund kedua untuk withdrawal yang sama.
        $this->saldo->credit(
            $w->user_id, $w->amount, 'refund_tarik_saldo', 'withdrawal', $w->id,
            'Pengembalian ' . $w->reference_id, $resolvedBy
        );
    }

    public function markReview($withdrawalId, $reason, array $body = [])
    {
        DB::transaction(function () use ($withdrawalId, $reason, $body) {
            $w = Withdrawal::where('id', $withdrawalId)->lockForUpdate()->first();
            if (!$w || $w->isFinal()) {
                return;
            }
            $data = ['status' => Withdrawal::REVIEW, 'failure_reason' => mb_substr($reason, 0, 255)];
            if (!empty($body)) {
                $data['gateway_response'] = json_encode($body);
            }
            $w->forceFill($data)->save();
        });
    }

    /* ------------------------------------------------------------------ */
    /*  5. Penyelesaian manual oleh Super Admin                            */
    /* ------------------------------------------------------------------ */

    /**
     * @param string $result 'success' | 'failed'
     * @throws WithdrawalException
     */
    public function resolveManually($withdrawalId, $result, $adminId, $note)
    {
        return DB::transaction(function () use ($withdrawalId, $result, $adminId, $note) {
            $w = Withdrawal::where('id', $withdrawalId)->lockForUpdate()->first();
            if (!$w) {
                throw new WithdrawalException('Data penarikan tidak ditemukan.');
            }
            if (!in_array($w->status, [Withdrawal::REVIEW, Withdrawal::PROCESSING, Withdrawal::PENDING], true)) {
                throw new WithdrawalException('Penarikan ini sudah final dan tidak dapat diubah.');
            }

            if ($result === 'success') {
                $w->forceFill([
                    'status'         => Withdrawal::SUCCESS,
                    'failure_reason' => mb_substr('Diselesaikan manual: ' . $note, 0, 255),
                    'completed_at'   => now(),
                    'resolved_by'    => $adminId,
                ])->save();
                return 'success';
            }

            $this->refundLocked($w, 'MANUAL', 'Diselesaikan manual: ' . $note, $adminId);
            return 'failed';
        });
    }
}
