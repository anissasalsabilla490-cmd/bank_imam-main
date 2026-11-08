<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Mendaftarkan role "BSI" (Bank Sampah Induk), modul CMS, hak akses dan menu fitur baru.
 * Idempotent: tidak membuat entri ganda jika dijalankan ulang.
 *
 * Privilege id: 1 Super Admin, 2 Admin, 4 BSU, BSI = dibuat/dicari berdasarkan nama.
 * Akun BSI dibuat lewat:  php artisan bsi:buat-akun
 */
class RegisterFiturBaruCmsModules extends Migration
{
    private function modules($bsi)
    {
        // [name, icon, path, table, controller, roles(privId => [create, read, edit, delete]), menu]
        $full = [1, 1, 1, 1];
        $lihat = [0, 1, 0, 0];
        return [
            ['Harga Acuan BSI', 'fa fa-line-chart', 'bsi_harga', 'bsi_harga', 'AdminBsiHargaController',
                [1 => $full, 2 => $full, $bsi => [1, 1, 1, 0]],
                ['label' => 'Harga Acuan BSI', 'parent' => null, 'privs' => [1, 2, $bsi]]],
            ['Harga & Margin BSU', 'fa fa-tags', 'harga_bsu', 'sampah', 'AdminHargaBsuController',
                [4 => [0, 1, 1, 0]],
                ['label' => 'Harga & Margin', 'parent' => null, 'privs' => [4]]],
            ['Setoran Massal', 'fa fa-table', 'setoran_massal', 'transactions', 'AdminSetoranMassalController',
                [4 => [1, 1, 0, 0]],
                ['label' => 'Setoran Massal', 'parent' => null, 'privs' => [4]]],
            ['Buku Kas Umum', 'fa fa-book', 'kas_umum', 'kas_umum', 'AdminKasController',
                [4 => $full, 1 => $lihat, 2 => $lihat],
                ['label' => 'Catatan Kas', 'parent' => 'Buku Kas', 'privs' => [4]]],
            ['Laporan Kas', 'fa fa-file-text-o', 'kas_umum', 'kas_umum', 'AdminKasController',
                [],
                ['label' => 'Laporan Kas', 'parent' => 'Buku Kas', 'privs' => [4], 'route' => 'AdminKasControllerGetLaporan']],
            ['Kategori Kas', 'fa fa-folder-open-o', 'kas_kategori', 'kas_kategori', 'AdminKasKategoriController',
                [4 => $full],
                ['label' => 'Kategori Kas', 'parent' => 'Buku Kas', 'privs' => [4]]],
            ['Kamus Jenis Sampah', 'fa fa-book', 'kamus', 'bsi_harga', 'AdminKamusController',
                [1 => $lihat, 2 => $lihat, 4 => $lihat, $bsi => $lihat],
                ['label' => 'Kamus Jenis Sampah', 'parent' => null, 'privs' => [1, 2, 4, $bsi]]],
            ['Istilah Kamus', 'fa fa-language', 'kamus_istilah', 'kamus_istilah', 'AdminKamusIstilahController',
                [1 => $full, 2 => $full, $bsi => $full],
                ['label' => 'Istilah Kamus', 'parent' => null, 'privs' => [1, 2, $bsi]]],
            ['Manajemen BSU', 'fa fa-building-o', 'bsu_unit', 'cms_users', 'AdminBsuUnitController',
                [1 => $full, 2 => $full, $bsi => $lihat],
                ['label' => 'Manajemen BSU', 'parent' => null, 'privs' => [1, 2, $bsi]]],
            ['Jadwal Pengumpulan', 'fa fa-calendar', 'jadwal_pengumpulan', 'jadwal_pengumpulan', 'AdminJadwalController',
                [4 => $full],
                ['label' => 'Jadwal Pengumpulan', 'parent' => null, 'privs' => [4]]],
            ['Ringkasan', 'fa fa-dashboard', 'ringkasan_bsu', 'cms_users', 'AdminRingkasanController',
                [4 => $lihat, $bsi => $lihat, 1 => $lihat, 2 => $lihat],
                ['label' => 'Ringkasan', 'parent' => null, 'privs' => [4, $bsi, 1, 2]]],
        ];
    }

