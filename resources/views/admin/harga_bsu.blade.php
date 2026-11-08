@extends('crudbooster::admin_template')
@section('content')
@if(session('bsi_info'))<div class="alert alert-info">{{ session('bsi_info') }}</div>@endif

<div class="callout callout-info">
  <h4><i class="fa fa-info-circle"></i> Cara kerja</h4>
  <p><b>Harga beli nasabah = Harga BSI − Margin Anda.</b> Margin bisa Rupiah per kg atau persen. Bila BSI mengubah harga, harga beli nasabah dihitung ulang otomatis (jika "Ikuti BSI" dicentang) dan Anda mendapat notifikasi.</p>
</div>

@if(count($perubahanBaru))
<div class="box box-warning"><div class="box-header"><h3 class="box-title"><i class="fa fa-bell"></i> Perubahan harga BSI terbaru (14 hari)</h3></div>
<div class="box-body"><ul class="list-unstyled" style="margin:0">
@foreach($perubahanBaru as $p)
<li>{{ date('d/m', strtotime($p->tanggal)) }} — <b>{{ $p->nama }}</b>: Rp {{ number_format($p->harga_lama,0,',','.') }} →
 <b class="{{ $p->harga_baru > $p->harga_lama ? 'text-green' : 'text-red' }}">Rp {{ number_format($p->harga_baru,0,',','.') }}</b></li>
@endforeach</ul></div></div>
@endif

<form method="post" action="{{ CRUDBooster::mainpath('simpan') }}">
{{ csrf_field() }}
<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">Harga & margin jenis sampah</h3>
 <div class="box-tools"><a href="{{ CRUDBooster::mainpath('riwayat') }}" class="btn btn-sm btn-default"><i class="fa fa-history"></i> Riwayat perubahan</a></div></div>
<div class="box-body table-responsive">
<table class="table table-bordered table-striped" id="tbl-harga">
<thead><tr><th>Jenis Sampah</th><th class="text-right">Harga BSI/kg</th><th style="width:140px">Jenis margin</th><th style="width:130px">Margin</th><th class="text-right">Harga beli nasabah/kg</th><th>Ikuti BSI</th><th></th></tr></thead>
<tbody>
@foreach($baris as $b)
 @php($m=$b->master)@php($s=$b->sampah)
 <tr data-bsi="{{ $m->harga }}">
  <td><b>{{ $m->nama }}</b><br><small class="text-muted">{{ $m->kategori }}</small></td>
  <td class="text-right">Rp {{ number_format($m->harga,0,',','.') }}</td>
  @if($s)
   <td><select name="margin[{{ $s->id }}][type]" class="form-control jenis">
        <option value="nominal" {{ $s->margin_type=='nominal'?'selected':'' }}>Rp per kg</option>
        <option value="persen" {{ $s->margin_type=='persen'?'selected':'' }}>Persen (%)</option></select></td>
   <td><input type="number" step="0.01" min="0" name="margin[{{ $s->id }}][value]" value="{{ rtrim(rtrim($s->margin_value,'0'),'.') ?: 0 }}" class="form-control nilai"></td>
   <td class="text-right"><b class="hasil">Rp {{ number_format($s->price_per_kg,0,',','.') }}</b></td>
   <td class="text-center"><input type="checkbox" name="margin[{{ $s->id }}][auto]" value="1" {{ $s->auto_sync?'checked':'' }} style="width:20px;height:20px"></td>
   <td><button type="submit" form="putus-{{ $s->id }}" class="btn btn-xs btn-default" onclick="return confirm('Putuskan dari harga BSI?')">Putuskan</button></td>
  @else
   <td colspan="4" class="text-muted">Belum aktif di BSU Anda</td>
   <td><button type="button" class="btn btn-sm btn-success" onclick="aktifkan({{ $m->id }}, @json($m->nama))">Aktifkan</button></td>
  @endif
 </tr>
@endforeach
@if(!count($baris))<tr><td colspan="7" class="text-center text-muted">BSI belum mengisi daftar harga acuan.</td></tr>@endif
</tbody></table></div>
<div class="box-footer"><button class="btn btn-primary btn-lg"><i class="fa fa-save"></i> Simpan semua margin</button></div></div>
</form>

@foreach($baris as $b)@if($b->sampah)
<form id="putus-{{ $b->sampah->id }}" method="post" action="{{ CRUDBooster::mainpath('putuskan') }}">{{ csrf_field() }}<input type="hidden" name="sampah_id" value="{{ $b->sampah->id }}"></form>
@endif @endforeach

@if(count($belumTerhubung) && count($master))
<div class="box box-default"><div class="box-header"><h3 class="box-title">Hubungkan sampah lama Anda ke harga BSI</h3></div>
<div class="box-body"><p class="text-muted">Harga beli nasabah saat ini tidak berubah; margin awal dihitung otomatis.</p>
<form method="post" action="{{ CRUDBooster::mainpath('hubungkan') }}" class="form-inline">{{ csrf_field() }}
<select name="sampah_id" class="form-control" required>@foreach($belumTerhubung as $x)<option value="{{ $x->id }}">{{ $x->name }} (Rp {{ number_format($x->price_per_kg,0,',','.') }})</option>@endforeach</select>
<i class="fa fa-arrow-right"></i>
<select name="bsi_harga_id" class="form-control" required>@foreach($master as $m)<option value="{{ $m->id }}">{{ $m->nama }} (BSI Rp {{ number_format($m->harga,0,',','.') }})</option>@endforeach</select>
<button class="btn btn-primary">Hubungkan</button></form></div></div>
@endif

<form id="f-aktif" method="post" action="{{ CRUDBooster::mainpath('aktifkan') }}">{{ csrf_field() }}
<input type="hidden" name="bsi_harga_id"><input type="hidden" name="type" value="nominal"><input type="hidden" name="value"></form>
@endsection

@push('bottom')
<script>
function rp(n){return 'Rp '+Math.round(n).toLocaleString('id-ID');}
function hitung(tr){
  var bsi=parseFloat(tr.getAttribute('data-bsi')), j=tr.querySelector('.jenis'), v=tr.querySelector('.nilai');
  if(!j||!v) return; var val=parseFloat(v.value)||0;
  var margin = j.value==='persen' ? bsi*val/100 : val;
  tr.querySelector('.hasil').textContent = rp(Math.max(0,bsi-margin));
}
document.querySelectorAll('#tbl-harga tbody tr').forEach(function(tr){
  tr.querySelectorAll('.jenis,.nilai').forEach(function(el){el.addEventListener('input',function(){hitung(tr);});});
});
function aktifkan(id,nama){
  var v=prompt('Margin awal untuk "'+nama+'" (Rupiah per kg). Boleh 0, bisa diubah nanti:','0');
  if(v===null) return; var f=document.getElementById('f-aktif');
  f.bsi_harga_id.value=id; f.value.value=parseFloat(v)||0; f.submit();
}
</script>
@endpush
