@extends('layout.header-to-rewards')

@section('title', 'Tukar Saldo | EcoBuana')

@section('tukar-point-content')
<div class="px-3 pt-2" style="padding-bottom: 110px;">
    <div class="rounded-4 overflow-hidden p-4"
         style="background:#ffffff; box-shadow: 0 4px 20px rgba(0,0,0,0.07); border: 1px solid #f0f0f0;">
        
        <form id="nominalForm" action="{{ route('confirmReward', ['id' => $reward->id]) }}" method="POST">
            @csrf

            {{-- Section Title --}}
            <div class="d-flex align-items-center gap-2 mb-1">
                <div style="width:4px; height:18px; background:#00a056; border-radius:4px;"></div>
                <h6 class="fw-bold m-0" style="font-size:16px; color:#1a1a2e;">Pilih Nominal Penarikan</h6>
            </div>
            <p class="text-muted mb-3" style="font-size:12px;">
                Pilih salah satu nominal di bawah atau ketik nominal yang Anda inginkan.
            </p>

            {{-- Grid Pilihan Nominal --}}
            <div class="row g-2 mb-3">
                @php
                    $nominals = [5000, 10000, 25000, 50000, 75000, 100000, 150000, 200000];
                @endphp

                @foreach($nominals as $nom)
                @php
                    $isAffordable = ($saldo->total_saldo >= $nom);
                @endphp
                <div class="col-6">
                    <button type="button"
                            class="btn nominal-button w-100 py-3 px-2 d-flex flex-column align-items-center justify-content-center text-center position-relative"
                            data-nominal="{{ $nom }}"
                            style="min-height: 62px;">
                        <span class="nominal-amount fw-bold" style="font-size:15px; letter-spacing:-0.2px;">
                            Rp {{ number_format($nom, 0, ',', '.') }}
                        </span>
                        @if(!$isAffordable)
                            <span class="nominal-badge" style="font-size:10px; color:#ef4444; font-weight:600; margin-top:2px;">
                                Saldo kurang
                            </span>
                        @endif
                    </button>
                </div>
                @endforeach
            </div>

            {{-- Divider --}}
            <div class="d-flex align-items-center gap-2 my-3">
                <div class="flex-grow-1" style="height:1px; background:#e5e7eb;"></div>
                <span class="text-muted" style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:0.5px;">
                    Atau Masukkan Manual
                </span>
                <div class="flex-grow-1" style="height:1px; background:#e5e7eb;"></div>
            </div>

            {{-- Manual Nominal Input --}}
            <div class="mb-3">
                <label class="form-label fw-bold mb-1" style="font-size:12px; color:#4b5563;">
                    Nominal Kustom
                </label>
                <div class="input-group" style="border-radius:12px; overflow:hidden;">
                    <span class="input-group-text fw-bold"
                          style="background:#e6f7ef; color:#00a056; border:1.5px solid #e5e7eb; border-right:none; font-size:14px; padding:0 14px;">
                        Rp
                    </span>
                    <input type="text"
                           inputmode="numeric"
                           id="manual_nominal_display"
                           class="form-control fw-bold"
                           placeholder="0"
                           style="border:1.5px solid #e5e7eb; border-left:none; border-right:none; font-size:16px; color:#1a1a2e; padding:12px 10px;">
                    <button type="button"
                            id="btnMaxSaldo"
                            class="btn btn-light fw-bold"
                            style="background:#f0fdf4; color:#00a056; font-size:12px; border:1.5px solid #e5e7eb; border-left:none; padding:0 14px;">
                        Maksimal
                    </button>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-1 px-1">
                    <span style="font-size:11px; color:#9ca3af;">Min. Rp 5.000</span>
                    <span style="font-size:11px; color:#00a056; font-weight:600;">
                        Saldo: Rp {{ number_format($saldo->total_saldo, 0, ',', '.') }}
                    </span>
                </div>
            </div>

            {{-- Hidden Input untuk Dikirim ke Backend --}}
            <input type="hidden" name="selected_nominal" id="selected_nominal" value="">

            {{-- Live Calculation / Preview Box --}}
            <div class="rounded-3 p-3 my-3" style="background:#f9fafb; border: 1.5px dashed #e5e7eb;">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span style="font-size:12px; color:#6b7280; font-weight:500;">Nominal Ditarik:</span>
                    <span id="preview_nominal" class="fw-bold" style="font-size:14px; color:#1a1a2e;">Rp 0</span>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <span style="font-size:12px; color:#6b7280; font-weight:500;">Sisa Saldo:</span>
                    <span id="preview_sisa" class="fw-bold" style="font-size:14px; color:#00a056;">
                        Rp {{ number_format($saldo->total_saldo, 0, ',', '.') }}
                    </span>
                </div>
                <div id="saldo_warning" class="d-none mt-2 pt-2 border-top" style="font-size:11px; color:#ef4444; font-weight:600;">
                    <i class="bi bi-exclamation-circle-fill me-1"></i> Saldo Anda tidak mencukupi untuk nominal ini.
                </div>
            </div>

            {{-- Submit Button --}}
            <div class="mt-4">
                <button type="submit"
                        id="btnSubmit"
                        class="btn w-100 py-3 rounded-pill fw-bold text-white d-flex align-items-center justify-content-center gap-2"
                        style="background: linear-gradient(135deg, #00c96e 0%, #008744 100%); box-shadow: 0 6px 18px rgba(0,160,86,0.35); border:none; font-size:15px; letter-spacing:0.3px; transition:all 0.2s ease;"
                        onmouseover="this.style.transform='translateY(-2px)'"
                        onmouseout="this.style.transform='translateY(0)'">
                    <span>Tukarkan Saldo</span>
                    <i class="bi bi-arrow-right"></i>
                </button>
            </div>

        </form>
    </div>
