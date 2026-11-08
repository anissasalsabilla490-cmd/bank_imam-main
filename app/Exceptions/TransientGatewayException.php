<?php

namespace App\Exceptions;

/** Gangguan sementara saat menghubungi gateway; aman dicoba ulang (idempotency-key sama). */
class TransientGatewayException extends \RuntimeException
{
}
