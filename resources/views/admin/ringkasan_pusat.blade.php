@extends('crudbooster::admin_template')
@section('content')
<div class="row">
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-green"><i class="fa fa-recycle"></i></span><div class="info-box-content"><span class="info-box-text">Jenis sampah (acuan BSI)</span><span class="info-box-number">{{ $jmlJenis }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-aqua"><i class="fa fa-building-o"></i></span><div class="info-box-content"><span class="info-box-text">BSU terdaftar</span><span class="info-box-number">{{ $jmlBsu }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-olive"><i class="fa fa-link"></i></span><div class="info-box-content"><span class="info-box-text">BSU memakai harga BSI</span><span class="info-box-number">{{ $terhubung }}</span></div></div></div>
 <div class="col-sm-6 col-md-3"><div class="info-box"><span class="info-box-icon bg-yellow"><i class="fa fa-users"></i></span><div class="info-box-content"><span class="info-box-text">Nasabah</span><span class="info-box-number">{{ number_format($jmlNasabah) }}</span></div></div></div>
</div>
<div class="box box-warning"><div class="box-header"><h3 class="box-title">Perubahan harga acuan terbaru</h3></div><div class="box-body">
 @forelse($perubahan as $p)<div>{{ date('d/m/Y',strtotime($p->tanggal)) }} — <b>{{ $p->nama }}</b>: Rp {{ number_format($p->harga_lama,0,',','.') }} → Rp {{ number_format($p->harga_baru,0,',','.') }}</div>@empty<span class="text-muted">Belum ada perubahan.</span>@endforelse
 <p style="margin-top:8px"><a href="{{ CRUDBooster::adminPath('bsi_harga') }}">Kelola harga acuan →</a></p></div></div>
@endsection
