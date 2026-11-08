<?php

namespace App\Http\Controllers\Concerns;

use CRUDBooster;
use Illuminate\Support\Facades\DB;

/** Pembatasan peran & kepemilikan data untuk controller CMS fitur baru. */
trait CekPeran
{
    /** Privilege id: 1 Super Admin, 2 Admin, 4 BSU, BSI = cms_privileges.name 'BSI' */
    protected function idBsi()
    {
        static $id = null;
        if ($id === null) {
            $id = (int) DB::table('cms_privileges')->where('name', 'BSI')->value('id');
        }
        return $id;
    }

    protected function peranSaya()
    {
        return (int) CRUDBooster::myPrivilegeId();
    }

    protected function adalahBsu()
    {
        return $this->peranSaya() === 4;
    }

    protected function adalahBsi()
    {
        return $this->idBsi() > 0 && $this->peranSaya() === $this->idBsi();
    }

    protected function adalahPusat()
    {
        return in_array($this->peranSaya(), [1, 2], true);
    }

    /** Hentikan jika peran tidak termasuk. Gunakan 'bsi' sebagai pengganti id BSI. */
    protected function wajibPeran(array $daftar)
    {
        $ok = in_array($this->peranSaya(), array_map(function ($x) {
            return $x === 'bsi' ? $this->idBsi() : (int) $x;
        }, $daftar), true);
        if (!$ok) {
            CRUDBooster::redirect(CRUDBooster::adminPath(), trans('crudbooster.denied_access'));
        }
    }

    /** BSU hanya boleh menyentuh baris miliknya; Super Admin/Admin bebas. */
    protected function wajibMilik($table, $id, $kolom = 'admin_id')
    {
        if ($this->adalahPusat()) {
            return;
        }
        $pemilik = DB::table($table)->where('id', $id)->value($kolom);
        if ((int) $pemilik !== (int) CRUDBooster::myId()) {
            CRUDBooster::redirect(CRUDBooster::adminPath(), trans('crudbooster.denied_access'));
        }
    }

    protected function rupiah($n)
    {
        return 'Rp ' . number_format((int) $n, 0, ',', '.');
    }
}
