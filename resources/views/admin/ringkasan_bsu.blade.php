@extends('crudbooster::admin_template')
@section('content')
<style>.btn-besar{display:block;padding:18px 8px;margin-bottom:12px;font-size:1.1em;white-space:normal} .btn-besar i{display:block;font-size:2em;margin-bottom:6px}</style>
<div class="row">
 <div class="col-xs-6 col-md-3"><a class="btn btn-success btn-besar" href="{{ CRUDBooster::adminPath('setoran_massal') }}"><i class="fa fa-table"></i>Setoran Massal</a></div>
 <div class="col-xs-6 col-md-3"><a class="btn btn-primary btn-besar" href="{{ CRUDBooster::adminPath('kas_umum') }}"><i class="fa fa-book"></i>Buku Kas</a></div>
 <div class="col-xs-6 col-md-3"><a class="btn btn-warning btn-besar" href="{{ CRUDBooster::adminPath('harga_bsu') }}"><i class="fa fa-tags"></i>Harga & Margin</a></div>
 <div class="col-xs-6 col-md-3"><a class="btn btn-info btn-besar" href="{{ CRUDBooster::adminPath('kamus') }}"><i class="fa fa-book"></i>Kamus Sampah</a></div>
</div>
<div class="row">
 <div class="col-sm-6 col-md-3"><div class="info-box bg-green"><span class="info-box-icon"><i class="fa fa-money"></i></span><div class="info-box-content"><span class="info-box-text">Saldo kas BSU</span><span class="info-box-number">Rp {{ number_format($saldoKas,0,',','.') }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-aqua"><i class="fa fa-users"></i></span><div class="info-box-content"><span class="info-box-text">Total saldo {{ number_format($nasabah) }} nasabah</span><span class="info-box-number">Rp {{ number_format($saldoNasabah,0,',','.') }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-olive"><i class="fa fa-arrow-down"></i></span><div class="info-box-content"><span class="info-box-text">Setoran bulan ini</span><span class="info-box-number">{{ number_format($set->n) }}× · {{ rtrim(rtrim(number_format($set->kg,2,',','.'),'0'),',') }} kg</span><span class="progress-description">Saldo masuk Rp {{ number_format($set->rp,0,',','.') }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-red"><i class="fa fa-arrow-up"></i></span><div class="info-box-content"><span class="info-box-text">Kas keluar bulan ini</span><span class="info-box-number">Rp {{ number_format($bulan['keluar'],0,',','.') }}</span><span class="progress-description">Kas masuk Rp {{ number_format($bulan['masuk'],0,',','.') }} · {{ $tukar }} penukaran saldo</span></div></div></div>
</div>
<div class="row">
 <div class="col-md-6"><div class="box box-warning"><div class="box-header"><h3 class="box-title"><i class="fa fa-line-chart"></i> Harga sampah terbaru dari BSI</h3></div><div class="box-body">
  @forelse($perubahan as $p)<div>{{ date('d/m',strtotime($p->tanggal)) }} — <b>{{ $p->nama }}</b>: Rp {{ number_format($p->harga_lama,0,',','.') }} → <b class="{{ $p->harga_baru>$p->harga_lama?'text-green':'text-red' }}">Rp {{ number_format($p->harga_baru,0,',','.') }}</b></div>
  @empty<span class="text-muted">Belum ada perubahan harga dari BSI.</span>@endforelse
  <p style="margin-top:8px"><a href="{{ CRUDBooster::adminPath('harga_bsu') }}">Atur margin ({{ $hargaTerhubung }} jenis terhubung) →</a></p></div></div></div>
 <div class="col-md-6"><div class="box box-success"><div class="box-header"><h3 class="box-title"><i class="fa fa-calendar"></i> Jadwal pengumpulan berikutnya</h3></div><div class="box-body">
  @forelse($jadwal as $j)<div>{{ date('d/m/Y',strtotime($j->tanggal)) }} {{ $j->jam_mulai ? substr($j->jam_mulai,0,5) : '' }} — <b>{{ $j->judul }}</b> {{ $j->lokasi }}</div>
  @empty<span class="text-muted">Belum ada jadwal.</span>@endforelse
  <p style="margin-top:8px"><a href="{{ CRUDBooster::adminPath('jadwal_pengumpulan/kalender') }}">Buka kalender →</a></p></div></div></div>
</div>
@endsection
