@extends('layout.main')

@section('content')
<header class="navbar navbar-light bg-white text-dark sticky-top" style="max-width: 428px; width: 100%; border-bottom: 1px solid #f0f0f0; box-shadow: 0 2px 8px rgba(0,0,0,0.03);">
    {{-- Nav Header --}}
    <div class="container px-3">
        <div class="d-flex align-items-center w-100 py-2">
            @if(isset($reward) && $reward->category == 'uang')
                <a href="{{ url("/tukar-saldo/reward/{$reward->id}") }}" class="text-dark text-decoration-none me-3">
                    <div style="width:36px; height:36px; background:#f4f6f8; border-radius:10px; display:flex; align-items:center; justify-content:center; transition:background 0.2s;">
                        <i style="font-size: 1.1rem; color:#1a1a2e;" class="bi bi-arrow-left"></i>
                    </div>
                </a>
            @elseif(isset($reward))
                <a href="{{ url("/tukar-poin/reward/{$reward->id}") }}" class="text-dark text-decoration-none me-3">
                    <div style="width:36px; height:36px; background:#f4f6f8; border-radius:10px; display:flex; align-items:center; justify-content:center; transition:background 0.2s;">
                        <i style="font-size: 1.1rem; color:#1a1a2e;" class="bi bi-arrow-left"></i>
                    </div>
                </a>
            @else
                <a href="javascript:history.back()" class="text-dark text-decoration-none me-3">
                    <div style="width:36px; height:36px; background:#f4f6f8; border-radius:10px; display:flex; align-items:center; justify-content:center; transition:background 0.2s;">
                        <i style="font-size: 1.1rem; color:#1a1a2e;" class="bi bi-arrow-left"></i>
                    </div>
                </a>
            @endif
            <h6 class="fw-bold m-0" style="letter-spacing: 0.3px; font-size:16px; color:#1a1a2e;">
                @yield('transaction-title')
            </h6>
        </div>
    </div>
</header>
@yield('transaction-content')
@endsection
