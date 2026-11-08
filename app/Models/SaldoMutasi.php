<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SaldoMutasi extends Model
{
    protected $table = 'saldo_mutasi';
    protected $guarded = [];
    public $timestamps = false;

    protected $casts = [
        'amount'        => 'integer',
        'balance_after' => 'integer',
        'created_at'    => 'datetime',
    ];
}
