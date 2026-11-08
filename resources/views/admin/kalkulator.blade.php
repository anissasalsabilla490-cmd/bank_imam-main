@extends('crudbooster::admin_template')
@section('content')
<link rel="stylesheet" href="{{ asset('css/kalkulator.css') }}">
<div class="callout callout-info"><p>Kalkulator ini membantu menghitung berat dan nilai setoran. <b>Boleh memakai koma</b>: 1,7 atau 1,7kg 2,5kg. Hasilnya hanya perkiraan; pencatatan resmi dilakukan lewat <a href="{{ CRUDBooster::adminPath('setoran_massal') }}">Setoran Massal</a>.</p></div>
<div id="kalk"></div>
@endsection
@push('bottom')
<script src="{{ asset('js/berat.js') }}"></script>
<script src="{{ asset('js/kalkulator.js') }}"></script>
<script>Kalkulator.pasang(document.getElementById('kalk'), {sampah: @json($sampah)});</script>
@endpush
