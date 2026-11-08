<?php

namespace App\Support;

/**
 * Format penamaan BSU yang seragam:
 *   BSU {Nama}                         (tingkat kelurahan, tanpa RW)
 *   BSU {Nama} RW {nn}                 (tingkat RW)
 *   ... + " Kel. {Kelurahan}"          bila kelurahan diisi
 * Contoh: "BSU Melati 1 RW 02 Kel. Meruya Selatan"
 */
class BsuNaming
{
    public static function inti($nama)
    {
        $n = trim(preg_replace('/\s+/', ' ', (string) $nama));
        $n = preg_replace('/^BSU\b\.?\s*/i', '', $n);                 // awalan BSU
        $n = preg_replace('/\s*\bKel(?:urahan)?\.?\s*.+$/i', '', $n);  // " Kel. Xxx" di akhir
        $n = preg_replace('/\s*\bRW\.?\s*0*\d+\b/i', '', $n);          // " RW 02"
        return trim($n);
    }

    public static function format($nama, $rw = null, $kelurahan = null)
    {
        $inti = self::inti($nama);
        $out = 'BSU' . ($inti !== '' ? ' ' . $inti : '');
        $rw = trim((string) $rw);
        if ($rw !== '' && ctype_digit($rw)) {
            $out .= ' RW ' . str_pad((string) (int) $rw, 2, '0', STR_PAD_LEFT);
        }
        $kel = trim(preg_replace('/\s+/', ' ', (string) $kelurahan));
        if ($kel !== '') {
            $out .= ' Kel. ' . $kel;
        }
        return mb_substr($out, 0, 255);
    }
}
