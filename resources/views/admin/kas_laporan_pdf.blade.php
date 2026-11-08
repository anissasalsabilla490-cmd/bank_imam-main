<!DOCTYPE html><html><head><meta charset="utf-8"><title>Laporan Kas</title>
<style>body{font-family:DejaVu Sans,sans-serif;font-size:11px;color:#000} table.hd td{border:0;padding:2px 0} td.t1{font-size:15px;font-weight:bold} td.t2{font-size:12px;font-weight:bold} table.rk{margin-top:16px} table{width:100%;border-collapse:collapse;margin-top:8px}
th,td{border:1px solid #444;padding:4px 6px} th{background:#e8f5e9} .r{text-align:right} .ttd{margin-top:40px;width:100%} .ttd td{border:0;text-align:center}</style></head><body>
<table class="hd"><tr><td class="t1">{{ $nama }}</td></tr><tr><td class="t2">Laporan Kas {{ $lap['judul'] }}</td></tr></table>
<table><tr><th>Tanggal</th><th>Uraian</th><th>Pemasukan</th><th>Pengeluaran</th><th>Saldo</th></tr>
<tr><td></td><td><i>Saldo awal</i></td><td></td><td></td><td class="r">{{ number_format($lap['saldo_awal'],0,',','.') }}</td></tr>
@foreach($lap['baris'] as $b)<tr><td>{{ $b['tanggal'] }}</td><td>{{ $b['uraian'] }}</td><td class="r">{{ $b['masuk'] ? number_format($b['masuk'],0,',','.') : '' }}</td><td class="r">{{ $b['keluar'] ? number_format($b['keluar'],0,',','.') : '' }}</td><td class="r">{{ number_format($b['saldo'],0,',','.') }}</td></tr>@endforeach
<tr><th colspan="2" class="r">TOTAL</th><th class="r">{{ number_format($lap['masuk'],0,',','.') }}</th><th class="r">{{ number_format($lap['keluar'],0,',','.') }}</th><th class="r">{{ number_format($lap['saldo_akhir'],0,',','.') }}</th></tr></table>
@if(count($lap['per_kategori']))<table class="rk"><tr><th colspan="2" style="text-align:left">Rekap per kategori</th></tr>@foreach($lap['per_kategori'] as $k)<tr><td>{{ $k['tipe']=='masuk'?'Pemasukan':'Pengeluaran' }} — {{ $k['kategori'] }}</td><td class="r" style="width:120px">{{ number_format($k['jumlah'],0,',','.') }}</td></tr>@endforeach</table>@endif
<table class="ttd"><tr><td>Mengetahui,<br><br><br><br>(................)</td><td>Bendahara,<br><br><br><br>(................)</td></tr></table>
<p style="color:#666">Dicetak {{ date('d/m/Y H:i') }}</p></body></html>
