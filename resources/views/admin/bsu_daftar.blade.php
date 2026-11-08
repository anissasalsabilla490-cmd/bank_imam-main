@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-table"></i> Tampilan tabel</a>
@if($boleh)<a href="{{ CRUDBooster::mainpath('add') }}" class="btn btn-success"><i class="fa fa-plus"></i> Tambah BSU (termasuk tingkat RW)</a>@endif</p>
<div class="box box-default"><div class="box-body">
<form method="get" class="form-inline">
 <input type="search" name="q" value="{{ $q }}" class="form-control" placeholder="Cari nama BSU…">
 <select name="kecamatan" class="form-control" onchange="this.form.kelurahan.value='';this.form.submit()"><option value="">Semua kecamatan</option>@foreach($opsiKec as $o)<option {{ $kec==$o?'selected':'' }}>{{ $o }}</option>@endforeach</select>
 <select name="kelurahan" class="form-control" onchange="this.form.submit()"><option value="">Semua kelurahan</option>@foreach($opsiKel as $o)<option {{ $kel==$o?'selected':'' }}>{{ $o }}</option>@endforeach</select>
 <button class="btn btn-primary">Cari</button> <a href="{{ CRUDBooster::mainpath('daftar') }}" class="btn btn-default">Reset</a>
 <span class="text-muted">{{ $total }} BSU, urut A–Z</span>
</form></div></div>

@forelse($grup as $kecamatan => $perKel)
<div class="box box-success"><div class="box-header with-border"><h3 class="box-title"><i class="fa fa-map-marker"></i> Kecamatan {{ $kecamatan }}</h3></div>
<div class="box-body">
@foreach($perKel as $kelurahan => $list)
 <h4 style="margin-top:6px">Kelurahan {{ $kelurahan }} <small>({{ $list->count() }})</small></h4>
 <div class="table-responsive"><table class="table table-condensed table-striped">
 @foreach($list as $b)
  @php($saran = \App\Support\BsuNaming::format($b->name, $b->rw, $b->kelurahan))
  <tr><td style="width:40%"><b>{{ $b->name }}</b> <span class="label label-{{ $b->tingkat=='rw'?'info':'default' }}">{{ $b->tingkat=='rw'?'RW':($b->tingkat?'Kelurahan':'-') }}</span>
     @if($b->status!='Active')<span class="label label-danger">Nonaktif</span>@endif</td>
   <td>{{ $b->no_whatsapp && $b->no_whatsapp!='0' ? $b->no_whatsapp : '' }}</td>
   <td>@if($b->kelurahan && $saran !== $b->name)<small class="text-muted">Saran nama seragam:</small> <code>{{ $saran }}</code>
     @if($boleh)<form method="post" action="{{ CRUDBooster::mainpath('terapkan') }}" style="display:inline">{{ csrf_field() }}<input type="hidden" name="id" value="{{ $b->id }}"><button class="btn btn-xs btn-warning">Terapkan</button></form>@endif @endif</td>
   <td class="text-right">@if($boleh)<a class="btn btn-xs btn-primary" href="{{ CRUDBooster::mainpath('edit/'.$b->id) }}"><i class="fa fa-pencil"></i> Edit</a>@endif</td></tr>
 @endforeach</table></div>
@endforeach
</div></div>
@empty<div class="callout callout-warning">Tidak ada BSU yang cocok.</div>@endforelse
@endsection
