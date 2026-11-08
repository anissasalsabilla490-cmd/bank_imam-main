# Fitur Baru — Panduan Singkat

## Pasang (Laragon, PHP 7.4)
1. Salin semua file paket ini ke folder proyek (timpa file yang sama).
2. Laragon Terminal: `setup-laragon.bat` — menjalankan migrasi (hanya menambah tabel/kolom) dan membuat akun BSI.
   Manual: `php artisan migrate --path=database/migrations/pembayaran --force`, lalu
   `php artisan migrate --path=database/migrations/fitur_baru --force`, lalu `php artisan bsi:buat-akun`.
3. Akun BSI berikutnya dibuat oleh **Super Admin** lewat menu **Akun BSI** (tambah, ubah, nonaktifkan; password boleh dikosongkan saat edit bila tidak diganti). Akun berstatus *Inactive* otomatis dikeluarkan dan tidak bisa masuk.
   Akun BSI pertama dibuat lewat perintah di atas. **Catat password BSI yang tampil sekali** (login di `/admin/login`, email `bsi@bankimam.local`). Reset: `php artisan bsi:buat-akun --reset`.
4. Production: `APP_DEBUG=false`.

## Peran
| Peran | Akses |
|---|---|
| BSI | Harga Acuan, Riwayat harga, Kamus & Istilah, lihat Manajemen BSU, Ringkasan |
| BSU | Harga & Margin, Setoran Massal, Buku Kas, Kategori Kas, Jadwal, Kamus, Ringkasan |
| Admin/Super Admin | Kelola BSU, Harga Acuan, Istilah; lihat Kas & Jadwal. **Akun BSI: hanya Super Admin** |
| Nasabah | Dashboard (ringkasan, harga terbaru, jadwal), Katalog (cari, ⓘ, istilah), Riwayat dengan filter periode |

## Alur harga
BSI mengisi **Harga Acuan** → BSU buka **Harga & Margin** → *Aktifkan* jenis (atau *Hubungkan* sampah lama; harga nasabah tetap).
Harga beli nasabah = Harga BSI − margin (Rp/kg atau %). Saat BSI mengubah harga: harga nasabah semua BSU yang "Ikuti BSI" dihitung ulang, dicatat di riwayat, dan BSU dapat notifikasi (lonceng CMS).

## Pengumuman BSI ke BSU
BSI membuka **Pengumuman ke BSU** (atau tombol *Kirim Pengumuman ke BSU* di Harga Acuan BSI) → isi judul dan pesan → pilih **satu atau banyak BSU** (cari nama, saring kecamatan, pilih semua yang tampil) → opsional *Lampirkan daftar harga acuan terbaru* (dicatat apa adanya saat dikirim) → Kirim.
BSU menerima notifikasi di lonceng dan membuka menu **Pengumuman dari BSI**; BSI dapat melihat siapa saja yang sudah membaca. BSU hanya dapat membuka pengumuman yang ditujukan kepadanya.

## Kalkulator (angka koma)
- **Nasabah:** Pengaturan → *Kalkulator Setoran* (juga tautan di beranda). **BSU:** menu *Kalkulator Setoran*.
- Kotak **Jumlahkan berat** menerima `1,7` · `1,7kg 2,5kg` · `1,7 + 2,5 + 3` · `500g`. Satuan g/gr diubah ke kg.
- Bagian **Hitung nilai setoran**: pilih jenis sampah + berat → rupiah dan poin (pembulatan sama dengan server: berat 2 desimal).
- Tanpa koma, titik dianggap desimal (`2.5`). Angka seperti `1.000` sengaja **ditolak** karena ambigu; tulis `1000` atau `1,0`.
- Kolom berat di **Setoran Massal** kini juga menerima koma dan penjumlahan langsung.

## Aksesibilitas & Tampilan
- Nasabah: *Pengaturan → Aksesibilitas & Tampilan*. CMS (semua peran): menu *Pengaturan Tampilan*. Tombol **Aa** di pojok kanan atas = pintasan ke sana.
- **Ukuran huruf** dan **ukuran ikon** dipisah, masing-masing: Kecil, Sedang, Besar, Sangat Besar.
- **Warna:** Standar, Kontras Tinggi, Mode Gelap, Kuning di Hitam, atau **Warna sendiri** (tulisan, latar, tombol, tautan) dengan indikator rasio kontras.
- Tersimpan di peramban/perangkat tiap pengguna; tombol *Kembalikan ke standar* tersedia.

## Catatan
- Setoran massal memakai rumus & pencatatan saldo yang sama dengan input lama (poin, saldo, ledger).
- "Nomor identitas" nasabah = ID nasabah / no. HP (belum ada kolom NIK di database).
- BSU lama belum punya kecamatan/kelurahan: isi lewat **Manajemen BSU**; nama seragam hanya diterapkan atas persetujuan (tombol *Terapkan*).
- Buku kas: *Catat penjualan ke BSI* mengimpor Transaksi BSI lama; isi "Mulai tanggal" bila tidak ingin saldo awal ikut besar.
