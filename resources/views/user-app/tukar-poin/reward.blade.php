@extends('layout.header-to-rewards')

@section('title', 'Reward | EcoBuana')

@section('tukar-point-content')
{{-- HERO REWARD --}}
<div class="container my-4 px-4 ">
    <div class="px-1" style="padding-bottom: 100px;">
        <h5 class="fw-bold">Detail Barang</h5>
        <img class="w-100 rounded-3" style="height:300px" src="{{ url($reward->image) }}" alt="reward">
        <div class="row mt-3">
            <div class="col m-0 d-flex justify-content-between">
                <h5 class="fw-bold m-0">
                    {{ $reward->name }}
                </h5>
                <p class="fw-bold text-primary">
                    {{ $reward->price }} Poin
                </p>
            </div>
        </div>
        <div class="row">
            <p class="">
                {{ $reward->description }}
            </p>
        </div>
        <div class="row mx-4">
            <a class="btn btn-primary-custom rounded-pill fw-bold my-2 px-4 py-2"
                href="{{ url('/tukar-poin/reward/'.$reward->id.'/konfirmasi') }}">
                Tukarkan Poin <i class="bi bi-chevron-right"></i>
            </a>
        </div>
    </div>
</div>
{{-- NAVIGATION MENU --}} 
@include('layout.navigation')

@endsection