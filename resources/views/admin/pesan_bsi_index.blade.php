@extends('crudbooster::admin_template')
@section('content')
<div class="box box-default"><div class="box-header"><h3 class="box-title">Pengumuman dari BSI</h3></div>
<div class="box-body table-responsive"><table class="table table-striped table-bordered">
<thead><tr><th>Tanggal</th><th>Judul</th><th>Dari</th><th>Status</th><th></th></tr></thead><tbody>
@forelse($rows as $r)
<tr style="{{ $r->dibaca_at ? '' : 'font-weight:bold;background:#fffde7' }}"><td>{{ date('d/m/Y H:i', strtotime($r->created_at)) }}</td><td>{{ $r->judul }}</td><td>{{ $r->pengirim }}</td>
<td>{!! $r->dibaca_at ? '<span class="label label-default">Dibaca</span>' : '<span class="label label-warning">Baru</span>' !!}</td>
<td><a class="btn btn-xs btn-primary" href="{{ CRUDBooster::mainpath('baca/'.$r->id) }}">Buka</a></td></tr>
@empty<tr><td colspan="5" class="text-center text-muted">Belum ada pengumuman dari BSI.</td></tr>@endforelse
</tbody></table>{{ $rows->links() }}</div></div>
@endsection
