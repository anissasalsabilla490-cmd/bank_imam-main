<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentWebhookLog extends Model
{
    protected $table = 'payment_webhook_logs';
    protected $guarded = [];

    protected $casts = ['token_valid' => 'boolean'];
}
