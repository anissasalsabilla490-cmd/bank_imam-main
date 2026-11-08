<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Mendaftarkan modul CMS "Penarikan Saldo" (Super Admin: penuh, BSU: lihat saja).
 * Aman dijalankan ulang: tidak membuat entri ganda. Dilewati jika tabel CMS tidak ada
 * (mis. saat unit test dengan database kosong).
 */
class RegisterWithdrawalsCmsModule extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('cms_moduls') || !Schema::hasTable('cms_menus')) {
            return;
        }

        $now = now();

        $moduleId = DB::table('cms_moduls')->where('path', 'withdrawals')->value('id');
        if (!$moduleId) {
            $moduleId = DB::table('cms_moduls')->insertGetId([
                'name'         => 'Penarikan Saldo',
                'icon'         => 'fa fa-money',
                'path'         => 'withdrawals',
                'table_name'   => 'withdrawals',
                'controller'   => 'AdminWithdrawalsController',
                'is_protected' => 0,
                'is_active'    => 0,
                'created_at'   => $now,
            ]);
        }

        // 1 = Super Administrator, 4 = BSU
        $roles = [
            1 => ['is_visible' => 1, 'is_create' => 0, 'is_read' => 1, 'is_edit' => 1, 'is_delete' => 0],
            4 => ['is_visible' => 1, 'is_create' => 0, 'is_read' => 1, 'is_edit' => 0, 'is_delete' => 0],
        ];
        foreach ($roles as $privId => $flags) {
            $exists = DB::table('cms_privileges_roles')
                ->where('id_cms_moduls', $moduleId)->where('id_cms_privileges', $privId)->exists();
            if (!$exists) {
                DB::table('cms_privileges_roles')->insert(array_merge($flags, [
                    'id_cms_privileges' => $privId,
                    'id_cms_moduls'     => $moduleId,
                    'created_at'        => $now,
                ]));
            }
        }

        $menuId = DB::table('cms_menus')->where('path', 'AdminWithdrawalsControllerGetIndex')->value('id');
        if (!$menuId) {
            $menuId = DB::table('cms_menus')->insertGetId([
                'name'              => 'Penarikan Saldo',
                'type'              => 'Route',
                'path'              => 'AdminWithdrawalsControllerGetIndex',
                'color'             => 'normal',
                'icon'              => 'fa fa-money',
                'parent_id'         => 0,
                'is_active'         => 1,
                'is_dashboard'      => 0,
                'id_cms_privileges' => 1,
                'sorting'           => (int) DB::table('cms_menus')->max('sorting') + 1,
                'created_at'        => $now,
            ]);
        }
        foreach ([1, 4] as $privId) {
            $exists = DB::table('cms_menus_privileges')
                ->where('id_cms_menus', $menuId)->where('id_cms_privileges', $privId)->exists();
            if (!$exists) {
                DB::table('cms_menus_privileges')->insert([
                    'id_cms_menus' => $menuId, 'id_cms_privileges' => $privId,
                ]);
            }
        }
    }

    public function down()
    {
        if (!Schema::hasTable('cms_moduls')) {
            return;
        }
        $moduleId = DB::table('cms_moduls')->where('path', 'withdrawals')->value('id');
        $menuId = DB::table('cms_menus')->where('path', 'AdminWithdrawalsControllerGetIndex')->value('id');
        if ($menuId) {
            DB::table('cms_menus_privileges')->where('id_cms_menus', $menuId)->delete();
            DB::table('cms_menus')->where('id', $menuId)->delete();
        }
        if ($moduleId) {
            DB::table('cms_privileges_roles')->where('id_cms_moduls', $moduleId)->delete();
            DB::table('cms_moduls')->where('id', $moduleId)->delete();
        }
    }
}
