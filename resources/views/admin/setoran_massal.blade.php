@extends('crudbooster::admin_template')
@section('content')
<style>
 #hasil-cari{position:absolute;z-index:50;background:#fff;border:2px solid #1b5e20;border-radius:8px;width:100%;max-height:300px;overflow:auto;display:none}
 #hasil-cari .it{padding:10px 12px;border-bottom:1px solid #eee;display:flex;justify-content:space-between;gap:8px;align-items:center}
 #hasil-cari .it:hover{background:#e8f5e9}
 #tb-setor input,#tb-setor select{min-width:110px}
 .ringkas{font-size:1.15em}
</style>
<p>
  <a href="{{ CRUDBooster::mainpath('riwayat') }}" class="btn btn-default"><i class="fa fa-history"></i> Riwayat setoran</a>
</p>
<div class="box box-success"><div class="box-header with-border"><h3 class="box-title">Catat setoran banyak sekaligus</h3></div>
<div class="box-body">
 <div class="row">
  <div class="col-sm-3"><label>Tanggal setoran</label>
    <input type="date" id="tgl" class="form-control" value="{{ $hariIni }}" max="{{ $hariIni }}"></div>
  <div class="col-sm-9" style="position:relative"><label>Cari nasabah (nama / no. HP / ID)</label>
    <input type="text" id="cari" class="form-control" placeholder="Ketik minimal 2 huruf, lalu pilih nasabah…" autocomplete="off">
    <div id="hasil-cari"></div></div>
 </div>
 <p class="text-muted" style="margin-top:8px">Pilih nasabah untuk menambah baris. Tekan <b>Enter</b> pada kolom berat untuk menambah baris nasabah yang sama. Berat boleh memakai <b>koma</b> (1,7) atau dijumlahkan langsung (1,2+0,5 atau 1,7kg 2,5kg). Tombol <b>Salin</b> mengisi jenis & berat dari setoran terakhir nasabah.</p>

 <div class="table-responsive"><table class="table table-bordered" id="tb-setor">
  <thead><tr><th>Nasabah</th><th>Jenis sampah</th><th style="width:130px">Berat (kg)</th><th class="text-right">Rupiah</th><th class="text-right">Poin</th><th></th></tr></thead>
  <tbody></tbody>
  <tfoot><tr><th colspan="2" class="text-right">Total</th><th id="t-kg">0</th><th class="text-right" id="t-rp">Rp 0</th><th class="text-right" id="t-poin">0</th><th></th></tr></tfoot>
 </table></div>
 <div id="pesan"></div>
</div>
<div class="box-footer">
 <button type="button" class="btn btn-default" id="btn-baris"><i class="fa fa-plus"></i> Tambah baris</button>
 <button type="button" class="btn btn-success btn-lg pull-right" id="btn-simpan"><i class="fa fa-save"></i> Simpan semua</button>
</div></div>
@endsection

