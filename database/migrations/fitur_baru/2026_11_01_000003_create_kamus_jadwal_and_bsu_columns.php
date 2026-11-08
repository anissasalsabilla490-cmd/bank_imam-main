<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/** Kamus istilah, jadwal pengumpulan, dan data wilayah BSU (kecamatan/kelurahan/RW). */
class CreateKamusJadwalAndBsuColumns extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('kamus_istilah')) {
            Schema::create('kamus_istilah', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->string('istilah', 80);
                $t->text('penjelasan');
                $t->unsignedBigInteger('bsi_harga_id')->nullable(); // opsional: terkait jenis sampah tertentu
                $t->timestamps();
                $t->index('istilah', 'kamus_istilah_idx');
            });

            $now = now();
            DB::table('kamus_istilah')->insert([
                [
                    'istilah' => 'Bodong A',
                    'penjelasan' => 'Botol plastik bening tanpa label dan tanpa tutup. Dihargai lebih tinggi karena bersih dan satu jenis plastik.',
                    'bsi_harga_id' => null, 'created_at' => $now, 'updated_at' => $now,
                ],
                [
                    'istilah' => 'Bodong B',
                    'penjelasan' => 'Botol plastik berwarna tanpa label dan tanpa tutup.',
                    'bsi_harga_id' => null, 'created_at' => $now, 'updated_at' => $now,
                ],
            ]);
        }

        if (!Schema::hasTable('jadwal_pengumpulan')) {
            Schema::create('jadwal_pengumpulan', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedInteger('admin_id');                 // BSU pemilik jadwal
                $t->string('judul', 120);
                $t->date('tanggal');
                $t->time('jam_mulai')->nullable();
                $t->time('jam_selesai')->nullable();
                $t->string('lokasi', 160)->nullable();
                $t->text('keterangan')->nullable();
                $t->timestamps();
                $t->index(['admin_id', 'tanggal'], 'jadwal_admin_tgl_idx');
            });
        }

        if (Schema::hasTable('cms_users')) {
            Schema::table('cms_users', function (Blueprint $t) {
                if (!Schema::hasColumn('cms_users', 'kecamatan')) { $t->string('kecamatan', 80)->nullable(); }
                if (!Schema::hasColumn('cms_users', 'kelurahan')) { $t->string('kelurahan', 80)->nullable(); }
                if (!Schema::hasColumn('cms_users', 'rw'))        { $t->string('rw', 10)->nullable(); }
                if (!Schema::hasColumn('cms_users', 'alamat'))    { $t->string('alamat', 255)->nullable(); }
                if (!Schema::hasColumn('cms_users', 'tingkat'))   { $t->string('tingkat', 12)->nullable(); } // kelurahan | rw
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('jadwal_pengumpulan');
        Schema::dropIfExists('kamus_istilah');
        if (Schema::hasTable('cms_users')) {
            Schema::table('cms_users', function (Blueprint $t) {
                foreach (['tingkat', 'alamat', 'rw', 'kelurahan', 'kecamatan'] as $c) {
                    if (Schema::hasColumn('cms_users', $c)) { $t->dropColumn($c); }
                }
            });
        }
    }
}
