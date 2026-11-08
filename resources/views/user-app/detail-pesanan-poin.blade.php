@extends('layout.header-rewards')
@section('title', 'Detail Pesanan | EcoBuana')

@section('transaction-content')
@section('transaction-title', 'DETAIL PESANAN')
<main class="main-container" style="min-height: calc(100vh - 64px);">
    <div class="pt-3 mx-3">
        <p class="btn btn-outline-custom rounded-pill text-dark">
            ID #{{ $tukar_poin->id }}
        </p>
        <section>
            <div class="row d-flex align-items-center">
                <h6 class="fw-bold text-muted">
                    Reward Ditukarkan Oleh
                </h6>
                <div class="col">
                    <p class="mb-0 fw-bold">
                        {{ auth()->user()->username }}
                    </p>
                </div>
                <div class="col text-end">
                    <p class="mb-0 fw-bold">
                        {{ $tukar_poin->created_at }}
                    </p>
                </div>
            </div>
            @if( $tukar_poin->status == 'Diterima')
            <div class="row pt-2 d-flex align-items-center">
                <h6 class="fw-bold text-muted">
                    Diterima oleh
                </h6>
                <div class="col">
                    <p class="mb-0 fw-bold">
                        {{ $bsu->name }}
                    </p>
                </div>
                <div class="col text-end">
                    <p class="mb-0 fw-bold">
                        {{ $tukar_poin->updated_at }}
                    </p>
                </div>
            </div>
            @else
            @endif
            <hr>
        </section>
        <section>
            <h6 class="fw-bold text-muted">
                Jenis Reward
            </h6>
            <div class="row pt-1">
                <div class="col">
                    <p class="mb-0 fw-bold">
                        {{ $tukar_poin->reward->name }}
                    </p>
                </div>
                <div class="col text-end">
                    <p class="mb-0 fw-bold">
                        {{ $tukar_poin->description }}
                    </p>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <p class="mb-0 fw-bold">
                        Total Poin Penukaran
                    </p>
                </div>
                <div class="col text-end">
                    <p class="mb-0 fw-bold text-secondary">
                        {{ $tukar_poin->total_price }} Poin
                    </p>
                </div>
            </div>
            <hr>
        </section>
        <section>
            <div class="row">
                <div class="col">
                    <p class="mb-0 fw-bold">
                        Status
                    </p>
                </div>
                <div class="col text-end">
                    <p class="mb-0 fw-bold">
                       {{ $tukar_poin->status }}
                    </p>
                </div>
            </div>
            @if( $tukar_poin->status == 'Pending')
            <div class="text-center mt-3">
                <p class="mb-0 p-2 font-sm fw-bold text-white bg-dark rounded-3">
                    Pesanan anda sedang dalam pengecekan
                </p>
            </div>
            @elseif( $tukar_poin->status == 'On Proses' )
            <div class="text-center mt-3">
                <p class="mb-0 p-2 font-sm fw-bold text-white bg-primary rounded-3">
                    Pesanan anda telah diproses! anda dapat ke BSU pilihan untuk mengambil hadiah
                </p>
            </div>
            @else
            <div class="text-center mt-3">
                <p class="mb-0 p-2 font-sm fw-bold text-white bg-success rounded-3">
                    Pesanan telah selesai
                </p>
            </div>
            @endif
           
        </section>
    </div>
</main>
@endsection