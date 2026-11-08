@extends('layout.main')

@section('title', 'Daftar Akun | EcoBuana')

@section('content')
<main class="min-vh-100 d-flex flex-column justify-content-between" style="background: #ffffff; padding: 24px 20px 40px;">
    {{-- Top Bar / Back button --}}
    <div>
        <div class="d-flex align-items-center justify-content-between mb-3">
            <a href="{{ url('/') }}" class="text-decoration-none">
                <div style="width:38px; height:38px; background:#f1f5f9; border-radius:12px; display:flex; align-items:center; justify-content:center; color:#1e293b; transition:transform 0.2s;"
                     onmouseover="this.style.transform='scale(1.08)'"
                     onmouseout="this.style.transform='scale(1)'">
                    <i class="bi bi-arrow-left" style="font-size:18px;"></i>
                </div>
            </a>
            <span style="font-size:12px; color:#94a3b8; font-weight:600;">EcoBuana</span>
        </div>

        {{-- Brand Logo --}}
        <div class="text-center mb-3">
            <img src="{{ asset('images/logo.png') }}" alt="EcoBuana" style="max-width: 165px; width: 100%; height: auto; object-fit: contain;">
        </div>

        {{-- Heading --}}
        <div class="text-center mb-4">
            <h3 class="fw-bold m-0" style="color:#1a1a2e; font-size:22px; letter-spacing:-0.5px;">Daftar Akun Baru ✨</h3>
            <p class="mt-1 mb-0" style="color:#64748b; font-size:13px;">Bergabung menjadi nasabah untuk mulai menabung sampah</p>
        </div>

        {{-- Validation Errors --}}
        @if(isset($errors) && $errors->any())
            <div class="alert alert-danger rounded-4 py-2 px-3 mb-3" role="alert" style="background:#fee2e2; border:1px solid #fecaca; color:#b91c1c; font-size:13px;">
                <ul class="m-0 ps-3">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        {{-- Form Register --}}
        <form action="/register" method="post" class="mt-2">
            @csrf

            {{-- 1. Bank Sampah Unit (BSU) --}}
            <div class="mb-3">
                <label for="cms_user_id" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-building text-primary me-1"></i> Bank Sampah Unit (BSU)
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-geo-alt"></i>
                    </span>
                    <select class="form-select py-2 px-3" id="cms_user_id" name="cms_user_id" required
                            style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; font-size:13px; color:#1a1a2e;">
                        <option value="" disabled selected>Pilih Bank Sampah Unit terdekat</option>
                        @php
                            $grupBsu = $data_bsu->groupBy(function ($b) {
                                $kec = trim((string) $b->kecamatan); $kel = trim((string) $b->kelurahan);
                                return ($kec !== '' || $kel !== '') ? trim(($kec !== '' ? 'Kec. '.$kec : '').($kel !== '' ? ' — Kel. '.$kel : ''), ' —') : 'Lainnya';
                            })->sortKeys();
                        @endphp
                        @foreach($grupBsu as $wilayah => $daftarBsu)
                            <optgroup label="{{ $wilayah }}">
                            @foreach($daftarBsu->sortBy('name') as $bsu)
                                <option value="{{ $bsu->id }}" {{ old('cms_user_id') == $bsu->id ? 'selected' : '' }}>
                                    {{ $bsu->name }}
                                </option>
                            @endforeach
                            </optgroup>
                        @endforeach
                    </select>
                </div>
            </div>

            {{-- 2. Username --}}
            <div class="mb-3">
                <label for="username" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-person text-success me-1"></i> Username
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-person"></i>
                    </span>
                    <input type="text" class="form-control py-2 px-3" id="username" name="username"
                           value="{{ old('username') }}" placeholder="Contoh: rengga123" required
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; font-size:13px; color:#1a1a2e;">
                </div>
            </div>

            {{-- 3. Email --}}
            <div class="mb-3">
                <label for="email" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-envelope text-success me-1"></i> Email
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-envelope"></i>
                    </span>
                    <input type="email" class="form-control py-2 px-3" id="email" name="email"
                           value="{{ old('email') }}" placeholder="nama@email.com" required
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; font-size:13px; color:#1a1a2e;">
                </div>
            </div>

            {{-- 4. Password --}}
            <div class="mb-3">
                <label for="password" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-lock text-success me-1"></i> Password
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-key"></i>
                    </span>
                    <input type="password" class="form-control py-2 px-3" id="password" name="password"
                           placeholder="Minimal 6 karakter" required
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-right: none; font-size:13px; color:#1a1a2e;">
                    <button class="btn bg-white" type="button" id="togglePassword"
                            style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; color:#64748b;">
                        <i class="bi bi-eye" id="eyeIcon"></i>
                    </button>
                </div>
            </div>

            {{-- 5. Password Confirmation --}}
            <div class="mb-4">
                <label for="password_confirmation" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-shield-check text-success me-1"></i> Konfirmasi Password
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-shield-lock"></i>
                    </span>
                    <input type="password" class="form-control py-2 px-3" id="password_confirmation" name="password_confirmation"
                           placeholder="Ulangi password" required
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-right: none; font-size:13px; color:#1a1a2e;">
                    <button class="btn bg-white" type="button" id="toggleConfirmPassword"
                            style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; color:#64748b;">
                        <i class="bi bi-eye" id="eyeConfirmIcon"></i>
                    </button>
                </div>
            </div>

            {{-- Submit Button --}}
            <button type="submit" class="btn btn-primary-custom w-100 py-3 rounded-pill fw-bold text-center"
                    style="font-size:15px; box-shadow: 0 6px 18px rgba(0,160,86,0.28);">
                Daftar Sekarang <i class="bi bi-arrow-right ms-1"></i>
            </button>
        </form>
    </div>

    {{-- Bottom Link to Login --}}
    <div class="text-center pt-4">
        <p class="m-0" style="font-size:13px; color:#64748b;">
            Sudah punya akun?
            <a href="{{ url('login') }}" class="fw-bold text-decoration-none" style="color:#00a056;">
                Masuk Disini
            </a>
        </p>
    </div>
</main>
@endsection

@section('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Toggle Password
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.getElementById('eyeIcon');

    if (togglePassword && passwordInput && eyeIcon) {
        togglePassword.addEventListener('click', function() {
            const isPassword = passwordInput.getAttribute('type') === 'password';
            passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
            eyeIcon.classList.toggle('bi-eye', !isPassword);
            eyeIcon.classList.toggle('bi-eye-slash', isPassword);
        });
    }

    // Toggle Confirm Password
    const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
    const confirmInput = document.getElementById('password_confirmation');
    const eyeConfirmIcon = document.getElementById('eyeConfirmIcon');

    if (toggleConfirmPassword && confirmInput && eyeConfirmIcon) {
        toggleConfirmPassword.addEventListener('click', function() {
            const isPassword = confirmInput.getAttribute('type') === 'password';
            confirmInput.setAttribute('type', isPassword ? 'text' : 'password');
            eyeConfirmIcon.classList.toggle('bi-eye', !isPassword);
            eyeConfirmIcon.classList.toggle('bi-eye-slash', isPassword);
        });
    }
});
</script>
@endsection