@push('bottom')
<script src="{{ asset('js/berat.js') }}"></script>
<script>
(function(){
  var SAMPAH = @json($sampah);
  var CSRF = '{{ csrf_token() }}', URL = '{{ CRUDBooster::mainpath() }}';
  var tb = document.querySelector('#tb-setor tbody'), token = uid();
  function uid(){ return Date.now().toString(36)+Math.random().toString(36).slice(2,8); }
  function rp(n){ return 'Rp '+Math.round(n).toLocaleString('id-ID'); }
  function esc(s){ return String(s==null?'':s).replace(/[&<>"']/g,function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c];}); }

  function opsi(sel){
    var h='<option value="">— pilih jenis —</option>', grup=null;
    SAMPAH.forEach(function(s){
      var k=s.kategori||'Lainnya'; if(k!==grup){ if(grup!==null) h+='</optgroup>'; h+='<optgroup label="'+esc(k)+'">'; grup=k; }
      h+='<option value="'+s.id+'"'+(String(s.id)===String(sel)?' selected':'')+'>'+esc(s.name)+' — '+rp(s.harga)+'/kg</option>';
    });
    return h+(grup!==null?'</optgroup>':'');
  }
  function tambah(user, sampahId, berat){
    var tr=document.createElement('tr'); tr.setAttribute('data-user',user.id); tr.setAttribute('data-nama',user.nama);
    tr.innerHTML='<td><b>'+esc(user.nama)+'</b><br><small class="text-muted">'+esc(user.hp||'')+'</small></td>'+
      '<td><select class="form-control sj">'+opsi(sampahId)+'</select></td>'+
      '<td><input type="text" class="form-control br" inputmode="decimal" autocomplete="off" placeholder="mis. 1,7" value="'+(berat?Berat.format(berat):'')+'"><small class="text-danger gb"></small></td>'+
      '<td class="text-right rp">Rp 0</td><td class="text-right pn">0</td>'+
      '<td><button type="button" class="btn btn-danger btn-sm hapus" aria-label="Hapus baris"><i class="fa fa-trash"></i></button></td>';
    tb.appendChild(tr); hitung(); return tr;
  }
  function hitung(){
    var kg=0,rup=0,pn=0;
    tb.querySelectorAll('tr').forEach(function(tr){
      var s=SAMPAH.filter(function(x){return String(x.id)===tr.querySelector('.sj').value;})[0];
      var rb=Berat.parse(tr.querySelector('.br').value), b=rb.ok?rb.kg:0, r=s?Math.round(b*s.harga):0, p=s?Math.round(b*s.poin):0;
      tr.querySelector('.gb').textContent = rb.ok ? '' : rb.pesan;
      tr.querySelector('.rp').textContent=rp(r); tr.querySelector('.pn').textContent=p; kg+=b; rup+=r; pn+=p;
    });
    document.getElementById('t-kg').textContent=Berat.format(kg); document.getElementById('t-rp').textContent=rp(rup); document.getElementById('t-poin').textContent=pn;
  }
  tb.addEventListener('input',hitung); tb.addEventListener('change',hitung);
  tb.addEventListener('click',function(e){ var b=e.target.closest('.hapus'); if(b){ b.closest('tr').remove(); hitung(); }});
  tb.addEventListener('keydown',function(e){
    if(e.key==='Enter' && e.target.classList.contains('br')){
      e.preventDefault(); var tr=e.target.closest('tr');
      var n=tambah({id:tr.getAttribute('data-user'),nama:tr.getAttribute('data-nama')},'',''); n.querySelector('.sj').focus();
    }
  });
  document.getElementById('btn-baris').onclick=function(){
    var last=tb.lastElementChild; if(!last){ document.getElementById('cari').focus(); return; }
    var n=tambah({id:last.getAttribute('data-user'),nama:last.getAttribute('data-nama')},'',''); n.querySelector('.sj').focus();
  };

  var cari=document.getElementById('cari'), box=document.getElementById('hasil-cari'), tmr=null;
  cari.addEventListener('input',function(){
    clearTimeout(tmr); var q=cari.value.trim(); if(q.length<2){ box.style.display='none'; return; }
    tmr=setTimeout(function(){
      fetch(URL+'/cari-nasabah?q='+encodeURIComponent(q),{headers:{'Accept':'application/json'},credentials:'same-origin'}).then(function(r){return r.json();}).then(function(d){
        if(!d.length){ box.innerHTML='<div class="it text-muted">Tidak ditemukan</div>'; box.style.display='block'; return; }
        box.innerHTML=d.map(function(u){return '<div class="it" data-u=\''+esc(JSON.stringify(u))+'\'><span><b>'+esc(u.nama)+'</b> <small class="text-muted">'+esc(u.hp||'')+' · ID '+u.id+'</small></span>'+
          '<span><button type="button" class="btn btn-xs btn-success pilih">Tambah</button> <button type="button" class="btn btn-xs btn-info salin">Salin setoran terakhir</button></span></div>';}).join('');
        box.style.display='block';
      });
    },250);
  });
  box.addEventListener('click',function(e){
    var it=e.target.closest('.it'); if(!it||!it.getAttribute('data-u')) return; var u=JSON.parse(it.getAttribute('data-u'));
    if(e.target.closest('.salin')){
      fetch(URL+'/salin-terakhir?user_id='+u.id,{headers:{'Accept':'application/json'},credentials:'same-origin'}).then(function(r){return r.json();}).then(function(d){
        if(!d.baris.length){ alert('Nasabah ini belum punya setoran sebelumnya.'); tambah(u,'',''); }
        else { d.baris.forEach(function(b){ tambah(u,b.sampah_id,b.berat); }); }
        hitung();
      });
    } else { var tr=tambah(u,'',''); tr.querySelector('.sj').focus(); }
    box.style.display='none'; cari.value='';
  });
  document.addEventListener('click',function(e){ if(!box.contains(e.target)&&e.target!==cari) box.style.display='none'; });

  document.getElementById('btn-simpan').onclick=function(){
    var baris=[], rows=tb.querySelectorAll('tr'), pesan=document.getElementById('pesan'); pesan.innerHTML='';
    for(var i=0;i<rows.length;i++){
      var tr=rows[i], sj=tr.querySelector('.sj').value, pb=Berat.parse(tr.querySelector('.br').value), br=pb.ok?pb.kg:0;
      if(!pb.ok){ pesan.innerHTML='<div class="alert alert-warning">Baris '+(i+1)+' ('+esc(tr.getAttribute('data-nama'))+'): '+esc(pb.pesan)+'</div>'; return; }
      if(!sj||!(br>0)){ pesan.innerHTML='<div class="alert alert-warning">Baris '+(i+1)+' ('+esc(tr.getAttribute('data-nama'))+'): pilih jenis sampah dan isi berat.</div>'; return; }
      baris.push({user_id:tr.getAttribute('data-user'),sampah_id:sj,berat:String(br)});
    }
    if(!baris.length){ pesan.innerHTML='<div class="alert alert-warning">Belum ada baris. Cari dan pilih nasabah dulu.</div>'; return; }
    if(!confirm('Simpan '+baris.length+' baris setoran dengan total '+document.getElementById('t-rp').textContent+' ?')) return;
    var btn=this; btn.disabled=true;
    fetch(URL+'/simpan',{method:'POST',credentials:'same-origin',headers:{'Content-Type':'application/json','Accept':'application/json','X-CSRF-TOKEN':CSRF},
      body:JSON.stringify({tanggal:document.getElementById('tgl').value,baris:baris,token:token})})
    .then(function(r){return r.json().then(function(j){return {ok:r.ok,j:j};});})
    .then(function(x){
      btn.disabled=false;
      if(x.ok&&x.j.ok){ var h=x.j.hasil; tb.innerHTML=''; hitung(); token=uid();
        pesan.innerHTML='<div class="alert alert-success"><b>Tersimpan.</b> '+h.jumlah+' baris, '+h.total_berat+' kg, saldo nasabah bertambah '+rp(h.total_rupiah)+', poin '+h.total_poin+'.</div>'; }
      else { pesan.innerHTML='<div class="alert alert-danger">'+esc((x.j&&x.j.pesan)||'Gagal menyimpan.')+'</div>'; }
    }).catch(function(){ btn.disabled=false; pesan.innerHTML='<div class="alert alert-danger">Koneksi bermasalah. Data belum tersimpan; coba lagi.</div>'; });
  };
  window.addEventListener('beforeunload',function(e){ if(tb.children.length){ e.preventDefault(); e.returnValue=''; }});
})();
</script>
@endpush
