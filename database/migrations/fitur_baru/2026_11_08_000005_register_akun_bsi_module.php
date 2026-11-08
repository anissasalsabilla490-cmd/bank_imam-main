<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/** Menu "Akun BSI" (khusus Super Admin) untuk membuat dan mengelola akun BSI. Idempotent. */
class RegisterAkunBsiModule extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('cms_moduls') || !Schema::hasTable('cms_privileges')) {
            return;
        }
        $now = now();

        $moduleId = DB::table('cms_moduls')->where('path', 'akun_bsi')->value('id');
        if (!$moduleId) {
            $moduleId = DB::table('cms_moduls')->insertGetId([
                'name' => 'Akun BSI', 'icon' => 'fa fa-user-plus', 'path' => 'akun_bsi', 'table_name' => 'cms_users',
                'controller' => 'AdminAkunBsiController', 'is_protected' => 0, 'is_active' => 0, 'created_at' => $now,
            ]);
        }

        if (!DB::table('cms_privileges_roles')->where('id_cms_moduls', $moduleId)->where('id_cms_privileges', 1)->exists()) {
            DB::table('cms_privileges_roles')->insert([
                'is_visible' => 1, 'is_create' => 1, 'is_read' => 1, 'is_edit' => 1, 'is_delete' => 0,
                'id_cms_privileges' => 1, 'id_cms_moduls' => $moduleId, 'created_at' => $now,
            ]);
        }

        $menuId = DB::table('cms_menus')->where('path', 'AdminAkunBsiControllerGetIndex')->value('id');
        if (!$menuId) {
            $menuId = DB::table('cms_menus')->insertGetId([
                'name' => 'Akun BSI', 'type' => 'Route', 'path' => 'AdminAkunBsiControllerGetIndex', 'color' => 'normal',
                'icon' => 'fa fa-user-plus', 'parent_id' => 0, 'is_active' => 1, 'is_dashboard' => 0,
                'id_cms_privileges' => 1, 'sorting' => (int) DB::table('cms_menus')->max('sorting') + 1, 'created_at' => $now,
            ]);
        }
        if (!DB::table('cms_menus_privileges')->where('id_cms_menus', $menuId)->where('id_cms_privileges', 1)->exists()) {
            DB::table('cms_menus_privileges')->insert(['id_cms_menus' => $menuId, 'id_cms_privileges' => 1]);
        }
    }

    public function down()
    {
        // Tidak menghapus modul/menu agar hak akses yang sudah dipakai tidak rusak.
    }
}
