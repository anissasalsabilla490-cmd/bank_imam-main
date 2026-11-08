@extends('crudbooster::admin_template')
@section('content')
<style>#daftar-bsu{max-height:360px;overflow:auto;border:1px solid #ddd;border-radius:6px;padding:6px 10px} #daftar-bsu label{display:block;font-weight:normal;padding:5px 0;margin:0;border-bottom:1px solid #f1f1f1;cursor:pointer} #daftar-bsu input{width:18px;height:18px;vertical-align:middle;margin-right:8px}</style>
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-arrow-left"></i> Kembali</a></p>
<form method="post" action="{{ CRUDBooster::mainpath('kirim') }}" id="f">{{ csrf_field() }}
<div class="row">
 <div class="col-md-6"><div class="box box-success"><div class="box-header"><h3 class="box-title">1. Isi pengumuman</h3></div><div class="box-body">
  <div class="form-group"><label>Judul</label><input name="judul" class="form-control" maxlength="150" required value="{{ old('judul', 'Pembaruan harga acuan sampah BSI') }}"></div>
  <div class="form-group"><label>Isi</label><textarea name="isi" rows="7" class="form-control" maxlength="5000" required>{{ old('isi', "Yth. Pengurus BSU,\n\nHarga acuan sampah dari BSI telah diperbarui. Mohon periksa menu Harga & Margin dan sesuaikan margin unit Anda bila diperlukan.\n\nTerima kasih.") }}</textarea></div>
  <div class="checkbox"><label><input type="checkbox" name="sertakan_harga" value="1" {{ old('sertakan_harga', 1) ? 'checked' : '' }} {{ $jmlHarga ? '' : 'disabled' }}> <b>Lampirkan daftar harga acuan terbaru</b> ({{ $jmlHarga }} jenis aktif, dicatat apa adanya saat dikirim)</label></div>
 </div></div></div>
 <div class="col-md-6"><div class="box box-primary"><div class="box-header"><h3 class="box-title">2. Pilih BSU tujuan <span class="label label-primary" id="hitung">0 dipilih</span></h3></div><div class="box-body">
  <div class="row" style="margin-bottom:8px">
   <div class="col-sm-6"><input type="search" id="cari" class="form-control" placeholder="Cari nama BSU…"></div>
   <div class="col-sm-6"><select id="kec" class="form-control"><option value="">Semua kecamatan</option>@foreach($kecamatan as $k)<option>{{ $k }}</option>@endforeach</select></div>
  </div>
  <p><button type="button" class="btn btn-xs btn-default" id="semua">Pilih semua yang tampil</button> <button type="button" class="btn btn-xs btn-default" id="kosong">Kosongkan pilihan</button></p>
  <div id="daftar-bsu">
   @foreach($bsu as $b)
   <label class="item" data-n="{{ mb_strtolower($b->name) }}" data-k="{{ $b->kecamatan }}"><input type="checkbox" name="bsu[]" value="{{ $b->id }}" {{ in_array($b->id, (array) old('bsu', [])) ? 'checked' : '' }}>{{ $b->name }}
     @if($b->kecamatan || $b->kelurahan)<small class="text-muted"> — {{ trim(($b->kecamatan ? 'Kec. '.$b->kecamatan : '').($b->kelurahan ? ', Kel. '.$b->kelurahan : ''), ', ') }}</small>@endif</label>
   @endforeach
  </div>
 </div></div></div>
</div>
<button class="btn btn-success btn-lg" id="kirim"><i class="fa fa-paper-plane"></i> Kirim pengumuman</button>
</form>
@endsection
@push('bottom')
<script>
(function(){
 var items=[].slice.call(document.querySelectorAll('#daftar-bsu .item')), hit=document.getElementById('hitung');
 function ceklis(e){return e.querySelector('input');}
 function update(){hit.textContent=items.filter(function(e){return ceklis(e).checked;}).length+' dipilih';}
 function saring(){var t=document.getElementById('cari').value.trim().toLowerCase(),k=document.getElementById('kec').value;
   items.forEach(function(e){e.style.display=(!t||e.dataset.n.indexOf(t)>-1)&&(!k||e.dataset.k===k)?'':'none';});}
 document.getElementById('cari').addEventListener('input',saring); document.getElementById('kec').addEventListener('change',saring);
 document.getElementById('semua').onclick=function(){items.forEach(function(e){if(e.style.display!=='none')ceklis(e).checked=true;});update();};
 document.getElementById('kosong').onclick=function(){items.forEach(function(e){ceklis(e).checked=false;});update();};
 document.getElementById('daftar-bsu').addEventListener('change',update); update();
 document.getElementById('f').addEventListener('submit',function(e){
   var n=items.filter(function(x){return ceklis(x).checked;}).length;
   if(n<1){e.preventDefault();alert('Pilih minimal satu BSU tujuan.');return;}
   if(!confirm('Kirim pengumuman ini ke '+n+' BSU?')){e.preventDefault();return;}
   document.getElementById('kirim').disabled=true; });
})();
</script>
@endpush
