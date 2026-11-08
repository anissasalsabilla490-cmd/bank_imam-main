@extends('crudbooster::admin_template')
@section('content')
<link rel="stylesheet" href="{{ asset('css/kalender.css') }}">
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default"><i class="fa fa-table"></i> Tampilan tabel</a></p>
<div class="row">
 <div class="col-md-5">
  <div class="box box-success"><div class="box-header"><h3 class="box-title">Kalender (titik oranye = ada jadwal)</h3></div><div class="box-body">
   <div id="kal"></div>
   <p class="text-muted" style="margin-top:8px">Klik satu tanggal, atau klik tanggal awal lalu tanggal akhir untuk beberapa hari.</p>
  </div></div>
 </div>
 <div class="col-md-7">
  <div class="box box-default"><div class="box-header"><h3 class="box-title" id="judul-pilih">Pilih tanggal</h3></div><div class="box-body">
   <div id="daftar" class="text-muted">Jadwal pada tanggal terpilih tampil di sini.</div><hr>
   <form method="post" action="{{ CRUDBooster::mainpath('simpan-cepat') }}">{{ csrf_field() }}
    <input type="hidden" name="dari" id="dari"><input type="hidden" name="sampai" id="sampai">
    <div class="row">
     <div class="col-sm-12 form-group"><label>Kegiatan</label><input name="judul" class="form-control" required minlength="3" placeholder="Penimbangan sampah rutin"></div>
     <div class="col-sm-3 form-group"><label>Jam mulai</label><input type="time" name="jam_mulai" class="form-control"></div>
     <div class="col-sm-3 form-group"><label>Jam selesai</label><input type="time" name="jam_selesai" class="form-control"></div>
     <div class="col-sm-6 form-group"><label>Lokasi</label><input name="lokasi" class="form-control"></div>
    </div>
    <button class="btn btn-success btn-lg" id="btn" disabled><i class="fa fa-plus"></i> Tambah jadwal</button>
   </form>
  </div></div>
 </div>
</div>
@endsection
@push('bottom')
<script src="{{ asset('js/kalender.js') }}"></script>
<script>
 var DATA=@json($rows), acara={};
 function esc(s){return String(s==null?'':s).replace(/[&<>"']/g,function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c];});}
 DATA.forEach(function(r){(acara[r.tanggal]=acara[r.tanggal]||[]).push(r.judul);});
 function tampil(d,s){
  document.getElementById('dari').value=d;document.getElementById('sampai').value=s;document.getElementById('btn').disabled=false;
  document.getElementById('judul-pilih').textContent=d===s?'Tanggal '+d.split('-').reverse().join('/'):d.split('-').reverse().join('/')+' – '+s.split('-').reverse().join('/');
  var h=DATA.filter(function(r){return r.tanggal>=d&&r.tanggal<=s;}).map(function(r){return '<li><b>'+esc(r.judul)+'</b> '+(r.jam_mulai?esc(r.jam_mulai.substr(0,5))+(r.jam_selesai?'–'+esc(r.jam_selesai.substr(0,5)):''):'')+(r.lokasi?' · '+esc(r.lokasi):'')+' <a href="{{ CRUDBooster::mainpath('edit') }}/'+r.id+'">ubah</a></li>';}).join('');
  document.getElementById('daftar').innerHTML=h?'<ul>'+h+'</ul>':'Belum ada jadwal pada tanggal ini.';
 }
 Kalender.pasang(document.getElementById('kal'),{mode:'range',acara:acara,onPilih:tampil});
</script>
@endpush
