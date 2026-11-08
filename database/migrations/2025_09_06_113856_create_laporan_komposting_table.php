<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('laporan_komposting', function (Blueprint $table) {
            $table->bigIncrements('id');
            
            // Relasi ke BSU (pengelola)
            $table->unsignedInteger('admin_id');
            $table->foreign('admin_id')
                  ->references('id')->on('cms_users')
                  ->onDelete('cascade');

            $table->string('periode'); // contoh: "2025-Q1" atau "Jan 2025"
            $table->decimal('sampah_basah_kg', 10, 2)->default(0);
            $table->date('tanggal_panen')->nullable();
            $table->decimal('hasil_kompos_kg', 10, 2)->default(0);

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('laporan_komposting');
    }
};
