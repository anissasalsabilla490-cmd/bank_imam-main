<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentWebhookLogsTable extends Migration
{
    public function up()
    {
        Schema::create('payment_webhook_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('provider', 20)->default('xendit');
            $table->string('event', 60)->nullable();
            $table->string('reference_id', 40)->nullable();
            $table->string('gateway_id', 80)->nullable();
            $table->boolean('token_valid')->default(false);
            $table->string('result', 40)->nullable();       // processed | ignored | unknown_reference | error
            $table->longText('payload')->nullable();
            $table->string('ip', 45)->nullable();
            $table->timestamps();

            $table->index('reference_id', 'pwl_reference_idx');
            $table->index('gateway_id', 'pwl_gateway_idx');
        });
    }

    public function down()
    {
        Schema::dropIfExists('payment_webhook_logs');
    }
}
