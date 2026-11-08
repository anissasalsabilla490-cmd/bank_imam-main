@extends('crudbooster::admin_template')
@section('content')
    @foreach($transactions as $data)
        <h2>{{ $data->total_weight }}</h2> 
    @endforeach

@endsection