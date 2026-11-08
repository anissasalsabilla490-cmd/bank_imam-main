@extends('crudbooster::admin_template')
@section('content')
<style>
 .kc{border:1px solid #ddd;border-radius:10px;background:#fff;overflow:hidden;height:100%}
 .kc img,.kc .ph{width:100%;height:140px;object-fit:cover;background:#eef2f6;display:flex;align-items:center;justify-content:center;color:#9aa;font-size:40px}
 .kc .b{padding:10px} .kc h4{margin:0 0 4px;font-size:1.05em}
 .info-i{border:0;background:#e3f2fd;color:#0d47a1;border-radius:50%;width:32px;height:32px;font-weight:700;cursor:pointer}
 .pen{display:none;margin-top:6px;padding:8px;background:#fffde7;border-left:4px solid #fbc02d}
 .chip{display:inline-block;margin:2px;padding:6px 12px;border:2px solid #1b5e20;border-radius:20px;background:#fff;cursor:pointer}
 .chip.on{background:#1b5e20;color:#fff}
</style>
<div class="box box-default"><div class="box-body">
 <input type="search" id="q" class="form-control input-lg" placeholder="Cari jenis sampah atau istilah… (mis. botol, kardus, bodong)">
 <div style="margin-top:8px"><span class="chip on" data-k="">Semua</span>@foreach($kategori as $k)<span class="chip" data-k="{{ $k }}">{{ $k }}</span>@endforeach</div>
</div></div>
<div class="row" id="grid">
@foreach($items as $i)
 <div class="col-xs-6 col-sm-4 col-md-3 kitem" style="margin-bottom:14px" data-k="{{ $i->kategori }}" data-t="{{ mb_strtolower($i->nama.' '.$i->kategori.' '.$i->deskripsi) }}">
  <div class="kc">
   @if($i->image)<img src="{{ filter_var($i->image, FILTER_VALIDATE_URL) ? $i->image : asset($i->image) }}" alt="{{ $i->nama }}" onerror="this.outerHTML='<div class=ph><i class=\'fa fa-recycle\'></i></div>'">@else<div class="ph"><i class="fa fa-recycle"></i></div>@endif
   <div class="b"><div style="display:flex;justify-content:space-between;align-items:start;gap:6px">
     <div><h4>{{ $i->nama }}</h4><small class="text-muted">{{ $i->kategori ?: 'Tanpa kategori' }}{{ $i->sumber=='BSU' ? ' · milik BSU Anda' : '' }}</small></div>
     <button type="button" class="info-i" aria-expanded="false" aria-label="Penjelasan {{ $i->nama }}" onclick="var p=this.parentNode.parentNode.querySelector('.pen');var o=p.style.display==='block';p.style.display=o?'none':'block';this.setAttribute('aria-expanded',!o)">ⓘ</button></div>
    <div class="pen">{{ $i->deskripsi ?: 'Belum ada penjelasan untuk jenis sampah ini.' }}</div></div>
  </div>
 </div>
@endforeach
</div>
@if(!count($items))<div class="callout callout-warning">Belum ada jenis sampah di kamus.</div>@endif

<div class="box box-warning" id="istilah-box"><div class="box-header"><h3 class="box-title"><i class="fa fa-language"></i> Istilah khusus</h3></div>
<div class="box-body"><dl id="istilah">
@foreach($istilah as $s)<div class="ist" data-t="{{ mb_strtolower($s->istilah.' '.$s->penjelasan) }}"><dt>{{ $s->istilah }}</dt><dd style="margin-bottom:10px">{{ $s->penjelasan }}</dd></div>@endforeach
@if(!count($istilah))<p class="text-muted">Belum ada istilah.</p>@endif
</dl></div></div>
@endsection
@push('bottom')
<script>
(function(){var q=document.getElementById('q'),kat='';
 function f(){var t=q.value.trim().toLowerCase();
  document.querySelectorAll('.kitem').forEach(function(e){e.style.display=(!t||e.dataset.t.indexOf(t)>-1)&&(!kat||e.dataset.k===kat)?'':'none';});
  document.querySelectorAll('.ist').forEach(function(e){e.style.display=(!t||e.dataset.t.indexOf(t)>-1)?'':'none';});}
 q.addEventListener('input',f);
 document.querySelectorAll('.chip').forEach(function(c){c.onclick=function(){document.querySelectorAll('.chip').forEach(function(x){x.classList.remove('on');});c.classList.add('on');kat=c.dataset.k;f();};});})();
</script>
@endpush