</div>
@endsection

@section('style')
<style>
    .nominal-button {
        background: #ffffff;
        border: 1.5px solid #e5e7eb;
        border-radius: 12px;
        color: #1f2937;
        transition: all 0.2s ease;
        box-shadow: 0 1px 3px rgba(0,0,0,0.03);
    }
    .nominal-button:hover {
        border-color: #00a056;
        background: #f0fdf4;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 160, 86, 0.15);
    }
    .nominal-button.active {
        background: linear-gradient(135deg, #00c96e 0%, #008744 100%) !important;
        border-color: #008744 !important;
        color: #ffffff !important;
        box-shadow: 0 6px 16px rgba(0, 160, 86, 0.35) !important;
        transform: translateY(-2px);
    }
    .nominal-button.active .nominal-badge {
        color: #fef08a !important;
    }
    #manual_nominal_display:focus {
        border-color: #00a056 !important;
        box-shadow: none !important;
    }
</style>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const totalSaldo = {{ (int) $saldo->total_saldo }};
        const hiddenInput = document.getElementById('selected_nominal');
        const manualInput = document.getElementById('manual_nominal_display');
        const previewNominal = document.getElementById('preview_nominal');
        const previewSisa = document.getElementById('preview_sisa');
        const saldoWarning = document.getElementById('saldo_warning');
        const btnMax = document.getElementById('btnMaxSaldo');
        const nominalButtons = document.querySelectorAll('.nominal-button');

        function formatRupiah(num) {
            return 'Rp ' + Number(num).toLocaleString('id-ID');
        }

        function updatePreview(nominal) {
            const val = parseInt(nominal) || 0;
            previewNominal.textContent = formatRupiah(val);

            const sisa = totalSaldo - val;
            previewSisa.textContent = formatRupiah(sisa);

            if (sisa < 0) {
                previewSisa.style.color = '#ef4444';
                saldoWarning.classList.remove('d-none');
            } else {
                previewSisa.style.color = '#00a056';
                saldoWarning.classList.add('d-none');
            }
        }

        // Pilihan tombol nominal
        nominalButtons.forEach(button => {
            button.addEventListener('click', function () {
                nominalButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');

                const nominal = this.getAttribute('data-nominal');
                hiddenInput.value = nominal;
                manualInput.value = '';
                updatePreview(nominal);
            });
        });

        // Input manual
        manualInput.addEventListener('input', function () {
            nominalButtons.forEach(btn => btn.classList.remove('active'));

            const rawVal = this.value.replace(/[^0-9]/g, '');
            if (rawVal) {
                this.value = Number(rawVal).toLocaleString('id-ID');
                hiddenInput.value = rawVal;
                updatePreview(rawVal);
            } else {
                this.value = '';
                hiddenInput.value = '';
                updatePreview(0);
            }
        });

        // Tombol Maksimal
        btnMax.addEventListener('click', function () {
            nominalButtons.forEach(btn => btn.classList.remove('active'));
            manualInput.value = Number(totalSaldo).toLocaleString('id-ID');
            hiddenInput.value = totalSaldo;
            updatePreview(totalSaldo);
        });

        // Validasi Submit
        document.getElementById('nominalForm').addEventListener('submit', function (e) {
            const nominal = parseInt(hiddenInput.value) || 0;

            if (!nominal || nominal <= 0) {
                e.preventDefault();
                alert('Silakan pilih atau masukkan nominal penarikan terlebih dahulu.');
                return;
            }

            if (nominal > totalSaldo) {
                e.preventDefault();
                alert('Saldo Anda tidak mencukupi untuk melakukan penarikan sebesar ' + formatRupiah(nominal) + '.');
                return;
            }

            if (nominal < 5000) {
                e.preventDefault();
                alert('Minimal penarikan saldo adalah Rp 5.000.');
                return;
            }
        });
    });
</script>
@endsection
