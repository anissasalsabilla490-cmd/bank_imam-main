@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-arrow-left"></i> Kembali ke Harga & Margin</a></p>
<div class="box box-default"><div class="box-body">
<form method="get" class="form-inline" style="margin-bottom:12px">
  <label>Dari</label> <input type="date" name="dari" value="{{ $dari }}" class="form-control">
  <label>sampai</label> <input type="date" name="sampai" value="{{ $sampai }}" class="form-control">
  <button class="btn btn-primary">Tampilkan</button>
</form>
<div class="table-responsive"><table class="table table-striped table-bordered">
<thead><tr><th>Tanggal</th><th>Jenis Sampah</th><th class="text-right">Harga Lama</th><th class="text-right">Harga Baru</th><th>Sumber</th><th>Catatan</th></tr></thead><tbody>
@forelse($rows as $r)
<tr><td>{{ date('d/m/Y', strtotime($r->tanggal)) }}</td><td>{{ $r->nama }}</td>
<td class="text-right">{{ $r->harga_lama === null ? '-' : 'Rp '.number_format($r->harga_lama,0,',','.') }}</td>
<td class="text-right">Rp {{ number_format($r->harga_baru,0,',','.') }}</td>
<td>{{ ['awal'=>'Aktivasi','bsi'=>'Perubahan harga BSI','margin'=>'Atur margin','manual'=>'Manual'][$r->sumber] ?? $r->sumber }}</td>
<td>{{ $r->catatan }}</td></tr>
@empty<tr><td colspan="6" class="text-center text-muted">Belum ada perubahan.</td></tr>@endforelse
</tbody></table></div></div></div>
@endsection
