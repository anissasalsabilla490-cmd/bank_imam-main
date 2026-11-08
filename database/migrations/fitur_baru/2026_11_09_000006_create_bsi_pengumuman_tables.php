<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/** Pengumuman dari BSI ke satu atau lebih BSU (mis. pemberitahuan harga sampah terbaru) + menu CMS. Idempotent. */
class CreateBsiPengumumanTables extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('bsi_pengumuman')) {
            Schema::create('bsi_pengumuman', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->string('judul', 150);
                $t->text('isi');
                $t->longText('lampiran_harga')->nullable();      // JSON snapshot daftar harga saat dikirim
                $t->unsignedInteger('created_by')->nullable();   // cms_users.id (BSI/Admin)
                $t->timestamps();
            });
        }
        if (!Schema::hasTable('bsi_pengumuman_tujuan')) {
            Schema::create('bsi_pengumuman_tujuan', function (Blueprint $t) {
                $t->bigIncrements('id');
                $t->unsignedBigInteger('pengumuman_id');
                $t->unsignedInteger('bsu_id');                   // cms_users.id (BSU)
                $t->timestamp('dibaca_at')->nullable();
                $t->timestamp('created_at')->useCurrent();
                $t->unique(['pengumuman_id', 'bsu_id'], 'bsi_tujuan_unique');
                $t->index('bsu_id', 'bsi_tujuan_bsu_idx');
                $t->foreign('pengumuman_id')->references('id')->on('bsi_pengumuman')->onDelete('cascade');
            });
        }

        if (!Schema::hasTable('cms_moduls') || !Schema::hasTable('cms_privileges')) {
            return;
        }
        $bsi = (int) DB::table('cms_privileges')->where('name', 'BSI')->value('id');
        $now = now();
        $full = [1, 1, 0, 0];
        $lihat = [0, 1, 0, 0];

        $this->daftar('Pengumuman ke BSU', 'fa fa-bullhorn', 'bsi_pengumuman', 'bsi_pengumuman', 'AdminBsiPengumumanController',
            array_filter([1 => $full, 2 => $full, $bsi => $bsi ? $full : null]), 'Pengumuman ke BSU', array_filter([1, 2, $bsi]), $now);
        $this->daftar('Pengumuman dari BSI', 'fa fa-envelope-o', 'pesan_bsi', 'bsi_pengumuman_tujuan', 'AdminPesanBsiController',
            [4 => $lihat], 'Pengumuman dari BSI', [4], $now);
    }

    private function daftar($nama, $icon, $path, $table, $controller, array $roles, $label, array $privs, $now)
    {
        $moduleId = DB::table('cms_moduls')->where('path', $path)->value('id');
        if (!$moduleId) {
            $moduleId = DB::table('cms_moduls')->insertGetId([
                'name' => $nama, 'icon' => $icon, 'path' => $path, 'table_name' => $table,
                'controller' => $controller, 'is_protected' => 0, 'is_active' => 0, 'created_at' => $now,
            ]);
        }
        foreach ($roles as $privId => $f) {
            if (!DB::table('cms_privileges_roles')->where('id_cms_moduls', $moduleId)->where('id_cms_privileges', $privId)->exists()) {
                DB::table('cms_privileges_roles')->insert([
                    'is_visible' => 1, 'is_create' => $f[0], 'is_read' => $f[1], 'is_edit' => $f[2], 'is_delete' => $f[3],
                    'id_cms_privileges' => $privId, 'id_cms_moduls' => $moduleId, 'created_at' => $now,
                ]);
            }
        }
        $menuPath = $controller . 'GetIndex';
        $menuId = DB::table('cms_menus')->where('path', $menuPath)->value('id');
        if (!$menuId) {
            $menuId = DB::table('cms_menus')->insertGetId([
                'name' => $label, 'type' => 'Route', 'path' => $menuPath, 'color' => 'normal', 'icon' => $icon,
                'parent_id' => 0, 'is_active' => 1, 'is_dashboard' => 0, 'id_cms_privileges' => reset($privs),
                'sorting' => (int) DB::table('cms_menus')->max('sorting') + 1, 'created_at' => $now,
            ]);
        }
        foreach ($privs as $p) {
            if (!DB::table('cms_menus_privileges')->where('id_cms_menus', $menuId)->where('id_cms_privileges', $p)->exists()) {
                DB::table('cms_menus_privileges')->insert(['id_cms_menus' => $menuId, 'id_cms_privileges' => $p]);
            }
        }
    }

    public function down()
    {
        Schema::dropIfExists('bsi_pengumuman_tujuan');
        Schema::dropIfExists('bsi_pengumuman');
    }
}
