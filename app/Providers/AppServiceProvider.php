<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Pengaturan ukuran huruf/ikon/kontras untuk SELURUH halaman CMS (CrudBooster).
        View::composer('crudbooster::admin_template', function ($view) {
            $f = $view->getFactory();
            $f->startPush('head');
            echo '<script>window.A11Y_URL = ' . json_encode(url(config('crudbooster.ADMIN_PATH', 'admin') . '/pengaturan_tampilan')) . ';</script>'
               . '<link rel="stylesheet" href="' . asset('css/aksesibilitas.css') . '">'
               . '<script src="' . asset('js/aksesibilitas.js') . '"></script>';
            $f->stopPush();
        });
    }
}
