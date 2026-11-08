<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Kode (AdminTransactionsController) memakai kolom snapshot price_per_kg & poin_per_kg
 * di tabel transactions, tetapi dump database belum memilikinya.
 * Migrasi ini menambahkan kolom dan mengisi data lama dari riwayat transaksi itu sendiri
 * (total_income / total_weight), cadangan: harga master sampah. Aman dijalankan ulang.
 */
class AddPriceSnapshotToTransactionsTable extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('transactions')) {
            return;
        }

        Schema::table('transactions', function (Blueprint $table) {
            if (!Schema::hasColumn('transactions', 'price_per_kg')) {
                $table->integer('price_per_kg')->default(0)->after('total_weight');
            }
            if (!Schema::hasColumn('transactions', 'poin_per_kg')) {
                $table->integer('poin_per_kg')->default(0)->after('price_per_kg');
            }
        });

        // Isi data lama: harga/poin per kg yang berlaku saat transaksi (dihitung dari nilainya)
        DB::statement(
            'UPDATE transactions SET
                price_per_kg = ROUND(total_income / total_weight),
                poin_per_kg  = ROUND(point_received / total_weight)
             WHERE total_weight > 0 AND price_per_kg = 0 AND poin_per_kg = 0'
        );

        // Cadangan bila berat 0: pakai harga master sampah
        DB::statement(
            'UPDATE transactions t JOIN sampah s ON s.id = t.sampah_id
             SET t.price_per_kg = s.price_per_kg, t.poin_per_kg = s.poin_per_kg
             WHERE t.price_per_kg = 0 AND t.poin_per_kg = 0'
        );
    }

    public function down()
    {
        Schema::table('transactions', function (Blueprint $table) {
            if (Schema::hasColumn('transactions', 'poin_per_kg')) {
                $table->dropColumn('poin_per_kg');
            }
            if (Schema::hasColumn('transactions', 'price_per_kg')) {
                $table->dropColumn('price_per_kg');
            }
        });
    }
}
