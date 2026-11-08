<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWithdrawalsTable extends Migration
{
    public function up()
    {
        Schema::create('withdrawals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('reference_id', 40)->unique();   // juga dipakai sebagai Idempotency-key
            $table->unsignedBigInteger('user_id');
            $table->unsignedInteger('admin_id')->nullable(); // cms_users.id (BSU nasabah)

            $table->unsignedBigInteger('amount');            // dipotong dari saldo nasabah
            $table->unsignedBigInteger('fee')->default(0);
            $table->unsignedBigInteger('net_amount');        // dikirim ke tujuan

            $table->string('channel_code', 30);
            $table->string('channel_type', 10);              // ewallet | bank
            $table->string('account_number', 40);
            $table->string('account_name', 100);

            // pending | processing | success | failed | review
            $table->string('status', 15)->default('pending');
            $table->string('gateway_id', 80)->nullable();
            $table->string('gateway_status', 30)->nullable();
            $table->string('failure_code', 60)->nullable();
            $table->string('failure_reason', 255)->nullable();
            $table->text('gateway_response')->nullable();

            $table->string('request_ip', 45)->nullable();
            $table->unsignedInteger('resolved_by')->nullable(); // cms_users.id jika diselesaikan manual
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();

            $table->index(['user_id', 'created_at'], 'withdrawals_user_idx');
            $table->index(['status', 'updated_at'], 'withdrawals_status_idx');
            $table->index('gateway_id', 'withdrawals_gateway_idx');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('restrict');
        });
    }

    public function down()
    {
        Schema::dropIfExists('withdrawals');
    }
}
