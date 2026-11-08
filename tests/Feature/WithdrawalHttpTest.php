<?php

namespace Tests\Feature;

use App\Models\Reward;
use App\Models\Withdrawal;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class WithdrawalHttpTest extends WithdrawalTestCase
{
    /* ---------------- Webhook ---------------- */

    private function webhook($token, $body)
    {
        $headers = $token === null ? [] : ['x-callback-token' => $token];
        return $this->postJson('/api/webhooks/xendit/payout', $body, $headers);
    }

    private function processingWithdrawal()
    {
        Http::fake(['*/v2/payouts' => Http::response(['id' => 'disb-9', 'status' => 'ACCEPTED'], 200)]);
        $u = $this->makeUser();
        $w = app(\App\Services\WithdrawalService::class)->create($u, $this->payload());
        app(\App\Services\WithdrawalService::class)->send($w->id);
        return [$u, $w->fresh()];
    }

    public function test_webhook_tanpa_atau_salah_token_ditolak()
    {
        [$u, $w] = $this->processingWithdrawal();
        $body = ['event' => 'payout.succeeded', 'data' => ['id' => 'disb-9', 'reference_id' => $w->reference_id, 'status' => 'SUCCEEDED']];

        $this->webhook(null, $body)->assertStatus(401);
        $this->webhook('salah', $body)->assertStatus(401);
        $this->assertSame(Withdrawal::PROCESSING, $w->fresh()->status);
    }

    public function test_webhook_ditolak_jika_token_server_belum_diisi()
    {
        config(['services.xendit.callback_token' => '']);
        $this->webhook('', ['data' => ['id' => 'x']])->assertStatus(503);
    }

    public function test_webhook_valid_memverifikasi_ulang_ke_xendit_lalu_menyelesaikan()
    {
        [$u, $w] = $this->processingWithdrawal();
        Http::fake([
            '*/v2/payouts/disb-9' => Http::response(['id' => 'disb-9', 'reference_id' => $w->reference_id, 'status' => 'SUCCEEDED'], 200),
        ]);

        $this->webhook('test-callback-token', ['data' => ['id' => 'disb-9', 'reference_id' => $w->reference_id, 'status' => 'SUCCEEDED']])
            ->assertOk();

        $this->assertSame(Withdrawal::SUCCESS, $w->fresh()->status);
    }

    public function test_webhook_palsu_tidak_dipercaya_jika_xendit_bilang_lain()
    {
        // Penyerang punya token tetapi isi webhook "SUCCEEDED"; Xendit sebenarnya FAILED -> ikuti Xendit.
        [$u, $w] = $this->processingWithdrawal();
        Http::fake([
            '*/v2/payouts/disb-9' => Http::response(['id' => 'disb-9', 'reference_id' => $w->reference_id, 'status' => 'FAILED'], 200),
        ]);

        $this->webhook('test-callback-token', ['data' => ['id' => 'disb-9', 'status' => 'SUCCEEDED']])->assertOk();

        $this->assertSame(Withdrawal::FAILED, $w->fresh()->status);
        $this->assertSame(100000, $this->balance($u));
    }

    public function test_webhook_balas_503_jika_verifikasi_gagal_agar_diulang_xendit()
    {
        [$u, $w] = $this->processingWithdrawal();
        Http::fake(['*/v2/payouts/disb-9' => Http::response([], 500)]);

        $this->webhook('test-callback-token', ['data' => ['id' => 'disb-9']])->assertStatus(503);
        $this->assertSame(Withdrawal::PROCESSING, $w->fresh()->status);
    }

    public function test_webhook_referensi_tak_dikenal_dibalas_200_tanpa_efek()
    {
        $this->webhook('test-callback-token', ['data' => ['id' => 'disb-asing', 'reference_id' => 'WD-X']])->assertOk();
        $this->assertSame(0, Withdrawal::count());
        $this->assertSame('unknown_reference', DB::table('payment_webhook_logs')->value('result'));
    }

    /* ---------------- Alur nasabah ---------------- */

    public function test_alur_nasabah_konfirmasi_lalu_store_token_sekali_pakai()
    {
        Http::fake(['*/v2/payouts' => Http::response(['id' => 'disb-1', 'status' => 'ACCEPTED'], 200)]);
        $u = $this->makeUser(100000);

        $res = $this->actingAs($u)->post('/tarik-saldo/konfirmasi', $this->payload(['account_number' => '+62 812-3456-7890']));
        $res->assertOk()->assertSee('081234567890'); // dinormalisasi ke format 08...
        $token = session('withdrawal_token');
        $this->assertNotEmpty($token);

        $body = $this->payload(['account_number' => '081234567890', 'submit_token' => $token]);
        $this->actingAs($u)->post('/tarik-saldo', $body)->assertRedirect();
        $this->assertSame(1, Withdrawal::count());
        $this->assertSame(50000, $this->balance($u));

        // klik ganda / replay dengan token yang sama
        $this->actingAs($u)->post('/tarik-saldo', $body)->assertRedirect(route('tarikSaldo.riwayat'));
        $this->assertSame(1, Withdrawal::count());
        $this->assertSame(50000, $this->balance($u));
    }

    public function test_store_tanpa_token_tidak_membuat_penarikan()
    {
        $u = $this->makeUser(100000);
        $this->actingAs($u)->post('/tarik-saldo', $this->payload())->assertRedirect(route('tarikSaldo.riwayat'));
        $this->assertSame(0, Withdrawal::count());
        $this->assertSame(100000, $this->balance($u));
    }

    public function test_validasi_nomor_dan_nama()
    {
        $u = $this->makeUser(100000);
        $this->actingAs($u)->post('/tarik-saldo/konfirmasi', $this->payload(['account_number' => '12345']))
            ->assertSessionHasErrors('account_number');
        $this->actingAs($u)->post('/tarik-saldo/konfirmasi', $this->payload(['account_name' => '<script>x</script>']))
            ->assertSessionHasErrors('account_name');
        $this->actingAs($u)->post('/tarik-saldo/konfirmasi', $this->payload(['amount' => '1.5']))
            ->assertSessionHasErrors('amount');
    }

    public function test_nasabah_tidak_bisa_melihat_penarikan_orang_lain()
    {
        Http::fake(['*/v2/payouts' => Http::response(['id' => 'd', 'status' => 'ACCEPTED'], 200)]);
        $a = $this->makeUser(100000, 'a');
        $b = $this->makeUser(100000, 'b');
        $w = app(\App\Services\WithdrawalService::class)->create($a, $this->payload());

        $this->actingAs($b)->get('/tarik-saldo/' . $w->id)->assertNotFound();
        $this->actingAs($b)->get('/tarik-saldo/' . $w->id . '/status')->assertNotFound();
        $this->actingAs($a)->get('/tarik-saldo/' . $w->id)->assertOk();
    }

    public function test_halaman_form_dan_riwayat_tampil()
    {
        $u = $this->makeUser(100000);
        $this->actingAs($u)->get('/tarik-saldo')->assertOk()->assertSee('Tarik');
        $this->actingAs($u)->get('/tarik-saldo/riwayat')->assertOk();
    }

    public function test_guest_diarahkan_login()
    {
        $this->get('/tarik-saldo')->assertRedirect();
        $this->post('/tarik-saldo', [])->assertRedirect();
    }

    /* ---------------- Perbaikan celah tukar saldo ---------------- */

    public function test_tukar_saldo_nominal_negatif_tidak_lagi_menambah_saldo()
    {
        $u = $this->makeUser(100000);
        $r = $this->makeReward(5);

        $this->actingAs($u)->post('/tukar-saldo/reward/' . $r->id, ['selected_nominal' => -999999]);

        $this->assertSame(100000, $this->balance($u));
        $this->assertSame(5, $r->fresh()->stock);
        $this->assertSame(0, DB::table('tukar_saldo')->count());
    }

    public function test_tukar_saldo_normal_memotong_saldo_dan_stok_serta_mencatat_ledger()
    {
        $u = $this->makeUser(100000);
        $r = $this->makeReward(5);

        $this->actingAs($u)->post('/tukar-saldo/reward/' . $r->id, ['selected_nominal' => 30000]);

        $this->assertSame(70000, $this->balance($u));
        $this->assertSame(4, $r->fresh()->stock);
        $this->assertSame(1, DB::table('saldo_mutasi')->where('source', 'tukar_saldo')->count());
    }

    public function test_tukar_saldo_melebihi_saldo_membatalkan_semuanya()
    {
        $u = $this->makeUser(10000);
        $r = $this->makeReward(5);

        $this->actingAs($u)->post('/tukar-saldo/reward/' . $r->id, ['selected_nominal' => 50000]);

        $this->assertSame(10000, $this->balance($u));
        $this->assertSame(5, $r->fresh()->stock);
        $this->assertSame(0, DB::table('tukar_saldo')->count()); // rollback total
    }
}
