<?php

namespace App\Services;

use App\Models\Withdrawal;
use Illuminate\Http\Client\ConnectionException;
use Illuminate\Support\Facades\Http;

/**
 * Klien tipis untuk Xendit Payouts v2 (POST/GET https://api.xendit.co/v2/payouts).
 * Tidak memakai SDK agar kompatibel dengan PHP 7.4.
 *
 * Hasil create() dinormalisasi menjadi salah satu 'outcome':
 *   accepted  - Xendit membuat payout (status ada di 'status')
 *   rejected  - Xendit menolak dengan pasti, TIDAK ada payout dibuat (aman di-refund)
 *   duplicate - idempotency-key sudah pernah dipakai: payout mungkin sudah ada (JANGAN refund)
 *   retry     - gangguan sementara (timeout / 5xx / 429): coba lagi dengan key yang sama
 */
class XenditPayoutClient
{
    public function isConfigured()
    {
        return (string) config('services.xendit.secret_key') !== '';
    }

    public function create(Withdrawal $w)
    {
        $payload = [
            'reference_id'       => $w->reference_id,
            'channel_code'       => $w->channel_code,
            'channel_properties' => [
                'account_holder_name' => $w->account_name,
                'account_number'      => $w->account_number,
            ],
            'amount'      => (int) $w->net_amount,
            'currency'    => 'IDR',
            'description' => 'Penarikan saldo Bank Imam ' . $w->reference_id,
            'metadata'    => ['withdrawal_id' => $w->id],
        ];

        try {
            $res = $this->http()
                ->withHeaders(['Idempotency-key' => $w->reference_id])
                ->post('/v2/payouts', $payload);
        } catch (ConnectionException $e) {
            return ['outcome' => 'retry', 'message' => 'Koneksi ke Xendit gagal: ' . $e->getMessage()];
        }

        $body = $this->json($res);
        $code = (string) ($body['error_code'] ?? '');

        if ($res->successful()) {
            return [
                'outcome'    => 'accepted',
                'gateway_id' => $body['id'] ?? null,
                'status'     => strtoupper((string) ($body['status'] ?? 'ACCEPTED')),
                'body'       => $body,
            ];
        }

        if ($code !== '' && stripos($code, 'DUPLICATE') !== false) {
            return ['outcome' => 'duplicate', 'error_code' => $code, 'message' => $body['message'] ?? '', 'body' => $body];
        }

        $s = $res->status();
        if ($s === 429 || $s >= 500) {
            return ['outcome' => 'retry', 'error_code' => $code, 'message' => 'HTTP ' . $s, 'body' => $body];
        }

        // 4xx lain: permintaan ditolak, tidak ada payout yang dibuat.
        return [
            'outcome'    => 'rejected',
            'error_code' => $code !== '' ? $code : 'HTTP_' . $s,
            'message'    => (string) ($body['message'] ?? ('HTTP ' . $s)),
            'body'       => $body,
        ];
    }

    /**
     * Ambil status terbaru payout dari Xendit (sumber kebenaran).
     * @return array ['ok'=>bool, 'status'=>?string, 'body'=>array, 'failure_code'=>?string, 'not_found'=>bool]
     */
    public function find($gatewayId)
    {
        try {
            $res = $this->http()->get('/v2/payouts/' . rawurlencode($gatewayId));
        } catch (ConnectionException $e) {
            return ['ok' => false, 'status' => null, 'body' => [], 'failure_code' => null, 'not_found' => false];
        }

        $body = $this->json($res);

        if ($res->status() === 404) {
            return ['ok' => false, 'status' => null, 'body' => $body, 'failure_code' => null, 'not_found' => true];
        }
        if (!$res->successful()) {
            return ['ok' => false, 'status' => null, 'body' => $body, 'failure_code' => null, 'not_found' => false];
        }

        return [
            'ok'           => true,
            'status'       => strtoupper((string) ($body['status'] ?? '')),
            'body'         => $body,
            'failure_code' => $body['failure_code'] ?? null,
            'not_found'    => false,
        ];
    }

    private function http()
    {
        return Http::baseUrl(rtrim((string) config('services.xendit.base_url'), '/'))
            ->withBasicAuth((string) config('services.xendit.secret_key'), '')
            ->acceptJson()
            ->asJson()
            ->withOptions(['connect_timeout' => 10])
            ->timeout(25);
    }

    private function json($res)
    {
        $data = json_decode($res->body(), true);
        return is_array($data) ? $data : [];
    }
}
