@echo off
REM ============================================================
REM  Setup Bank Imam di Laragon (PHP 7.4) - AMAN UNTUK DATA
REM  Jalankan dari Laragon Terminal, di folder proyek:
REM      cd C:\laragon\www\bank_imam-main
REM      setup-laragon.bat
REM  Tidak memakai migrate:fresh / db:seed / crudbooster:install.
REM ============================================================
setlocal EnableDelayedExpansion
set DB=bank_imam
set DBUSER=root

echo [1/8] Cek versi PHP...
php -r "exit((PHP_VERSION_ID>=70400 && PHP_VERSION_ID<70500)?0:1);"
if errorlevel 1 (
  echo GAGAL: PHP aktif bukan 7.4. Di Laragon: klik kanan ^> PHP ^> Version ^> pilih 7.4.x, lalu buka Terminal baru.
  php -v
  exit /b 1
)
php -v | findstr /B "PHP"

echo [2/8] Cek ekstensi PHP yang dibutuhkan...
for %%E in (pdo_mysql mbstring openssl gd zip fileinfo xml curl dom) do (
  php -m | findstr /I /X "%%E" >nul || (echo GAGAL: ekstensi %%E belum aktif di php.ini ^(Laragon: Menu ^> PHP ^> Extensions^) & exit /b 1)
)

echo [3/8] Siapkan .env...
if not exist .env.laragon (echo File .env.laragon tidak ada & exit /b 1)
if exist .env copy /Y .env .env.backup >nul
copy /Y .env.laragon .env >nul

echo [4/8] Cek koneksi MySQL/MariaDB Laragon...
mysql -u %DBUSER% -e "SELECT VERSION();" || (echo GAGAL: MySQL belum jalan. Klik Start All di Laragon. & exit /b 1)

mysql -u %DBUSER% -e "CREATE DATABASE IF NOT EXISTS %DB% CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

set HASUSERS=0
for /f %%N in ('mysql -u %DBUSER% -N -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='%DB%' AND table_name='users'"') do set HASUSERS=%%N

echo [5/8] Database...
if "!HASUSERS!"=="0" (
  echo    Database kosong - mengimpor bank_imam.sql ...
  mysql -u %DBUSER% --default-character-set=utf8mb4 %DB% < bank_imam.sql || (echo GAGAL import & exit /b 1)
) else (
  echo    Database %DB% SUDAH berisi data - TIDAK diimpor ulang. Backup dibuat dulu...
  if not exist backup mkdir backup
  mysqldump -u %DBUSER% %DB% > backup\backup_sebelum_setup.sql
)

echo [6/8] Migrasi (hanya menambah tabel/kolom; data lama tidak disentuh)...
php artisan migrate --path=database/migrations/pembayaran --force || (echo GAGAL migrasi pembayaran & exit /b 1)
mysql -u %DBUSER% %DB% < ledger_saldo_awal.sql
php artisan migrate --path=database/migrations/fitur_baru --force || (echo GAGAL migrasi fitur_baru & exit /b 1)

echo [7/8] Akun BSI (Bank Sampah Induk)...
php artisan bsi:buat-akun

echo [8/8] Bersihkan cache...
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

echo.
echo SELESAI. Buka:  http://bank_imam-main.test   (CMS: /admin/login)
endlocal
