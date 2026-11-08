@extends('layout.main')

@section('title', 'Login | EcoBuana')

@section('content')
<main class="min-vh-100 d-flex flex-column justify-content-between" style="background: #ffffff; padding: 24px 20px 40px;">
    {{-- Top Bar / Back button --}}
    <div>
        <div class="d-flex align-items-center justify-content-between mb-4">
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
        <div class="text-center mb-4">
            <img src="{{ asset('images/logo.png') }}" alt="EcoBuana" style="max-width: 175px; width: 100%; height: auto; object-fit: contain;">
        </div>

        {{-- Heading --}}
        <div class="text-center mb-4">
            <h3 class="fw-bold m-0" style="color:#1a1a2e; font-size:22px; letter-spacing:-0.5px;">Selamat Datang! 👋</h3>
            <p class="mt-1 mb-0" style="color:#64748b; font-size:13px;">Masuk ke akun Anda untuk mulai menabung sampah</p>
        </div>

        {{-- Alerts --}}
        @if(session()->has('success'))
            <div class="alert alert-success d-flex align-items-center gap-2 rounded-4 py-2 px-3 mb-3" role="alert" style="background:#dcfce7; border:1px solid #bbf7d0; color:#15803d; font-size:13px;">
                <i class="bi bi-check-circle-fill"></i>
                <div>{{ session('success') }}</div>
            </div>
        @endif

        @if(session()->has('loginError'))
            <div class="alert alert-danger d-flex align-items-center gap-2 rounded-4 py-2 px-3 mb-3" role="alert" style="background:#fee2e2; border:1px solid #fecaca; color:#b91c1c; font-size:13px;">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <div>{{ session('loginError') }}</div>
            </div>
        @endif

        @if(isset($errors) && $errors->any())
            <div class="alert alert-danger rounded-4 py-2 px-3 mb-3" role="alert" style="background:#fee2e2; border:1px solid #fecaca; color:#b91c1c; font-size:13px;">
                <ul class="m-0 ps-3">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        {{-- Form Login --}}
        <form action="/login" method="post" class="mt-2">
            @csrf

            {{-- Username Input --}}
            <div class="mb-3">
                <label for="username" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-person text-success me-1"></i> Username
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-person"></i>
                    </span>
                    <input type="text" class="form-control py-2 px-3" id="username" name="username"
                           value="{{ old('username') }}" placeholder="Masukkan username" required
                           autocomplete="username" autocapitalize="none"
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; font-size:13px; color:#1a1a2e;">
                </div>
            </div>

            {{-- Password Input --}}
            <div class="mb-3">
                <label for="password" class="form-label fw-bold mb-1" style="font-size:12px; color:#334155;">
                    <i class="bi bi-lock text-success me-1"></i> Password
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right: none; border-radius: 12px 0 0 12px; color:#64748b;">
                        <i class="bi bi-key"></i>
                    </span>
                    <input type="password" class="form-control py-2 px-3" id="password" name="password"
                           placeholder="Masukkan kata sandi" required
                           style="border: 1.5px solid #e2e8f0; border-left: none; border-right: none; font-size:13px; color:#1a1a2e;">
                    <button class="btn bg-white" type="button" id="togglePassword"
                            style="border: 1.5px solid #e2e8f0; border-left: none; border-radius: 0 12px 12px 0; color:#64748b;">
                        <i class="bi bi-eye" id="eyeIcon"></i>
                    </button>
                </div>
            </div>

            {{-- Remember Me & Forgot Password --}}
            <div class="d-flex align-items-center justify-content-between mb-4">
                <div class="form-check d-flex align-items-center gap-2">
                    <input class="form-check-input mt-0" type="checkbox" name="remember" id="checkbox" style="cursor: pointer; width:16px; height:16px;">
                    <label class="form-check-label" for="checkbox" style="font-size:12px; color:#64748b; cursor: pointer;">
                        Ingat saya
                    </label>
                </div>
                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal"
                   class="text-decoration-none fw-semibold" style="font-size:12px; color:#00a056; transition: color 0.2s;"
                   onmouseover="this.style.color='#007a41'" onmouseout="this.style.color='#00a056'">
                    Lupa Password?
                </a>
            </div>

            {{-- Submit Button --}}
            <button type="submit" class="btn btn-primary-custom w-100 py-3 rounded-pill fw-bold text-center"
                    style="font-size:15px; box-shadow: 0 6px 18px rgba(0,160,86,0.28);">
                Masuk Sekarang <i class="bi bi-arrow-right ms-1"></i>
            </button>
        </form>
    </div>

    {{-- Bottom Link to Register --}}
    <div class="text-center pt-4">
        <p class="m-0" style="font-size:13px; color:#64748b;">
            Belum punya akun?
            <a href="{{ url('register') }}" class="fw-bold text-decoration-none" style="color:#00a056;">
                Daftar Disini
            </a>
        </p>
    {{-- Modal Forgot Password --}}
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered px-3">
            <div class="modal-content rounded-4 border-0 shadow-lg p-3">
                <div class="modal-header border-0 pb-1">
                    <div>
                        <h5 class="modal-title fw-bold" id="forgotPasswordModalLabel" style="color:#1a1a2e; font-size:18px;">
                            <i class="bi bi-shield-lock text-success me-1"></i> Bantuan Lupa Password
                        </h5>
                        <p class="text-muted small mb-0" style="font-size:12px;">Pilih cara yang paling mudah untuk memulihkan akun Anda</p>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-2">
                    <style>
                        #pills-tab .nav-link {
                            color: #475569 !important;
                            background: transparent;
                            transition: all 0.2s ease;
                        }
                        #pills-tab .nav-link.active {
                            background-color: #00a056 !important;
                            color: #ffffff !important;
                            box-shadow: 0 4px 14px rgba(0, 160, 86, 0.28);
                        }
                        #pills-tab .nav-link.active i {
                            color: #ffffff !important;
                        }
                    </style>

                    <!-- Nav Tabs Opsi -->
                    <ul class="nav nav-pills nav-fill mb-3 p-1 rounded-3" style="background:#f1f5f9; font-size:12px;" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active fw-semibold py-2 rounded-3" id="pills-reset-tab" data-bs-toggle="pill" data-bs-target="#pills-reset" type="button" role="tab" style="font-size:12px;">
                                <i class="bi bi-arrow-repeat me-1 text-success"></i> Reset Mandiri
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link fw-semibold py-2 rounded-3" id="pills-wa-tab" data-bs-toggle="pill" data-bs-target="#pills-wa" type="button" role="tab" style="font-size:12px;">
                                <i class="bi bi-whatsapp me-1 text-success"></i> Hubungi Admin
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content" id="pills-tabContent">
                        <!-- OPSI 1: Reset Cepat Mandiri (Username + Email + Password Baru) -->
                        <div class="tab-pane fade show active" id="pills-reset" role="tabpanel">
                            <form action="{{ url('/forgot-password-direct') }}" method="POST" id="formResetPassword">
                                @csrf
                                <div class="mb-2">
                                    <label class="form-label fw-bold mb-1" style="font-size:11px; color:#475569;">Username Terdaftar</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right:none; border-radius:10px 0 0 10px; font-size:12px;">
                                            <i class="bi bi-person text-muted"></i>
                                        </span>
                                        <input type="text" name="username" class="form-control" placeholder="Masukkan username" required
                                               style="border: 1.5px solid #e2e8f0; border-left:none; border-radius:0 10px 10px 0; font-size:12px;">
                                    </div>
                                </div>

                                <div class="mb-2">
                                    <label class="form-label fw-bold mb-1" style="font-size:11px; color:#475569;">Email Terdaftar</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right:none; border-radius:10px 0 0 10px; font-size:12px;">
                                            <i class="bi bi-envelope text-muted"></i>
                                        </span>
                                        <input type="email" name="email" class="form-control" placeholder="nama@email.com" required
                                               style="border: 1.5px solid #e2e8f0; border-left:none; border-radius:0 10px 10px 0; font-size:12px;">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold mb-1" style="font-size:11px; color:#475569;">Password Baru</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white" style="border: 1.5px solid #e2e8f0; border-right:none; border-radius:10px 0 0 10px; font-size:12px;">
                                            <i class="bi bi-key text-muted"></i>
                                        </span>
                                        <input type="password" name="new_password" class="form-control" placeholder="Minimal 6 karakter" required minlength="6"
                                               style="border: 1.5px solid #e2e8f0; border-left:none; border-radius:0 10px 10px 0; font-size:12px;">
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold text-center" style="font-size:13px;">
                                    Perbarui Password
                                </button>
                            </form>
                        </div>

                        <!-- OPSI 2: Bantuan Admin BSU via WhatsApp -->
                        <div class="tab-pane fade" id="pills-wa" role="tabpanel">
                            <div class="p-3 rounded-3 text-center mb-3" style="background:#f0fdf4; border:1px dashed #86efac;">
                                <i class="bi bi-whatsapp text-success fs-1"></i>
                                <h6 class="fw-bold mt-2 mb-1" style="color:#166534; font-size:14px;">Bantuan Admin Bank Sampah</h6>
                                <p class="text-muted small mb-2" style="font-size:12px;">
                                    Pengurus BSU akan memverifikasi identitas Anda dan mereset kata sandi akun secara manual.
                                </p>
                                <span class="badge rounded-pill px-3 py-1" style="background:#dcfce7; color:#15803d; font-size:11px; font-weight:600; border:1px solid #bbf7d0;">
                                    <i class="bi bi-whatsapp me-1"></i> +62 813-4419-8794
                                </span>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold mb-1" style="font-size:11px; color:#475569;">Ketikkan Username Anda</label>
                                <input type="text" id="waUsernameInput" class="form-control" placeholder="Contoh: rengga123"
                                       style="border: 1.5px solid #e2e8f0; border-radius:10px; font-size:12px;">
                            </div>

                            <button type="button" id="btnHubungiWA" class="btn btn-success w-100 py-2 rounded-pill fw-bold d-flex align-items-center justify-content-center gap-2"
                                    style="background-color:#25D366; border-color:#25D366; font-size:13px;">
                                <i class="bi bi-whatsapp"></i> Chat WhatsApp Pengurus
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection

@section('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
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

    // Handler Tombol WhatsApp Lupa Password
    const btnHubungiWA = document.getElementById('btnHubungiWA');
    const waUsernameInput = document.getElementById('waUsernameInput');
    if (btnHubungiWA) {
        btnHubungiWA.addEventListener('click', function() {
            const username = waUsernameInput ? waUsernameInput.value.trim() : '';
            const phoneAdmin = '6281344198794'; // Nomor WA Admin: +62 813-4419-8794
            let text = 'Halo Admin EcoBuana, saya lupa kata sandi akun saya.';
            if (username) {
                text += ' Username saya adalah: *' + encodeURIComponent(username) + '*.';
            }
            text += ' Mohon bantuannya untuk reset akun. Terima kasih!';

            const waUrl = 'https://wa.me/' + phoneAdmin + '?text=' + encodeURI(text);
            window.open(waUrl, '_blank');
        });
    }
});
</script>
@endsection