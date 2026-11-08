@extends('crudbooster::admin_template')
@section('content')
<link rel="stylesheet" href="{{ asset('css/kalender.css') }}">
<p><a href="{{ CRUDBooster::mainpath() }}" class="btn btn-success"><i class="fa fa-plus"></i> Setoran massal</a></p>
<div class="row">
 <div class="col-md-4">
  <div class="box box-default"><div class="box-header"><h3 class="box-title">Pilih periode</h3></div><div class="box-body">
    <div id="kal"></div>
    <p style="margin-top:10px">
      <button type="button" class="btn btn-xs btn-default" data-p="hari">Hari ini</button>
      <button type="button" class="btn btn-xs btn-default" data-p="7">7 hari</button>
      <button type="button" class="btn btn-xs btn-default" data-p="bulan">Bulan ini</button>
    </p>
    <form method="get" id="f">
      <input type="hidden" name="dari" id="dari" value="{{ $dari }}"><input type="hidden" name="sampai" id="sampai" value="{{ $sampai }}">
      <label>Nama / HP nasabah</label><input type="text" name="q" value="{{ $q }}" class="form-control">
      <button class="btn btn-primary" style="margin-top:8px">Tampilkan</button>
      <a href="{{ CRUDBooster::mainpath('riwayat') }}" class="btn btn-default" style="margin-top:8px">Reset</a>
    </form>
  </div></div>
 </div>
 <div class="col-md-8">
  <div class="box box-success"><div class="box-header with-border">
    <h3 class="box-title">Riwayat setoran @if($dari) ({{ date('d/m/Y',strtotime($dari)) }} – {{ date('d/m/Y',strtotime($sampai ?: $dari)) }}) @endif</h3></div>
  <div class="box-body">
   <p class="ringkas"><b>{{ number_format($tot->n) }}</b> setoran · <b>{{ rtrim(rtrim(number_format($tot->kg,2,',','.'),'0'),',') }}</b> kg · saldo ditambahkan <b>Rp {{ number_format($tot->rp,0,',','.') }}</b> · poin <b>{{ number_format($tot->poin) }}</b></p>
   <div class="table-responsive"><table class="table table-striped table-bordered">
    <thead><tr><th>Tanggal</th><th>Nasabah</th><th>Jenis</th><th class="text-right">Kg</th><th class="text-right">Saldo +</th><th class="text-right">Poin</th></tr></thead><tbody>
    @forelse($rows as $r)
     <tr><td>{{ date('d/m/Y H:i',strtotime($r->created_at)) }}</td><td>{{ $r->username }}</td><td>{{ $r->sampah }}</td>
     <td class="text-right">{{ rtrim(rtrim(number_format($r->total_weight,2,',','.'),'0'),',') }}</td>
     <td class="text-right">Rp {{ number_format($r->total_income,0,',','.') }}</td><td class="text-right">{{ $r->point_received }}</td></tr>
    @empty<tr><td colspan="6" class="text-center text-muted">Tidak ada data pada periode ini.</td></tr>@endforelse
    </tbody></table></div>
   {{ $rows->links() }}
  </div></div>
 </div>
</div>
@endsection
@push('bottom')
<script src="{{ asset('js/kalender.js') }}"></script>
<script>
 var kal=Kalender.pasang(document.getElementById('kal'),{mode:'range',dari:@json($dari),sampai:@json($sampai),
   onPilih:function(d,s){document.getElementById('dari').value=d;document.getElementById('sampai').value=s;}});
 document.querySelectorAll('[data-p]').forEach(function(b){b.onclick=function(){
   var n=new Date(),d=new Date(),p=b.getAttribute('data-p');
   if(p==='7'){d.setDate(n.getDate()-6);} else if(p==='bulan'){d=new Date(n.getFullYear(),n.getMonth(),1);}
   var a=Kalender.fmt(d),z=Kalender.fmt(n); kal.set(a,z); document.getElementById('dari').value=a; document.getElementById('sampai').value=z; }});
</script>
@endpush
