![Laravel](https://img.shields.io/badge/Built%20with-Laravel-red)
<h1>BANK IMAM</h1>

## Table of Contents
+ [About](#about)
+ [Features](#features)
+ [Installation](#installation)
+ [Preview](#preview)

## Requirements
- PHP 7.4
- Laravel 8
- [CrudBooster 5.6 (Deprecated)](https://github.com/crocodic-studio/crudbooster/tree/v5.6)
- MySql 5

## Features <a name = "features"></a>
**Fitur Umum**
  - Homepage
  - Register
 
**Admin**
 - Login dan Logout
 - Kelola Nasabah (User)
 - Kelola Kategori Sampah
 - Kelola Sampah
 - Kelola Rewards
 - Kelola Transaksi Nasabah
 - Kelola Poin Nasabah
 - Kelola Transaksi Tukar Poin Yang Dilakukan Oleh Nasabah
 
**Nasabah**
 - Login, dan Logout
 - Kelola Profil
 - Lihat Sampah
 - Lihat Reward
 - Lihat Riwayat Transaksi
 - Tukar Poin dengan Reward

## Installation <a name = "installation"></a>
Berikut adalah langkah-langkah untuk menginstall aplikasi ini:

 1. Pastikan bahwa anda sudah menginstall Laravel Versi 8 di perangkat anda
 2. Clone repository ini lalu masuk ke folder project we-cycle 
 3. Buka terminal atau command line anda, lalu masukkan perintah
```
    composer install
    npm install
```
 4. Setelah menginstall dependensi yang dibutuhkan, copy file .env.example ke file .env pada root folder project
 5. Buka file .env lalu sesuaikan konfigurasi database anda sebagai berikut
```
    DB_DATABASE=**we-cycle**
    // sesuaikan sendiri username dan password database anda
```
 6. Masukkan perintah `php artisan key:generate` ke terminal anda
 7. Masukkan perintah `composer dump-autoload`
 8. Buka file `vendor/crocodicstudio/crudbooster/src/database/seeds/CBSeeder.php` lalu masukkan kode berikut pada baris pertama setelah tag php:
```
    namespace Database\Seeders;
```
 9. Install dependensi CrudBooster dengan memasukkan perintah
 ```
    php artisan crudbooster:install
 ```   
 10. Setelah dependesi CrudBooster terinstall, hapus database **we-cycle** dan buat lagi dengan nama yang sama tanpa menambahkan tabel apapun ke dalam database
 
 11. Impor file database **we-cycle.sql** yang telah kami sediakan ke database yang baru saja anda buat
 12. Jalankan perintah `php artisan serve`
 13. Buka link http://localhost:8000/. Jika tampilan web sudah terlihat maka anda sudah berhasil menginstall aplikasi we-cycle!


## Project Preview <a name = "preview"></a>

Link Figma : https://www.figma.com/design/BVMMtqQaNs6ri9iclUMQXT/BANK-SAMPAH?node-id=67-1324&t=9W7Xt8GJ1sHwIvYz-0
