<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class BuatAkunBsi extends Command
{
    protected $signature = 'bsi:buat-akun
                            {--nama=BSI - Bank Sampah Induk : Nama akun}
                            {--email=bsi@bankimam.local : Email untuk login CMS}
                            {--reset : Buat ulang password akun yang sudah ada}';

    protected $description = 'Membuat akun BSI (Bank Sampah Induk) untuk login CMS. Password acak ditampilkan SEKALI.';

    public function handle()
    {
        $privId = DB::table('cms_privileges')->where('name', 'BSI')->value('id');
        if (!$privId) {
            $this->error('Role BSI belum ada. Jalankan dulu: php artisan migrate --path=database/migrations/fitur_baru --force');
            return 1;
        }

        $email = strtolower(trim($this->option('email')));
        $akun = DB::table('cms_users')->where('email', $email)->first();

        if ($akun && !$this->option('reset')) {
            $this->warn("Akun $email sudah ada (id {$akun->id}). Pakai --reset untuk membuat password baru.");
            return 0;
        }
        if ($akun && (int) $akun->id_cms_privileges !== (int) $privId) {
            $this->error("Email $email dipakai akun lain yang bukan BSI. Pilih email berbeda.");
            return 1;
        }

        $password = Str::random(14);
        $hash = Hash::make($password);

        if ($akun) {
            DB::table('cms_users')->where('id', $akun->id)->update(['password' => $hash, 'updated_at' => now()]);
        } else {
            DB::table('cms_users')->insert([
                'name' => $this->option('nama'), 'email' => $email, 'password' => $hash,
                'id_cms_privileges' => $privId, 'status' => 'Active', 'no_whatsapp' => '0',
                'created_at' => now(), 'updated_at' => now(),
            ]);
        }

        $this->info('Akun BSI siap.');
        $this->table(['Email', 'Password (catat sekarang, tidak ditampilkan lagi)'], [[$email, $password]]);
        $this->line('Login di: ' . url(config('crudbooster.ADMIN_PATH', 'admin') . '/login') . '  — segera ganti password setelah login.');
        return 0;
    }
}
