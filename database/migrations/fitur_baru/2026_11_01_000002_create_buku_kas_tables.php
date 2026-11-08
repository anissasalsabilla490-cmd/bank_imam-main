<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/** Buku Kas Umum BSU: kategori + catatan pemasukan/pengeluaran (bukti berupa file). */
class CreateBukuKasTables extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('kas_kategori')) {
            Schema::create('kas_kategori', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedInteger('admin_id')->nullable();     // NULL = kategori bawaan untuk semua BSU
                $t->string('nama', 80);
                $t->string('tipe', 8);                           // masuk | keluar
                $t->boolean('is_active')->default(true);
                $t->timestamps();
                $t->index(['admin_id', 'tipe'], 'kas_kategori_admin_idx');
            });

            $now = now();
            $bawaan = [
                ['masuk',  'Penjualan sampah ke BSI'],
                ['masuk',  'Donasi / hibah'],
                ['masuk',  'Pemasukan lain-lain'],
                ['keluar', 'Belanja operasional'],
                ['keluar', 'Alat & perlengkapan'],
                ['keluar', 'Transportasi'],
                ['keluar', 'Honor / insentif pengurus'],
                ['keluar', 'Konsumsi kegiatan'],
                ['keluar', 'Pengeluaran lain-lain'],
            ];
            foreach ($bawaan as $b) {
                DB::table('kas_kategori')->insert([
                    'admin_id' => null, 'tipe' => $b[0], 'nama' => $b[1],
                    'is_active' => 1, 'created_at' => $now, 'updated_at' => $now,
                ]);
            }
        }

        if (!Schema::hasTable('kas_umum')) {
            Schema::create('kas_umum', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedInteger('admin_id');                 // BSU pemilik buku kas
                $t->date('tanggal');
                $t->string('tipe', 8);                           // masuk | keluar
                $t->unsignedBigInteger('kategori_id')->nullable();
                $t->string('uraian', 255);
                $t->unsignedBigInteger('jumlah');                // Rupiah bulat, selalu positif
                $t->string('bukti', 255)->nullable();            // path foto nota/struk
                $t->string('ref_type', 30)->nullable();          // mis. transactions_bsi (impor otomatis)
                $t->string('ref_id', 40)->nullable();
                $t->unsignedInteger('created_by')->nullable();
                $t->timestamps();
                $t->softDeletes();
                $t->index(['admin_id', 'tanggal'], 'kas_umum_admin_tgl_idx');
                $t->unique(['admin_id', 'ref_type', 'ref_id'], 'kas_umum_ref_unique');
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('kas_umum');
        Schema::dropIfExists('kas_kategori');
    }
}