    public function up()
    {
        if (!Schema::hasTable('cms_privileges') || !Schema::hasTable('cms_moduls')) {
            return; // mis. unit test dengan database kosong
        }
        $now = now();

        $bsi = DB::table('cms_privileges')->where('name', 'BSI')->value('id');
        if (!$bsi) {
            $bsi = DB::table('cms_privileges')->insertGetId([
                'name' => 'BSI', 'is_superadmin' => 0, 'theme_color' => 'skin-blue', 'created_at' => $now,
            ]);
        }

        $parents = [];
        foreach ($this->modules($bsi) as $m) {
            [$name, $icon, $path, $table, $controller, $roles, $menu] = $m;

            // --- modul (satu baris per path; entri kedua dengan path sama hanya untuk menu) ---
            $moduleId = DB::table('cms_moduls')->where('path', $path)->value('id');
            if (!$moduleId) {
                $moduleId = DB::table('cms_moduls')->insertGetId([
                    'name' => $name, 'icon' => $icon, 'path' => $path, 'table_name' => $table,
                    'controller' => $controller, 'is_protected' => 0, 'is_active' => 0, 'created_at' => $now,
                ]);
            }

            foreach ($roles as $privId => $f) {
                $exists = DB::table('cms_privileges_roles')
                    ->where('id_cms_moduls', $moduleId)->where('id_cms_privileges', $privId)->exists();
                if (!$exists) {
                    DB::table('cms_privileges_roles')->insert([
                        'is_visible' => 1, 'is_create' => $f[0], 'is_read' => $f[1],
                        'is_edit' => $f[2], 'is_delete' => $f[3],
                        'id_cms_privileges' => $privId, 'id_cms_moduls' => $moduleId, 'created_at' => $now,
                    ]);
                }
            }

            // --- menu ---
            $parentId = 0;
            if ($menu['parent']) {
                if (!isset($parents[$menu['parent']])) {
                    $pid = DB::table('cms_menus')->where('name', $menu['parent'])->where('type', 'URL')->value('id');
                    if (!$pid) {
                        $pid = DB::table('cms_menus')->insertGetId([
                            'name' => $menu['parent'], 'type' => 'URL', 'path' => '#', 'color' => 'normal',
                            'icon' => 'fa fa-book', 'parent_id' => 0, 'is_active' => 1, 'is_dashboard' => 0,
                            'id_cms_privileges' => $menu['privs'][0],
                            'sorting' => (int) DB::table('cms_menus')->max('sorting') + 1, 'created_at' => $now,
                        ]);
                        foreach ($menu['privs'] as $p) {
                            DB::table('cms_menus_privileges')->insert(['id_cms_menus' => $pid, 'id_cms_privileges' => $p]);
                        }
                    }
                    $parents[$menu['parent']] = $pid;
                }
                $parentId = $parents[$menu['parent']];
            }

            $menuPath = isset($menu['route']) ? $menu['route'] : $controller . 'GetIndex';
            $menuId = DB::table('cms_menus')->where('path', $menuPath)->value('id');
            if (!$menuId) {
                $menuId = DB::table('cms_menus')->insertGetId([
                    'name' => $menu['label'], 'type' => 'Route', 'path' => $menuPath, 'color' => 'normal',
                    'icon' => $icon, 'parent_id' => $parentId, 'is_active' => 1, 'is_dashboard' => 0,
                    'id_cms_privileges' => $menu['privs'][0],
                    'sorting' => (int) DB::table('cms_menus')->max('sorting') + 1, 'created_at' => $now,
                ]);
            }
            foreach ($menu['privs'] as $p) {
                $has = DB::table('cms_menus_privileges')
                    ->where('id_cms_menus', $menuId)->where('id_cms_privileges', $p)->exists();
                if (!$has) {
                    DB::table('cms_menus_privileges')->insert(['id_cms_menus' => $menuId, 'id_cms_privileges' => $p]);
                }
            }
        }
        $this->daftarkanDashboardBsi($bsi, $now);
    }

    /**
     * CrudBooster mewajibkan setiap role punya menu dashboard (jika tidak, sidebar error).
     * Role BSI diberi statistik sederhana "dashboard-bsi".
     */
    private function daftarkanDashboardBsi($bsi, $now)
    {
        if (!Schema::hasTable('cms_statistics') || !Schema::hasTable('cms_statistic_components')) {
            return;
        }
        $statId = DB::table('cms_statistics')->where('slug', 'dashboard-bsi')->value('id');
        if (!$statId) {
            $statId = DB::table('cms_statistics')->insertGetId([
                'name' => 'Dashboard BSI', 'slug' => 'dashboard-bsi', 'created_at' => $now,
            ]);
            $kotak = [
                ['area1', 'Jenis Sampah Aktif', 'ion-trash-b', 'bg-green', '/admin/bsi_harga', 'SELECT COUNT(*) AS jumlah FROM bsi_harga WHERE is_active = 1'],
                ['area2', 'BSU Terdaftar', 'ion-home', 'bg-aqua', '/admin/bsu_unit', 'SELECT COUNT(*) AS jumlah FROM cms_users WHERE id_cms_privileges = 4'],
                ['area3', 'BSU Memakai Harga BSI', 'ion-link', 'bg-yellow', '/admin/ringkasan_bsu', 'SELECT COUNT(DISTINCT admin_id) AS jumlah FROM sampah WHERE bsi_harga_id IS NOT NULL'],
                ['area4', 'Perubahan Harga 30 Hari', 'ion-arrow-graph-up-right', 'bg-red', '/admin/bsi_harga/riwayat', 'SELECT COUNT(*) AS jumlah FROM bsi_harga_riwayat WHERE harga_lama IS NOT NULL AND tanggal >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)'],
            ];
            foreach ($kotak as $i => $k) {
                DB::table('cms_statistic_components')->insert([
                    'id_cms_statistics' => $statId, 'componentID' => md5('dashboard-bsi-' . $k[0]),
                    'component_name' => 'smallbox', 'area_name' => $k[0], 'sorting' => $i,
                    'name' => $k[1],
                    'config' => json_encode(['name' => $k[1], 'icon' => $k[2], 'color' => $k[3], 'link' => $k[4], 'sql' => $k[5]]),
                    'created_at' => $now,
                ]);
            }
        }
        $menuId = DB::table('cms_menus')->where('path', 'statistic_builder/show/dashboard-bsi')->value('id');
        if (!$menuId) {
            $menuId = DB::table('cms_menus')->insertGetId([
                'name' => 'Dashboard BSI', 'type' => 'Statistic', 'path' => 'statistic_builder/show/dashboard-bsi',
                'color' => 'normal', 'icon' => 'fa fa-dashboard', 'parent_id' => 0, 'is_active' => 1, 'is_dashboard' => 1,
                'id_cms_privileges' => $bsi, 'sorting' => 1, 'created_at' => $now,
            ]);
        }
        if (!DB::table('cms_menus_privileges')->where('id_cms_menus', $menuId)->where('id_cms_privileges', $bsi)->exists()) {
            DB::table('cms_menus_privileges')->insert(['id_cms_menus' => $menuId, 'id_cms_privileges' => $bsi]);
        }
    }

    public function down()
    {
        // Sengaja tidak menghapus modul/menu/role agar tidak merusak data hak akses yang sudah dipakai.
    }
}
