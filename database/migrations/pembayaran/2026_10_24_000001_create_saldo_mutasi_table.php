<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * Buku besar (ledger) saldo nasabah. Setiap perubahan saldo HARUS tercatat di sini.
 * Baris bersifat append-only: jangan di-update atau dihapus.
 *
 * Unique (source, ref_type, ref_id) adalah pengaman tingkat database agar satu
 * kejadian (mis. refund untuk satu penarikan) tidak pernah tercatat dua kali.
 */
class CreateSaldoMutasiTable extends Migration
{
    public function up()
    {
        Schema::create('saldo_mutasi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('type', 10);              // credit | debit
            $table->unsignedBigInteger('amount');
            $table->bigInteger('balance_after');
            $table->string('source', 40);            // setor_sampah, tarik_saldo, refund_tarik_saldo, ...
            $table->string('ref_type', 40)->nullable();
            $table->string('ref_id', 64)->nullable();
            $table->string('note', 255)->nullable();
            $table->unsignedInteger('actor_id')->nullable(); // cms_users.id jika dilakukan admin
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['source', 'ref_type', 'ref_id'], 'saldo_mutasi_source_ref_unique');
            $table->index(['user_id', 'id'], 'saldo_mutasi_user_idx');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('restrict');
        });
    }

    public function down()
    {
        Schema::dropIfExists('saldo_mutasi');
    }
}
