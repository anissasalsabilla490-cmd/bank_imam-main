<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\DB;

/**
 * CrudBooster tidak memeriksa kolom cms_users.status saat login. Middleware ini memblokir akun CMS
 * yang berstatus "Inactive" (BSU, BSI, dll.): sesi dihentikan dan pengguna diarahkan ke halaman login.
 * Hanya nilai "Inactive" yang diblokir, sehingga akun lama dengan status lain tidak ikut terkunci.
 */
class BlokirAkunCmsNonaktif
{
    public function handle($request, Closure $next)
    {
        $id = $request->session()->get('admin_id');
        if ($id) {
            $status = DB::table('cms_users')->where('id', $id)->value('status');
            if ($status !== null && strcasecmp(trim((string) $status), 'Inactive') === 0) {
                $request->session()->flush();
                return redirect(url(config('crudbooster.ADMIN_PATH', 'admin') . '/login'))
                    ->with(['message' => 'Akun Anda dinonaktifkan. Silakan hubungi administrator.', 'message_type' => 'danger']);
            }
        }
        return $next($request);
    }
}
