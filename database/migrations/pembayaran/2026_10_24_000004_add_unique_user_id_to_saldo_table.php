<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Satu nasabah = satu baris saldo. Dipasang hanya jika data saat ini bersih
 * (tidak ada user_id ganda); jika ada duplikat, migrasi gagal dengan pesan jelas
 * supaya dibereskan manual dan bukan diam-diam dilewati.
 */
class AddUniqueUserIdToSaldoTable extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('saldo')) {
            return;
        }

        $dups = DB::table('saldo')
            ->select('user_id')
            ->whereNotNull('user_id')
            ->groupBy('user_id')
            ->havingRaw('COUNT(*) > 1')
            ->pluck('user_id')
            ->all();

        if (!empty($dups)) {
            throw new \RuntimeException(
                'Tabel saldo punya user_id ganda: ' . implode(', ', $dups) .
                '. Gabungkan/hapus duplikat dulu, lalu jalankan ulang migrate.'
            );
        }

        Schema::table('saldo', function (Blueprint $table) {
            $table->unique('user_id', 'saldo_user_id_unique');
        });
    }

    public function down()
    {
        if (Schema::hasTable('saldo')) {
            Schema::table('saldo', function (Blueprint $table) {
                $table->dropUnique('saldo_user_id_unique');
            });
        }
    }
}
