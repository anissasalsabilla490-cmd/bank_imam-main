@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-arrow-left"></i> Catatan Kas</a></p>
<div class="box box-default"><div class="box-body">
<form method="get" class="form-inline" id="f">
  <label>Periode</label>
  <select name="periode" id="periode" class="form-control"><option value="harian" {{ $periode=='harian'?'selected':'' }}>Harian</option><option value="bulanan" {{ $periode=='bulanan'?'selected':'' }}>Bulanan</option><option value="tahunan" {{ $periode=='tahunan'?'selected':'' }}>Tahunan</option></select>
  <input type="{{ $periode=='harian'?'date':($periode=='bulanan'?'month':'number') }}" name="nilai" id="nilai" value="{{ $nilai }}" class="form-control" {{ $periode=='tahunan'?'min=2020 max=2100':'' }}>
  <button class="btn btn-primary">Tampilkan</button>
  <a class="btn btn-danger" href="{{ CRUDBooster::mainpath('export-pdf') }}?periode={{ $periode }}&nilai={{ $nilai }}"><i class="fa fa-file-pdf-o"></i> PDF</a>
  <a class="btn btn-success" href="{{ CRUDBooster::mainpath('export-excel') }}?periode={{ $periode }}&nilai={{ $nilai }}"><i class="fa fa-file-excel-o"></i> Excel</a>
</form></div></div>

<div class="row">
 <div class="col-sm-3"><div class="info-box"><span class="info-box-icon bg-gray"><i class="fa fa-flag-o"></i></span><div class="info-box-content"><span class="info-box-text">Saldo awal</span><span class="info-box-number">Rp {{ number_format($lap['saldo_awal'],0,',','.') }}</span></div></div></div>
 <div class="col-sm-3"><div class="info-box"><span class="info-box-icon bg-aqua"><i class="fa fa-arrow-down"></i></span><div class="info-box-content"><span class="info-box-text">Pemasukan</span><span class="info-box-number">Rp {{ number_format($lap['masuk'],0,',','.') }}</span></div></div></div>
 <div class="col-sm-3"><div class="info-box"><span class="info-box-icon bg-red"><i class="fa fa-arrow-up"></i></span><div class="info-box-content"><span class="info-box-text">Pengeluaran</span><span class="info-box-number">Rp {{ number_format($lap['keluar'],0,',','.') }}</span></div></div></div>
 <div class="col-sm-3"><div class="info-box bg-green"><span class="info-box-icon"><i class="fa fa-money"></i></span><div class="info-box-content"><span class="info-box-text">Saldo akhir</span><span class="info-box-number">Rp {{ number_format($lap['saldo_akhir'],0,',','.') }}</span></div></div></div>
</div>

<div class="box box-success"><div class="box-header"><h3 class="box-title">Laporan {{ $lap['judul'] }}</h3></div>
<div class="box-body table-responsive"><table class="table table-bordered table-striped">
<thead><tr><th>Tanggal</th><th>Uraian</th><th class="text-right">Pemasukan</th><th class="text-right">Pengeluaran</th><th class="text-right">Saldo</th></tr></thead><tbody>
<tr class="text-muted"><td></td><td><i>Saldo awal</i></td><td></td><td></td><td class="text-right">{{ number_format($lap['saldo_awal'],0,',','.') }}</td></tr>
@forelse($lap['baris'] as $b)
<tr><td>{{ $b['tanggal'] }}</td><td>{{ $b['uraian'] }}</td><td class="text-right">{{ $b['masuk'] ? number_format($b['masuk'],0,',','.') : '' }}</td><td class="text-right">{{ $b['keluar'] ? number_format($b['keluar'],0,',','.') : '' }}</td><td class="text-right">{{ number_format($b['saldo'],0,',','.') }}</td></tr>
@empty<tr><td colspan="5" class="text-center text-muted">Tidak ada transaksi pada periode ini.</td></tr>@endforelse
<tr><th colspan="2" class="text-right">Total</th><th class="text-right">{{ number_format($lap['masuk'],0,',','.') }}</th><th class="text-right">{{ number_format($lap['keluar'],0,',','.') }}</th><th class="text-right">{{ number_format($lap['saldo_akhir'],0,',','.') }}</th></tr>
</tbody></table>
@if(count($lap['per_kategori']))
<h4>Rekap per kategori</h4><table class="table table-condensed" style="max-width:520px">
@foreach($lap['per_kategori'] as $k)<tr><td>{{ $k['tipe']=='masuk'?'Pemasukan':'Pengeluaran' }} — {{ $k['kategori'] }}</td><td class="text-right">Rp {{ number_format($k['jumlah'],0,',','.') }}</td></tr>@endforeach</table>
@endif</div></div>

<div class="box box-default"><div class="box-header"><h3 class="box-title">Catat penjualan ke BSI sebagai pemasukan</h3></div><div class="box-body">
<p class="text-muted">Mengambil data dari menu <b>Transaksi BSI</b> yang belum ada di buku kas. Aman diulang: data yang sudah dicatat tidak akan ganda.</p>
<form method="post" action="{{ CRUDBooster::mainpath('impor-bsi') }}" class="form-inline">{{ csrf_field() }}
 <label>Mulai tanggal (opsional)</label> <input type="date" name="mulai" class="form-control">
 <button class="btn btn-info" onclick="return confirm('Catat penjualan BSI ke buku kas?')"><i class="fa fa-download"></i> Catat sekarang</button></form></div></div>
@endsection
@push('bottom')
<script>document.getElementById('periode').addEventListener('change',function(){var n=document.getElementById('nilai'),p=this.value,d=new Date(),m=('0'+(d.getMonth()+1)).slice(-2);
 if(p==='harian'){n.type='date';n.value=d.getFullYear()+'-'+m+'-'+('0'+d.getDate()).slice(-2);} else if(p==='bulanan'){n.type='month';n.value=d.getFullYear()+'-'+m;} else {n.type='number';n.value=d.getFullYear();}});</script>
@endpush
