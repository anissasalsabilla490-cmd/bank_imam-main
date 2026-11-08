<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * Manajemen Harga Sampah (acuan BSI + margin per BSU + riwayat).
 * Aman dijalankan pada database yang sudah berisi data: hanya MENAMBAH tabel/kolom.
 *
 * Rumus harga beli nasabah per BSU:  sampah.price_per_kg = harga_BSI - margin_BSU
 *   margin_type = nominal -> margin_value dalam Rupiah per kg
 *   margin_type = persen  -> margin_value dalam % dari harga BSI
 */
class CreateManajemenHargaTables extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('bsi_harga')) {
            Schema::create('bsi_harga', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->string('nama', 120);
                $t->string('kategori', 80)->nullable();
                $t->text('deskripsi')->nullable();
                $t->string('image', 255)->nullable();
                $t->string('satuan', 10)->default('kg');
                $t->unsignedInteger('harga')->default(0);        // harga acuan BSI per satuan
                $t->unsignedInteger('poin_per_kg')->default(0);  // poin bawaan untuk BSU yang mengaktifkan
                $t->boolean('is_active')->default(true);
                $t->unsignedInteger('updated_by')->nullable();   // cms_users.id
                $t->timestamps();
                $t->index('nama', 'bsi_harga_nama_idx');
            });
        }

        if (!Schema::hasTable('bsi_harga_riwayat')) {
            Schema::create('bsi_harga_riwayat', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedBigInteger('bsi_harga_id');
                $t->unsignedInteger('harga_lama')->nullable();
                $t->unsignedInteger('harga_baru');
                $t->date('tanggal');
                $t->unsignedInteger('changed_by')->nullable();
                $t->timestamp('created_at')->useCurrent();
                $t->index(['bsi_harga_id', 'tanggal'], 'bsi_riwayat_idx');
                $t->foreign('bsi_harga_id')->references('id')->on('bsi_harga')->onDelete('cascade');
            });
        }

        if (Schema::hasTable('sampah')) {
            Schema::table('sampah', function (Blueprint $t) {
                if (!Schema::hasColumn('sampah', 'bsi_harga_id')) {
                    $t->unsignedBigInteger('bsi_harga_id')->nullable();
                    $t->index('bsi_harga_id', 'sampah_bsi_harga_idx');
                }
                if (!Schema::hasColumn('sampah', 'margin_type')) {
                    $t->string('margin_type', 10)->default('nominal');
                }
                if (!Schema::hasColumn('sampah', 'margin_value')) {
                    $t->decimal('margin_value', 10, 2)->default(0);
                }
                if (!Schema::hasColumn('sampah', 'auto_sync')) {
                    $t->boolean('auto_sync')->default(true);
                }
            });
        }

        if (!Schema::hasTable('sampah_harga_riwayat')) {
            Schema::create('sampah_harga_riwayat', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedBigInteger('sampah_id');
                $t->unsignedInteger('admin_id');                 // BSU pemilik harga
                $t->unsignedBigInteger('bsi_harga_id')->nullable();
                $t->unsignedInteger('harga_lama')->nullable();
                $t->unsignedInteger('harga_baru');
                $t->string('sumber', 12);                        // awal | bsi | margin | manual
                $t->date('tanggal');
                $t->unsignedInteger('changed_by')->nullable();
                $t->string('catatan', 255)->nullable();
                $t->timestamp('created_at')->useCurrent();
                $t->index(['admin_id', 'tanggal'], 'sampah_riwayat_admin_idx');
                $t->index(['sampah_id', 'tanggal'], 'sampah_riwayat_sampah_idx');
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('sampah_harga_riwayat');
        if (Schema::hasTable('sampah')) {
            Schema::table('sampah', function (Blueprint $t) {
                foreach (['auto_sync', 'margin_value', 'margin_type'] as $c) {
                    if (Schema::hasColumn('sampah', $c)) { $t->dropColumn($c); }
                }
                if (Schema::hasColumn('sampah', 'bsi_harga_id')) {
                    $t->dropIndex('sampah_bsi_harga_idx');
                    $t->dropColumn('bsi_harga_id');
                }
            });
        }
        Schema::dropIfExists('bsi_harga_riwayat');
        Schema::dropIfExists('bsi_harga');
    }
}
