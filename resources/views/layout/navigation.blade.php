@php
    $isBeranda = Request::is('dashboard*') || Request::is('home*');
    $isRewards = Request::is('tukar-poin*') || Request::is('tukar-saldo*') || Request::is('tukarPoin*') || Request::is('tukarSaldo*') || Request::is('reward*');
    $isKatalog = Request::is('kategori-sampah*') || Request::is('sampah*');
    $isEdukasi = Request::is('edukasi*') || Request::is('educational-news*');
    $isProfil  = Request::is('settings*') || Request::is('profile*') || Request::is('history*') || Request::is('transaction*') || Request::is('nasabah/panduan*');
@endphp

{{-- ======================== MODERN BOTTOM NAVIGATION ======================== --}}
<nav class="navigation-menu" aria-label="Menu Navigasi Utama">
    <div class="bottom-nav-container">
        {{-- 1. Beranda --}}
        <a class="bottom-nav-item {{ $isBeranda ? 'active' : '' }}" href="{{ url('/dashboard') }}">
            <div class="nav-icon-wrapper">
                <i class="bi bi-house{{ $isBeranda ? '-fill' : '' }}"></i>
            </div>
            <span class="nav-label">Beranda</span>
        </a>

        {{-- 2. Rewards --}}
        <a class="bottom-nav-item {{ $isRewards ? 'active' : '' }}" href="{{ url('/tukar-poin') }}">
            <div class="nav-icon-wrapper">
                <i class="bi bi-gift{{ $isRewards ? '-fill' : '' }}"></i>
            </div>
            <span class="nav-label">Rewards</span>
        </a>

        {{-- 3. Katalog --}}
        <a class="bottom-nav-item {{ $isKatalog ? 'active' : '' }}" href="{{ url('/kategori-sampah') }}">
            <div class="nav-icon-wrapper">
                <i class="bi bi-trash{{ $isKatalog ? '-fill' : '' }}"></i>
            </div>
            <span class="nav-label">Katalog</span>
        </a>

        {{-- 4. Edukasi --}}
        <a class="bottom-nav-item {{ $isEdukasi ? 'active' : '' }}" href="{{ url('/edukasi') }}">
            <div class="nav-icon-wrapper">
                <i class="bi bi-book{{ $isEdukasi ? '-fill' : '' }}"></i>
            </div>
            <span class="nav-label">Edukasi</span>
        </a>

        {{-- 5. Profil --}}
        <a class="bottom-nav-item {{ $isProfil ? 'active' : '' }}" href="{{ url('/settings') }}">
            <div class="nav-icon-wrapper">
                <i class="bi bi-person{{ $isProfil ? '-fill' : '' }}"></i>
            </div>
            <span class="nav-label">Profil</span>
        </a>
    </div>
</nav>

<style>
    /* ==========================================
       BOTTOM NAVIGATION COMPONENT
       ========================================== */
    .navigation-menu {
        position: fixed;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 100%;
        max-width: 428px;
        background: rgba(255, 255, 255, 0.98);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border-top: 1px solid rgba(0, 0, 0, 0.06);
        border-radius: 22px 22px 0 0;
        box-shadow: 0 -4px 25px rgba(0, 0, 0, 0.08), 0 -1px 3px rgba(0, 0, 0, 0.02);
        z-index: 1050;
        padding: 6px 4px calc(6px + env(safe-area-inset-bottom, 0px)) 4px;
        margin: 0;
        box-sizing: border-box;
    }

    .bottom-nav-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        margin: 0;
        padding: 0;
        height: 56px;
    }

    .bottom-nav-item {
        flex: 1 1 0;
        max-width: 20%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-decoration: none !important;
        color: #64748b;
        padding: 4px 1px 2px 1px;
        border-radius: 14px;
        transition: all 0.22s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        -webkit-tap-highlight-color: transparent;
        user-select: none;
    }

    .bottom-nav-item .nav-icon-wrapper {
        width: 44px;
        height: 28px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 14px;
        transition: all 0.22s ease;
        margin-bottom: 2px;
        background: transparent;
    }

    .bottom-nav-item .nav-icon-wrapper i {
        font-size: 1.28rem;
        line-height: 1;
        color: #64748b;
        transition: all 0.22s ease;
    }

    .bottom-nav-item .nav-label {
        font-size: 10.5px;
        line-height: 1.2;
        font-weight: 500;
        color: #64748b;
        margin: 0;
        padding: 0;
        text-align: center;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        width: 100%;
        letter-spacing: -0.1px;
        transition: all 0.22s ease;
    }

    /* Hover / Tap state */
    .bottom-nav-item:hover .nav-icon-wrapper i,
    .bottom-nav-item:hover .nav-label {
        color: #00a056;
    }

    /* Active item styling */
    .bottom-nav-item.active .nav-icon-wrapper {
        background: linear-gradient(135deg, rgba(0, 201, 110, 0.18) 0%, rgba(0, 135, 68, 0.12) 100%);
        transform: translateY(-1px);
    }

    .bottom-nav-item.active .nav-icon-wrapper i {
        color: #008744 !important;
    }

    .bottom-nav-item.active .nav-label {
        color: #008744 !important;
        font-weight: 700;
    }

    /* Micro dot indicator underneath active tab */
    .bottom-nav-item.active::after {
        content: '';
        position: absolute;
        bottom: -2px;
        width: 4px;
        height: 4px;
        background: #008744;
        border-radius: 50%;
        box-shadow: 0 0 6px rgba(0, 135, 68, 0.5);
    }
</style>

<script>
    (function () {
        let isNavigating = false;

        document.addEventListener('DOMContentLoaded', function () {
            const navItems = document.querySelectorAll('.bottom-nav-item');
            const navMenu = document.querySelector('.navigation-menu');

            navItems.forEach(function (item) {
                item.addEventListener('click', function (e) {
                    // 1. Mencegah request ulang jika tab yang diklik sudah aktif saat ini
                    if (this.classList.contains('active')) {
                        e.preventDefault();
                        e.stopPropagation();
                        return false;
                    }

                    // 2. Mencegah spam klik bertubi-tubi saat request navigasi sedang diproses
                    if (isNavigating) {
                        e.preventDefault();
                        e.stopPropagation();
                        return false;
                    }

                    // Kunci navigasi & beri indikator visual halus
                    isNavigating = true;
                    if (navMenu) {
                        navMenu.style.pointerEvents = 'none';
                    }
                    this.style.opacity = '0.7';
                });
            });

            // Pulihkan status navigasi jika halaman dibuka dari bfcache browser (misal tombol Back)
            window.addEventListener('pageshow', function () {
                isNavigating = false;
                if (navMenu) {
                    navMenu.style.pointerEvents = 'auto';
                }
                navItems.forEach(function (item) {
                    item.style.opacity = '1';
                });
            });
        });
    })();
</script>
