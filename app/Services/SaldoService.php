<?php

namespace App\Services;

use App\Exceptions\InsufficientBalanceException;
use App\Models\Saldo;
use App\Models\SaldoMutasi;
use Illuminate\Support\Facades\DB;

/**
 * Satu-satunya pintu untuk mengubah saldo nasabah.
 *
 * - Baris saldo dikunci (SELECT ... FOR UPDATE) agar dua proses tidak saling menimpa.
 * - Setiap perubahan dicatat di saldo_mutasi (ledger, append-only).
 * - Jika $refType dan $refId diberikan, pemanggilan bersifat idempotent: kejadian yang
 *   sama (source + ref) tidak akan diterapkan dua kali; hasil yang lama dikembalikan.
 */
class SaldoService
{
    public function credit($userId, $amount, $source, $refType = null, $refId = null, $note = null, $actorId = null)
    {
        return $this->apply('credit', $userId, $amount, $source, $refType, $refId, $note, $actorId, false);
    }

    /** @throws InsufficientBalanceException */
    public function debit($userId, $amount, $source, $refType = null, $refId = null, $note = null, $actorId = null)
    {
        return $this->apply('debit', $userId, $amount, $source, $refType, $refId, $note, $actorId, false);
    }

    /**
     * Debit sebesar-besarnya $amount tanpa pernah membuat saldo negatif
     * (perilaku lama saat transaksi dibatalkan). Mengembalikan null bila saldo sudah 0.
     */
    public function debitUpTo($userId, $amount, $source, $refType = null, $refId = null, $note = null, $actorId = null)
    {
        return $this->apply('debit', $userId, $amount, $source, $refType, $refId, $note, $actorId, true);
    }

    /**
     * Mencatat perubahan saldo yang SUDAH terjadi di luar service (mis. koreksi lewat form CMS)
     * agar ledger tetap lengkap. Tidak mengubah tabel saldo.
     */
    public function logAdjustment($userId, $delta, $balanceAfter, $source, $note = null, $actorId = null)
    {
        $delta = (int) $delta;
        if ($delta === 0) {
            return null;
        }
        return SaldoMutasi::create([
            'user_id'       => (int) $userId,
            'type'          => $delta > 0 ? 'credit' : 'debit',
            'amount'        => abs($delta),
            'balance_after' => (int) $balanceAfter,
            'source'        => $source,
            'ref_type'      => null,
            'ref_id'        => null,
            'note'          => $note === null ? null : mb_substr($note, 0, 255),
            'actor_id'      => $actorId,
            'created_at'    => now(),
        ]);
    }

    private function apply($type, $userId, $amount, $source, $refType, $refId, $note, $actorId, $clamp)
    {
        $userId = (int) $userId;
        $amount = (int) round($amount);

        if ($userId <= 0) {
            throw new \InvalidArgumentException('User tidak valid.');
        }
        if ($amount <= 0) {
            if ($clamp) {
                return null;
            }
            throw new \InvalidArgumentException('Nominal harus lebih dari 0.');
        }

        return DB::transaction(function () use ($type, $userId, $amount, $source, $refType, $refId, $note, $actorId, $clamp) {
            $saldo = Saldo::where('user_id', $userId)->lockForUpdate()->first();

            if (!$saldo) {
                if ($type === 'debit') {
                    if ($clamp) {
                        return null;
                    }
                    throw new InsufficientBalanceException(0, $amount);
                }
                $saldo = Saldo::create(['user_id' => $userId, 'total_saldo' => 0]);
            }

            if ($refType !== null && $refId !== null) {
                $existing = SaldoMutasi::where('source', $source)
                    ->where('ref_type', $refType)
                    ->where('ref_id', (string) $refId)
                    ->first();
                if ($existing) {
                    return $existing;
                }
            }

            $current = (int) $saldo->total_saldo;

            if ($type === 'debit') {
                if ($current < $amount) {
                    if (!$clamp) {
                        throw new InsufficientBalanceException($current, $amount);
                    }
                    $amount = $current;
                    if ($amount <= 0) {
                        return null;
                    }
                }
                $new = $current - $amount;
            } else {
                $new = $current + $amount;
            }

            $saldo->total_saldo = $new;
            $saldo->save();

            return SaldoMutasi::create([
                'user_id'       => $userId,
                'type'          => $type,
                'amount'        => $amount,
                'balance_after' => $new,
                'source'        => $source,
                'ref_type'      => $refType,
                'ref_id'        => $refId === null ? null : (string) $refId,
                'note'          => $note === null ? null : mb_substr($note, 0, 255),
                'actor_id'      => $actorId,
                'created_at'    => now(),
            ]);
        });
    }
}
