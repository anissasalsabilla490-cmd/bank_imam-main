<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class LaporanKasExport implements FromArray, WithHeadings, ShouldAutoSize, WithTitle
{
    private $lap;
    private $namaBsu;

    public function __construct(array $laporan, $namaBsu)
    {
        $this->lap = $laporan;
        $this->namaBsu = $namaBsu;
    }

    public function title(): string
    {
        return 'Laporan Kas';
    }

    public function headings(): array
    {
        return [
            [$this->namaBsu],
            ['Laporan Kas ' . $this->lap['judul']],
            [],
            ['Tanggal', 'Uraian', 'Pemasukan', 'Pengeluaran', 'Saldo'],
        ];
    }

    public function array(): array
    {
        $l = $this->lap;
        $out = [['', 'Saldo awal', '', '', $l['saldo_awal']]];
        foreach ($l['baris'] as $b) {
            $out[] = [$b['tanggal'], $b['uraian'], $b['masuk'] ?: '', $b['keluar'] ?: '', $b['saldo']];
        }
        $out[] = ['', 'TOTAL', $l['masuk'], $l['keluar'], $l['saldo_akhir']];
        $out[] = [];
        $out[] = ['Rekap per kategori'];
        foreach ($l['per_kategori'] as $k) {
            $out[] = [$k['tipe'] === 'masuk' ? 'Pemasukan' : 'Pengeluaran', $k['kategori'], $k['tipe'] === 'masuk' ? $k['jumlah'] : '', $k['tipe'] === 'keluar' ? $k['jumlah'] : ''];
        }
        return $out;
    }
}
