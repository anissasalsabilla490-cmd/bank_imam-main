# Fitur Penarikan Saldo Digital (Xendit Payouts) — Panduan Pemasangan & Operasional

Nasabah menarik saldo ke **e-wallet (DANA, OVO, GoPay, ShopeePay) atau rekening bank**. Dana dikirim otomatis lewat Xendit; saldo dikembalikan otomatis jika gagal.

## 1. Isi paket
- File **baru**: service, job, model, controller, view, migrasi (`database/migrations/pembayaran/`), test.
- File **diubah** (lihat `perubahan-file-lama.patch`): `routes/web.php`, `routes/api.php`, `config/services.php`, `app/Console/Kernel.php`, dashboard, `.env.example*`, `phpunit.xml`, serta 4 controller yang mengubah saldo.
- Salin isi zip ke root proyek (timpa). **Jika file Anda sudah berbeda dari zip asli, terapkan patch secara manual**, jangan menimpa.

## 2. Perbaikan keamanan di fitur lama (ikut dalam paket)
1. `TukarSaldoController::store()` sebelumnya menerima nominal negatif → **saldo bertambah** (terbukti di test: 100.000 menjadi 1.099.999). Sekarang divalidasi (bilangan bulat positif).
2. Potong saldo + stok reward kini satu transaksi database dengan penguncian baris (sebelumnya bisa dobel saat klik/permintaan bersamaan).
3. Semua perubahan saldo (setor sampah, pembatalan, tukar saldo, refund, koreksi CMS) lewat `SaldoService` dan tercatat di tabel **`saldo_mutasi`** (ledger, tidak boleh diubah/dihapus).

## 3. Pemasangan (urutan wajib)
```bash
# 0. BACKUP database dulu
mysqldump -u USER -p bank_imam > backup_sebelum_pembayaran.sql

# 1. Salin file, lalu:
composer install --no-dev      # bila perlu

# 2. Migrasi — JANGAN pakai `php artisan migrate` polos (lihat catatan)
php artisan migrate --path=database/migrations/pembayaran --force
```
> **Catatan:** tabel `migrations` pada dump Anda tidak mencatat beberapa migrasi lama (sampah, sales, educational_news, laporan_komposting). `php artisan migrate` polos akan gagal di sana. Karena itu migrasi fitur ini ada di subfolder dan dijalankan dengan `--path`.
> Migrasi `..._000004` menolak berjalan jika ada `user_id` ganda di tabel `saldo` (pada dump saat ini: tidak ada).

**Saldo awal ledger (jalankan SEKALI, tepat setelah migrasi):**
```sql
INSERT INTO saldo_mutasi (user_id, type, amount, balance_after, source, note, created_at)
SELECT user_id, 'credit', total_saldo, total_saldo, 'saldo_awal', 'Saldo awal sebelum ledger', NOW()
FROM saldo WHERE total_saldo > 0 AND user_id IS NOT NULL;
```

## 4. Konfigurasi `.env`
```env
APP_ENV=production
APP_DEBUG=false
QUEUE_CONNECTION=database

XENDIT_SECRET_KEY=xnd_development_...     # sandbox dulu; produksi: xnd_production_...
XENDIT_CALLBACK_TOKEN=...                 # token dari dashboard Xendit
WITHDRAWAL_ENABLED=true                   # ubah ke false = tombol darurat (tanpa deploy)
WITHDRAWAL_MIN=10000
WITHDRAWAL_MAX=500000
WITHDRAWAL_DAILY_AMOUNT=1000000
WITHDRAWAL_DAILY_COUNT=3
WITHDRAWAL_FEE_EWALLET=0
WITHDRAWAL_FEE_BANK=0
```
Lalu `php artisan config:clear` (atau `config:cache` di produksi). **Jangan commit `.env`.**

## 5. Worker & penjadwalan
Hosting biasa (tanpa proses permanen) cukup **satu cron**:
```
* * * * * cd /path/proyek && php artisan schedule:run >> /dev/null 2>&1
```
Jadwal otomatis: memproses antrian tiap menit dan `withdrawals:reconcile` tiap 5 menit (kirim ulang yang tertahan + sinkron status ke Xendit). Jika memakai worker permanen (Supervisor), jangan jalankan keduanya sekaligus.

## 6. Setup Xendit
1. Daftar di Xendit, ambil **API key mode Test**, isi `XENDIT_SECRET_KEY`.
2. Dashboard → *Settings → Developers → Callbacks* → URL **Payouts V2**:
   `https://DOMAIN-ANDA/api/webhooks/xendit/payout` (HTTPS wajib, domain publik). Salin *callback token* ke `XENDIT_CALLBACK_TOKEN`.
3. Cek kode channel di `config/withdrawal.php` terhadap daftar resmi: https://docs.xendit.co/xendisburse/channel-codes (hapus yang tidak didukung akun Anda).
4. Uji di sandbox memakai nomor uji dari dokumentasi Xendit (skenario: sukses, gagal, **reversal**). Pastikan: saldo terpotong, status berubah, saldo kembali saat gagal.
5. Pengembangan lokal: `ngrok http 8000` agar webhook bisa masuk.

## 7. Operasional harian
| Status | Arti | Tindakan |
|---|---|---|
| `pending` | saldo terpotong, belum terkirim | otomatis (job/reconcile) |
| `processing` | diterima Xendit | tunggu webhook |
| `success` | dana terkirim | — |
| `failed` | gagal, **saldo sudah dikembalikan** | — |
| `review` | hasil tidak pasti / anomali | **Super Admin** buka CMS → *Penarikan Saldo* → **Selesaikan**, **cek dashboard Xendit dulu** |

Aturan emas: sistem **tidak pernah refund otomatis** bila payout mungkin sudah keluar (timeout, duplikat, atau Xendit melapor sukses setelah refund). Kasus itu masuk `review`.
Log penting: `storage/logs/laravel.log` (cari `CRITICAL`/`ANOMALI`), tabel `payment_webhook_logs`.

## 8. Checklist sebelum go-live
- [ ] Backup DB; migrasi & saldo awal ledger sukses
- [ ] Uji sandbox lengkap (sukses, gagal, reversal, webhook terlambat)
- [ ] Akun Xendit produksi terverifikasi & **saldo Xendit terisi** (payout memakai saldo Anda)
- [ ] `APP_DEBUG=false`, HTTPS aktif, key produksi hanya di `.env` server
- [ ] Cron berjalan; alert/pemantauan untuk status `review` dan log `CRITICAL`
- [ ] Batas min/maks/harian & biaya sudah sesuai kebijakan; syarat & ketentuan untuk nasabah
- [ ] Tentukan siapa yang mendanai saldo Xendit & prosedur rekonsiliasi harian (saldo Xendit vs total `withdrawals` sukses)
- [ ] Konsultasi aspek hukum/perpajakan/perlindungan data (nomor rekening disimpan)

## 9. Menjalankan test
```bash
php vendor/phpunit/phpunit/phpunit tests/Feature
```
(Test memakai SQLite memori dan `processIsolation` karena CrudBooster memuat seeder-nya setiap boot.)
