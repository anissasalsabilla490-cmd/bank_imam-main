@extends('crudbooster::admin_template')
@section('content')
<div class="box box-warning">
  <div class="box-header with-border"><h3 class="box-title">Selesaikan manual: {{ $w->reference_id }}</h3></div>
  <form method="post" action="{{ CRUDBooster::mainpath('resolve-save') }}">
    {!! csrf_field() !!}
    <input type="hidden" name="id" value="{{ $w->id }}">
    <div class="box-body">
      <table class="table table-bordered">
        <tr><th style="width:200px">Nasabah</th><td>{{ optional($w->user)->username }}</td></tr>
        <tr><th>Tujuan</th><td>{{ $w->channelLabel() }} &middot; {{ $w->account_number }} a.n. {{ $w->account_name }}</td></tr>
        <tr><th>Nominal</th><td>Rp {{ number_format($w->amount, 0, ',', '.') }} (dikirim Rp {{ number_format($w->net_amount, 0, ',', '.') }})</td></tr>
        <tr><th>Status sekarang</th><td><b>{{ strtoupper($w->status) }}</b> &mdash; {{ $w->failure_reason }}</td></tr>
        <tr><th>ID Xendit</th><td>{{ $w->gateway_id ?: '-' }}</td></tr>
      </table>
      <div class="alert alert-danger">
        <b>Periksa dulu di Dashboard Xendit.</b> Pilih <i>Gagal</i> HANYA jika dana benar-benar tidak terkirim,
        karena saldo nasabah akan dikembalikan. Pilih <i>Berhasil</i> HANYA jika dana sudah diterima tujuan.
        Keputusan ini tidak dapat dibatalkan.
      </div>
      <div class="form-group">
        <label>Hasil</label><br>
        <label class="radio-inline"><input type="radio" name="result" value="success" required> Berhasil (dana sudah terkirim)</label>
        <label class="radio-inline"><input type="radio" name="result" value="failed" required> Gagal (kembalikan saldo)</label>
      </div>
      <div class="form-group">
        <label>Catatan (wajib, min. 5 karakter)</label>
        <input type="text" name="note" class="form-control" maxlength="200" required placeholder="mis. Terverifikasi di dashboard Xendit: payout disb-xxx FAILED">
      </div>
    </div>
    <div class="box-footer">
      <a href="{{ CRUDBooster::mainpath() }}" class="btn btn-default">Kembali</a>
      <button type="submit" class="btn btn-warning pull-right" onclick="return confirm('Keputusan ini final. Lanjutkan?')">Simpan keputusan</button>
    </div>
  </form>
</div>
@endsection
