<?php

namespace Tests\Feature;

use App\Exceptions\InsufficientBalanceException;
use App\Exceptions\TransientGatewayException;
use App\Exceptions\WithdrawalException;
use App\Models\SaldoMutasi;
use App\Models\Withdrawal;
use App\Services\SaldoService;
use App\Services\WithdrawalService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class WithdrawalServiceTest extends WithdrawalTestCase
{
    private function svc()
    {
        return app(WithdrawalService::class);
    }

    private function fakeXendit($status = 200, $body = null)
    {
        Http::fake([
            '*/v2/payouts' => Http::response($body ?? ['id' => 'disb-123', 'status' => 'ACCEPTED'], $status),
        ]);
    }

    /* ---------------- SaldoService ---------------- */

    public function test_debit_menolak_saldo_kurang_dan_nominal_nol_atau_negatif()
    {
        $u = $this->makeUser(1000);
        $s = app(SaldoService::class);

        try { $s->debit($u->id, 5000, 'x'); $this->fail('harus gagal'); }
        catch (InsufficientBalanceException $e) { $this->assertSame(1000, $e->balance); }

        $this->expectException(\InvalidArgumentException::class);
        $s->debit($u->id, -500, 'x');
    }

    public function test_ledger_idempoten_untuk_ref_yang_sama()
    {
        $u = $this->makeUser(0);
        $s = app(SaldoService::class);
        $s->credit($u->id, 7000, 'setor_sampah', 'transaction', 9);
        $s->credit($u->id, 7000, 'setor_sampah', 'transaction', 9);

        $this->assertSame(7000, $this->balance($u));
        $this->assertSame(1, SaldoMutasi::count());
    }

    public function test_debitUpTo_tidak_pernah_membuat_saldo_negatif()
    {
        $u = $this->makeUser(3000);
        $m = app(SaldoService::class)->debitUpTo($u->id, 10000, 'batal', 'transaction', 1);
        $this->assertSame(0, $this->balance($u));
        $this->assertSame(3000, $m->amount);
    }

    /* ---------------- Pengajuan ---------------- */

    public function test_create_memotong_saldo_dan_mencatat_ledger()
    {
        $u = $this->makeUser(100000);
        $w = $this->svc()->create($u, $this->payload(), '1.2.3.4');

        $this->assertSame(Withdrawal::PENDING, $w->status);
        $this->assertSame(50000, $this->balance($u));
        $this->assertSame(12, (int) $w->admin_id);
        $m = SaldoMutasi::where('source', 'tarik_saldo')->first();
        $this->assertSame('debit', $m->type);
        $this->assertSame(50000, $m->balance_after);
    }

    /** @dataProvider aturanDitolak */
    public function test_create_menolak_pelanggaran_aturan($override, $pesan)
    {
        $u = $this->makeUser(100000);
        try {
            $this->svc()->create($u, $this->payload($override));
            $this->fail('seharusnya ditolak');
        } catch (WithdrawalException $e) {
            $this->assertStringContainsString($pesan, $e->getMessage());
        }
        $this->assertSame(100000, $this->balance($u));
        $this->assertSame(0, Withdrawal::count());
    }

    public function aturanDitolak()
    {
        return [
            'di bawah minimum'  => [['amount' => 5000], 'minimal'],
            'negatif'           => [['amount' => -50000], 'minimal'],
            'di atas maksimum'  => [['amount' => 600000], 'maksimal'],
            'saldo kurang'      => [['amount' => 150000], 'Saldo tidak mencukupi'],
            'channel asing'     => [['channel_code' => 'ID_HACK'], 'tidak didukung'],
        ];
    }

    public function test_batas_jumlah_harian()
    {
        $u = $this->makeUser(1000000);
        for ($i = 0; $i < 3; $i++) {
            $this->svc()->create($u, $this->payload(['amount' => 10000]));
        }
        $this->expectException(WithdrawalException::class);
        $this->svc()->create($u, $this->payload(['amount' => 10000]));
    }

    public function test_batas_total_harian()
    {
        $u = $this->makeUser(5000000);
        $this->svc()->create($u, $this->payload(['amount' => 500000]));
        $this->svc()->create($u, $this->payload(['amount' => 500000]));
        $this->expectException(WithdrawalException::class);
        $this->svc()->create($u, $this->payload(['amount' => 10000])); // total 1.010.000 > 1.000.000
    }

    public function test_fitur_bisa_dimatikan()
    {
        config(['withdrawal.enabled' => false]);
        $u = $this->makeUser(100000);
        $this->expectException(WithdrawalException::class);
        $this->svc()->create($u, $this->payload());
    }

    public function test_tanpa_kunci_xendit_saldo_tidak_terpotong()
    {
        config(['services.xendit.secret_key' => '']);
        $u = $this->makeUser(100000);
        try {
            $this->svc()->create($u, $this->payload());
            $this->fail('seharusnya ditolak');
        } catch (WithdrawalException $e) {
            $this->assertStringContainsString('tidak tersedia', $e->getMessage());
        }
        $this->assertSame(100000, $this->balance($u));
        $this->assertSame(0, Withdrawal::count());
    }

    /* ---------------- Pengiriman ---------------- */

    public function test_send_sukses_diterima_menjadi_processing_dengan_idempotency_key()
    {
        $this->fakeXendit();
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());

        $this->svc()->send($w->id);

        $w->refresh();
        $this->assertSame(Withdrawal::PROCESSING, $w->status);
        $this->assertSame('disb-123', $w->gateway_id);
        Http::assertSent(function ($req) use ($w) {
            return $req->hasHeader('Idempotency-key', $w->reference_id)
                && $req['channel_code'] === 'ID_DANA'
                && $req['amount'] === 50000
                && $req['channel_properties']['account_number'] === '081234567890';
        });
    }

    public function test_send_dua_kali_hanya_memanggil_xendit_sekali()
    {
        $this->fakeXendit();
        $w = $this->svc()->create($this->makeUser(), $this->payload());
        $this->svc()->send($w->id);
        $this->svc()->send($w->id); // status sudah processing -> diabaikan
        Http::assertSentCount(1);
    }

    public function test_ditolak_gateway_mengembalikan_saldo_tepat_sekali()
    {
        $this->fakeXendit(400, ['error_code' => 'INVALID_DESTINATION', 'message' => 'bad']);
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());

        $this->svc()->send($w->id);

        $this->assertSame(Withdrawal::FAILED, $w->fresh()->status);
        $this->assertSame(100000, $this->balance($u));
        $this->assertSame(1, SaldoMutasi::where('source', 'refund_tarik_saldo')->count());
    }

    public function test_duplikat_idempotency_masuk_review_tanpa_refund()
    {
        $this->fakeXendit(400, ['error_code' => 'DUPLICATE_ERROR', 'message' => 'exists']);
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());

        $this->svc()->send($w->id);

        $this->assertSame(Withdrawal::REVIEW, $w->fresh()->status);
        $this->assertSame(50000, $this->balance($u)); // JANGAN refund: payout mungkin sudah keluar
    }

    public function test_gangguan_5xx_dilempar_untuk_retry_dan_status_tetap_pending()
    {
        $this->fakeXendit(503, ['message' => 'down']);
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());

        try { $this->svc()->send($w->id); $this->fail('harus melempar'); }
        catch (TransientGatewayException $e) {}

        $this->assertSame(Withdrawal::PENDING, $w->fresh()->status);
        $this->assertSame(50000, $this->balance($u));
    }

    /* ---------------- Hasil gateway ---------------- */

    private function processing()
    {
        $this->fakeXendit();
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());
        $this->svc()->send($w->id);
        return [$u, $w->fresh()];
    }

    public function test_succeeded_menyelesaikan_tanpa_mengubah_saldo()
    {
        [$u, $w] = $this->processing();
        $this->assertSame('success', $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', ['id' => 'disb-123']));
        $this->assertSame(Withdrawal::SUCCESS, $w->fresh()->status);
        $this->assertNotNull($w->fresh()->completed_at);
        $this->assertSame(50000, $this->balance($u));
    }

    public function test_failed_berulang_hanya_refund_sekali()
    {
        [$u, $w] = $this->processing();
        $this->svc()->applyGatewayStatus($w->id, 'FAILED', ['id' => 'disb-123', 'failure_code' => 'INSUFFICIENT_BALANCE']);
        $this->svc()->applyGatewayStatus($w->id, 'FAILED', ['id' => 'disb-123']);
        $this->svc()->applyGatewayStatus($w->id, 'CANCELLED', []);

        $this->assertSame(100000, $this->balance($u));
        $this->assertSame(1, SaldoMutasi::where('source', 'refund_tarik_saldo')->count());
        $this->assertSame('INSUFFICIENT_BALANCE', $w->fresh()->failure_code);
    }

    public function test_reversed_setelah_sukses_mengembalikan_saldo()
    {
        [$u, $w] = $this->processing();
        $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', []);
        $this->svc()->applyGatewayStatus($w->id, 'REVERSED', []);

        $this->assertSame(Withdrawal::FAILED, $w->fresh()->status);
        $this->assertSame(100000, $this->balance($u));
    }

    public function test_succeeded_setelah_refund_ditahan_sebagai_review_tanpa_ubah_saldo()
    {
        [$u, $w] = $this->processing();
        $this->svc()->applyGatewayStatus($w->id, 'FAILED', []);
        $this->assertSame('review', $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', []));

        $this->assertSame(Withdrawal::REVIEW, $w->fresh()->status);
        $this->assertSame(100000, $this->balance($u)); // tidak ada perubahan lagi
        $this->assertStringContainsString('ANOMALI', $w->fresh()->failure_reason);
    }

    public function test_failed_setelah_sukses_ditahan_sebagai_review()
    {
        [$u, $w] = $this->processing();
        $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', []);
        $this->assertSame('review', $this->svc()->applyGatewayStatus($w->id, 'FAILED', []));
        $this->assertSame(50000, $this->balance($u));
    }

    public function test_status_lama_tidak_menurunkan_status_final()
    {
        [$u, $w] = $this->processing();
        $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', []);
        $this->svc()->applyGatewayStatus($w->id, 'ACCEPTED', []); // webhook telat
        $this->assertSame(Withdrawal::SUCCESS, $w->fresh()->status);
    }

    public function test_review_dipulihkan_oleh_webhook()
    {
        $this->fakeXendit(400, ['error_code' => 'DUPLICATE_ERROR']);
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());
        $this->svc()->send($w->id);
        $this->assertSame(Withdrawal::REVIEW, $w->fresh()->status);

        $this->svc()->applyGatewayStatus($w->id, 'SUCCEEDED', ['id' => 'disb-777']);
        $this->assertSame(Withdrawal::SUCCESS, $w->fresh()->status);
        $this->assertSame('disb-777', $w->fresh()->gateway_id);
    }

    /* ---------------- Manual ---------------- */

    public function test_resolve_manual_gagal_refund_dan_tidak_bisa_diulang()
    {
        $this->fakeXendit(400, ['error_code' => 'DUPLICATE_ERROR']);
        $u = $this->makeUser();
        $w = $this->svc()->create($u, $this->payload());
        $this->svc()->send($w->id);

        $this->svc()->resolveManually($w->id, 'failed', 1, 'dicek dashboard: tidak terkirim');
        $this->assertSame(100000, $this->balance($u));

        $this->expectException(WithdrawalException::class); // sudah final
        $this->svc()->resolveManually($w->id, 'failed', 1, 'klik ganda');
    }
}
