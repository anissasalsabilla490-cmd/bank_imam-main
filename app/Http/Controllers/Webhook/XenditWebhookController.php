<?php

namespace App\Http\Controllers\Webhook;

use App\Http\Controllers\Controller;
use App\Models\PaymentWebhookLog;
use App\Models\Withdrawal;
use App\Services\WithdrawalService;
use App\Services\XenditPayoutClient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class XenditWebhookController extends Controller
{
    /**
     * Callback Payouts v2. Keamanan berlapis:
     *  1. Header x-callback-token harus cocok (hash_equals); token kosong = tolak semua (fail closed).
     *  2. Isi webhook TIDAK dipercaya: status diambil ulang dari Xendit (GET /v2/payouts/{id}).
     *  3. Gagal mengambil ulang -> balas 503 agar Xendit mengirim ulang.
     */
    public function payout(Request $request, WithdrawalService $service, XenditPayoutClient $client)
    {
        $payload = $request->all();
        $data = isset($payload['data']) && is_array($payload['data']) ? $payload['data'] : $payload;

        $gatewayId = isset($data['id']) ? (string) $data['id'] : null;
        $reference = isset($data['reference_id']) ? (string) $data['reference_id'] : null;

        $expected = (string) config('services.xendit.callback_token');
        $valid = $expected !== '' && hash_equals($expected, (string) $request->header('x-callback-token'));

        $log = PaymentWebhookLog::create([
            'provider'     => 'xendit',
            'event'        => isset($payload['event']) ? mb_substr((string) $payload['event'], 0, 60) : null,
            'reference_id' => $reference ? mb_substr($reference, 0, 40) : null,
            'gateway_id'   => $gatewayId ? mb_substr($gatewayId, 0, 80) : null,
            'token_valid'  => $valid,
            'payload'      => mb_substr(json_encode($payload), 0, 60000),
            'ip'           => $request->ip(),
        ]);

        if ($expected === '') {
            Log::critical('XENDIT_CALLBACK_TOKEN belum diisi; webhook ditolak.');
            $log->update(['result' => 'not_configured']);
            return response()->json(['message' => 'Webhook belum dikonfigurasi'], 503);
        }
        if (!$valid) {
            $log->update(['result' => 'invalid_token']);
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $w = null;
        if ($gatewayId) {
            $w = Withdrawal::where('gateway_id', $gatewayId)->first();
        }
        if (!$w && $reference) {
            $w = Withdrawal::where('reference_id', $reference)->first();
        }
        if (!$w) {
            // 200 agar Xendit tidak mengulang terus untuk payout yang bukan milik sistem ini.
            $log->update(['result' => 'unknown_reference']);
            return response()->json(['message' => 'ignored']);
        }

        $lookupId = $w->gateway_id ?: $gatewayId;
        if (!$lookupId) {
            $log->update(['result' => 'no_gateway_id']);
            return response()->json(['message' => 'ignored']);
        }

        $r = $client->find($lookupId);
        if (!$r['ok'] || !$r['status']) {
            $log->update(['result' => 'fetch_failed']);
            return response()->json(['message' => 'Tidak dapat memverifikasi status, coba lagi'], 503);
        }

        $fetchedRef = $r['body']['reference_id'] ?? null;
        if ($fetchedRef !== null && $fetchedRef !== $w->reference_id) {
            Log::error('Webhook: reference_id tidak cocok', ['withdrawal' => $w->id, 'fetched' => $fetchedRef]);
            $log->update(['result' => 'reference_mismatch']);
            return response()->json(['message' => 'ignored']);
        }

        $result = $service->applyGatewayStatus($w->id, $r['status'], $r['body'], 'webhook');
        $log->update(['result' => 'processed:' . $result]);

        return response()->json(['message' => 'ok']);
    }
}
