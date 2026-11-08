<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/** Menu Kalkulator Setoran (BSU) dan Pengaturan Tampilan (semua peran CMS). Idempotent. */
class RegisterKalkulatorTampilanModules extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('cms_moduls') || !Schema::hasTable('cms_privileges')) {
            return;
        }
        $bsi = (int) DB::table('cms_privileges')->where('name', 'BSI')->value('id');
        $now = now();
        $lihat = [0, 1, 0, 0];

        $this->daftar('Kalkulator Setoran', 'fa fa-calculator', 'kalkulator', 'sampah', 'AdminKalkulatorController', [4 => $lihat], [4], $now);
        $this->daftar('Pengaturan Tampilan', 'fa fa-universal-access', 'pengaturan_tampilan', 'cms_users', 'AdminPengaturanTampilanController',
            array_filter([1 => $lihat, 2 => $lihat, 4 => $lihat, $bsi => $bsi ? $lihat : null]), array_values(array_filter([1, 2, 4, $bsi])), $now);
    }

    private function daftar($nama, $icon, $path, $table, $controller, array $roles, array $privs, $now)
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
                'name' => $nama, 'type' => 'Route', 'path' => $menuPath, 'color' => 'normal', 'icon' => $icon,
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
        // Tidak menghapus modul/menu agar hak akses yang sudah dipakai tidak rusak.
    }
}
