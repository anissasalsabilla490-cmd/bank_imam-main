<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // Jaring pengaman penarikan saldo (butuh cron: * * * * * php artisan schedule:run)
        $schedule->command('withdrawals:reconcile')->everyFiveMinutes()->withoutOverlapping();

        // Hosting tanpa proses worker permanen: proses antrian lewat cron tiap menit.
        // Nonaktif otomatis bila QUEUE_CONNECTION=sync.
        if (config('queue.default') !== 'sync') {
            $schedule->command('queue:work --stop-when-empty --max-time=55 --tries=4')
                ->everyMinute()->withoutOverlapping();
        }
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
