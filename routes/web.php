<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserApp\ProfileController;
use App\Http\Controllers\UserApp\HomeController;
use App\Http\Controllers\UserApp\LoginController;
use App\Http\Controllers\UserApp\RewardController;
use App\Http\Controllers\UserApp\SampahController;
use App\Http\Controllers\UserApp\HistoryController;
use App\Http\Controllers\UserApp\RegisterController;
use App\Http\Controllers\UserApp\TukarPoinController;
use App\Http\Controllers\UserApp\TukarSaldoController;
use App\Http\Controllers\UserApp\WithdrawalController;
use App\Http\Controllers\UserApp\SalesController;
use App\Http\Controllers\UserApp\EducationalNewsController;
use App\Http\Controllers\UserApp\PanduanController as PanduanNasabahController;
use App\Http\Controllers\PanduanController as PanduanPengelolaController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['guest'])->group(function () {
    Route::get('/', function () {
        return view('landing-page');
    });
    Route::get('/login', [LoginController::class, 'index'])->name('login');
    // [SECURITY] throttle:5,1 = maks 5 percobaan login per menit per IP
    Route::post('/login', [LoginController::class, 'store'])->name('store')->middleware('throttle:5,1');
    Route::get('/register', [RegisterController::class, 'index'])->name('indexRegister');
    Route::post('/register', [RegisterController::class, 'store'])->name('storeUser');
    // Forgot Password
    Route::get('/forgot-password-direct', function () {
        return redirect()->route('login');
    });
    Route::post('/forgot-password-direct', [LoginController::class, 'forgotPasswordDirect'])->name('forgotPasswordDirect');
});

Route::middleware(['auth'])->group(function () {
    // AUTH
    Route::get('/dashboard', [LoginController::class, 'login'])->name('loginDashboard');
    // [SECURITY] Logout harus POST bukan GET (mencegah CSRF logout attack)
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
    Route::get('/profile', [ProfileController::class, 'show'])->name('showProfile');
    Route::put('/profile', [ProfileController::class, 'update'])->name('editProfile');

    // PAGES
    Route::get('/settings', [HomeController::class, 'settings'])->name('settings');
    Route::get('/kalkulator', [\App\Http\Controllers\UserApp\KalkulatorController::class, 'index'])->name('kalkulator');
    Route::get('/kategori-sampah', [SampahController::class, 'index'])->name('index');

    // Tukar Poin -> Transaction
    Route::get('/tukarPoin/{id}/detail', [TukarPoinController::class, 'detail'])->name('tukarPoinDetail');
    Route::get('/tukar-poin', [TukarPoinController::class, 'index'])->name('indexTukarPoin');
    Route::get('/tukar-poin/reward/{id}', [TukarPoinController::class, 'show'])->name('showReward');
    Route::get('/tukar-poin/reward/{id}/konfirmasi', [TukarPoinController::class, 'confirm'])->name('confirmReward');

    // Tukar Saldo -> Transaction
    Route::get('/tukarSaldo/{id}/detail', [TukarSaldoController::class, 'detail'])->name('tukarPoinDetail');
    Route::get('/tukar-saldo', [TukarSaldoController::class, 'index'])->name('indexTukarSaldo');
    Route::get('/tukar-saldo/reward/{id}', [TukarSaldoController::class, 'show'])->name('showReward');
    Route::post('/tukar-saldo/reward/{id}/konfirmasi', [TukarSaldoController::class, 'confirm'])->name('confirmReward');

    // Tarik Saldo Digital (payout ke e-wallet / bank)
    Route::get('/tarik-saldo', [WithdrawalController::class, 'index'])->name('tarikSaldo.index');
    Route::post('/tarik-saldo/konfirmasi', [WithdrawalController::class, 'confirm'])->middleware('throttle:20,1')->name('tarikSaldo.confirm');
    Route::post('/tarik-saldo', [WithdrawalController::class, 'store'])->middleware('throttle:6,1')->name('tarikSaldo.store');
    Route::get('/tarik-saldo/riwayat', [WithdrawalController::class, 'riwayat'])->name('tarikSaldo.riwayat');
    Route::get('/tarik-saldo/{id}', [WithdrawalController::class, 'show'])->whereNumber('id')->name('tarikSaldo.show');
    Route::get('/tarik-saldo/{id}/status', [WithdrawalController::class, 'status'])->whereNumber('id')->name('tarikSaldo.status');

    // Transaction
    Route::get('/transaction/{id}/detail', [HistoryController::class, 'show'])->name('transactionDetail');
    Route::get('/history/transaction', [HistoryController::class, 'transactionHistory'])->name('transactionHistory');
    Route::get('/history/points', [HistoryController::class, 'pointHistory'])->name('pointHistory');
    Route::get('/history/tukar-poin', [HistoryController::class, 'tukarPointHistory'])->name('tukarPointHistory');
    route::post('/tukar-poin/reward/{id}', [TukarPoinController::class, 'store'])->name('storeTukarPoin');
    route::post('/tukar-saldo/reward/{id}', [TukarSaldoController::class, 'store'])->name('storeTukarSaldo');

    // Sampah
    Route::get('/sampah/{id}/detail', [SampahController::class, 'detail'])->name('sampahDetail');

    // Sale
    Route::post('/sales/store', [SalesController::class, 'store'])->name('sales.store');
    Route::get('/transaction-details', [SalesController::class, 'showTransactionDetails'])->name('transaction.details');

    // Education
    //Route::resource('educational-news', 'EducationalNewsController');
    Route::get('/edukasi', [EducationalNewsController::class, 'index'])->name('edukasi.index');

    //Panduan
    Route::get('/nasabah/panduan', [PanduanNasabahController::class, 'index'])->name('nasabah.panduan');
    // Route::get('/pengelola/panduan', [PanduanPengelolaController::class, 'index'])->name('admin.panduan');





});
