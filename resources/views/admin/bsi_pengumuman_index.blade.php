@extends('crudbooster::admin_template')
@section('content')
<p><a href="{{ CRUDBooster::mainpath('kirim') }}" class="btn btn-success btn-lg"><i class="fa fa-paper-plane"></i> Kirim pengumuman baru</a></p>
<div class="box box-default"><div class="box-header"><h3 class="box-title">Pengumuman terkirim</h3></div>
<div class="box-body table-responsive"><table class="table table-striped table-bordered">
<thead><tr><th>Tanggal</th><th>Judul</th><th>Pengirim</th><th class="text-center">BSU tujuan</th><th class="text-center">Sudah dibaca</th><th></th></tr></thead><tbody>
@forelse($rows as $r)
<tr><td>{{ date('d/m/Y H:i', strtotime($r->created_at)) }}</td><td>{{ $r->judul }}</td><td>{{ $r->pengirim }}</td>
<td class="text-center">{{ $r->tujuan }}</td><td class="text-center">{{ $r->dibaca }} / {{ $r->tujuan }}</td>
<td><a class="btn btn-xs btn-info" href="{{ CRUDBooster::mainpath('rincian/'.$r->id) }}">Rincian</a></td></tr>
@empty<tr><td colspan="6" class="text-center text-muted">Belum ada pengumuman.</td></tr>@endforelse
</tbody></table>{{ $rows->links() }}</div></div>
@endsection
