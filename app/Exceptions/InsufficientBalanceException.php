<?php

namespace App\Exceptions;

class InsufficientBalanceException extends \RuntimeException
{
    public $balance;
    public $needed;

    public function __construct($balance, $needed)
    {
        $this->balance = (int) $balance;
        $this->needed = (int) $needed;
        parent::__construct('Saldo tidak mencukupi.');
    }
}
