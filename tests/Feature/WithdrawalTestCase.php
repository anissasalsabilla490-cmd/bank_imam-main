<?php

namespace Tests\Feature;

use App\Models\Saldo;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Tests\TestCase;

/**
 * Skema minimal agar pengujian tidak bergantung pada dump MySQL produksi:
 * tabel lama dibuat manual, tabel fitur penarikan memakai migrasi aslinya.
 */
abstract class WithdrawalTestCase extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();

        Schema::create('users', function ($t) {
            $t->bigIncrements('id');
            $t->string('username');
            $t->string('email')->unique();
            $t->string('password');
            $t->unsignedInteger('cms_user_id')->nullable();
            $t->rememberToken();
            $t->timestamps();
        });
        Schema::create('saldo', function ($t) {
            $t->bigIncrements('id');
            $t->unsignedBigInteger('user_id')->nullable();
            $t->integer('total_saldo')->default(0);
            $t->timestamps();
        });
        Schema::create('rewards', function ($t) {
            $t->bigIncrements('id');
            $t->unsignedInteger('admin_id')->nullable();
            $t->string('name');
            $t->string('category')->default('uang');
            $t->integer('price')->default(0);
            $t->integer('stock')->default(0);
            $t->timestamps();
        });
        Schema::create('tukar_saldo', function ($t) {
            $t->bigIncrements('id');
            $t->unsignedBigInteger('user_id')->nullable();
            $t->unsignedInteger('admin_id')->nullable();
            $t->unsignedBigInteger('reward_id')->nullable();
            $t->integer('quantity');
            $t->integer('total_price');
            $t->text('bukti_foto')->nullable();
            $t->string('status');
            $t->timestamps();
        });

        $dir = base_path('database/migrations/pembayaran/');
        foreach ([
            '2026_10_24_000001_create_saldo_mutasi_table.php'            => 'CreateSaldoMutasiTable',
            '2026_10_24_000002_create_withdrawals_table.php'             => 'CreateWithdrawalsTable',
            '2026_10_24_000003_create_payment_webhook_logs_table.php'    => 'CreatePaymentWebhookLogsTable',
            '2026_10_24_000004_add_unique_user_id_to_saldo_table.php'    => 'AddUniqueUserIdToSaldoTable',
        ] as $file => $class) {
            require_once $dir . $file;
            (new $class)->up();
        }

        config([
            'services.xendit.secret_key'     => 'xnd_development_test',
            'services.xendit.callback_token' => 'test-callback-token',
            'withdrawal.enabled'             => true,
        ]);
    }

    protected function makeUser($saldo = 100000, $name = 'budi')
    {
        $u = User::create([
            'username' => $name, 'email' => $name . '@example.test',
            'password' => bcrypt('secret'), 'cms_user_id' => 12,
        ]);
        if ($saldo !== null) {
            Saldo::create(['user_id' => $u->id, 'total_saldo' => $saldo]);
        }
        return $u;
    }

    protected function makeReward($stock = 5)
    {
        $id = DB::table('rewards')->insertGetId([
            'admin_id' => 12, 'name' => 'Tunai', 'category' => 'uang', 'stock' => $stock,
            'created_at' => now(), 'updated_at' => now(),
        ]);
        return \App\Models\Reward::find($id);
    }

    protected function balance($user)
    {
        return (int) DB::table('saldo')->where('user_id', $user->id)->value('total_saldo');
    }

    protected function payload($overrides = [])
    {
        return array_merge([
            'channel_code'   => 'ID_DANA',
            'account_number' => '081234567890',
            'account_name'   => 'Budi Santoso',
            'amount'         => 50000,
        ], $overrides);
    }
}
