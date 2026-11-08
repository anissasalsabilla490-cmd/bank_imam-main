@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-arrow-left"></i> Kembali</a></p>
<div class="row">
 <div class="col-md-6"><div class="box box-success"><div class="box-header"><h3 class="box-title">{{ $p->judul }}</h3></div><div class="box-body">
  <p class="text-muted">Dikirim {{ date('d/m/Y H:i', strtotime($p->created_at)) }}</p>
  <div style="white-space:pre-wrap">{{ $p->isi }}</div>
  @if(count($harga))<hr><b>Daftar harga acuan saat dikirim</b>
  <table class="table table-condensed"><thead><tr><th>Jenis</th><th>Kategori</th><th class="text-right">Harga/kg</th></tr></thead>
  @foreach($harga as $h)<tr><td>{{ $h['nama'] }}</td><td>{{ $h['kategori'] }}</td><td class="text-right">Rp {{ number_format($h['harga'],0,',','.') }}</td></tr>@endforeach</table>@endif
 </div></div></div>
 <div class="col-md-6"><div class="box box-primary"><div class="box-header"><h3 class="box-title">Tujuan ({{ count($tujuan) }} BSU)</h3></div><div class="box-body table-responsive">
  <table class="table table-striped"><thead><tr><th>BSU</th><th>Wilayah</th><th>Status</th></tr></thead>
  @foreach($tujuan as $t)<tr><td>{{ $t->name }}</td><td>{{ $t->kecamatan }}{{ $t->kelurahan ? ' / '.$t->kelurahan : '' }}</td>
   <td>@if($t->dibaca_at)<span class="label label-success">Dibaca {{ date('d/m H:i', strtotime($t->dibaca_at)) }}</span>@else<span class="label label-default">Belum dibaca</span>@endif</td></tr>@endforeach</table>
 </div></div></div>
</div>
@endsection
