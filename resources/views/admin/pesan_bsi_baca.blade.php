@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-arrow-left"></i> Semua pengumuman</a></p>
<div class="box box-success"><div class="box-header"><h3 class="box-title">{{ $p->judul }}</h3></div><div class="box-body">
 <p class="text-muted">Dari {{ $p->pengirim }} · {{ date('d/m/Y H:i', strtotime($p->created_at)) }}</p>
 <div style="white-space:pre-wrap;font-size:1.1em">{{ $p->isi }}</div>
 @if(count($harga))<hr><h4>Daftar harga acuan BSI</h4>
 <div class="table-responsive"><table class="table table-bordered table-striped" style="max-width:640px"><thead><tr><th>Jenis sampah</th><th>Kategori</th><th class="text-right">Harga acuan/kg</th></tr></thead>
 @foreach($harga as $h)<tr><td>{{ $h['nama'] }}</td><td>{{ $h['kategori'] }}</td><td class="text-right">Rp {{ number_format($h['harga'],0,',','.') }}</td></tr>@endforeach</table></div>@endif
 <p style="margin-top:14px"><a class="btn btn-warning btn-lg" href="{{ CRUDBooster::adminPath('harga_bsu') }}"><i class="fa fa-tags"></i> Atur Harga & Margin</a></p>
</div></div>
@endsection
