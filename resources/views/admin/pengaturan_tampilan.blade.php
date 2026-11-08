@extends('crudbooster::admin_template')
@section('content')
<div class="callout callout-info"><p>Atur ukuran huruf, ukuran ikon, dan warna agar nyaman dibaca. Pengaturan berlaku di seluruh halaman CMS dan tersimpan di peramban ini.</p></div>
<div id="a11y-full"></div>
@endsection
@push('bottom')
<script>window.A11Y_NO_WIDGET = true; A11Y.panel(document.getElementById('a11y-full'));</script>
@endpush
