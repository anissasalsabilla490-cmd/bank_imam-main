<?php

namespace App\Http\Controllers\UserApp;

use App\Exceptions\WithdrawalException;
use App\Http\Controllers\Controller;
use App\Jobs\SendPayoutJob;
use App\Models\Saldo;
use App\Models\Withdrawal;
use App\Services\WithdrawalService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class WithdrawalController extends Controller
{
    private $service;

    public function __construct(WithdrawalService $service)
    {
        $this->service = $service;
    }

    /** Form pengajuan */
    public function index()
    {
        $user = auth()->user();
        $last = Withdrawal::where('user_id', $user->id)->where('status', '!=', Withdrawal::FAILED)->latest('id')->first();

        return view('user-app.tarik-saldo.index', [
            'saldo'    => Saldo::where('user_id', $user->id)->first(),
            'channels' => config('withdrawal.channels'),
            'last'     => $last,
            'enabled'  => $this->service->available(),
        ]);
    }

    /** Halaman konfirmasi (belum memotong saldo) */
    public function confirm(Request $request)
    {
        $data = $this->validated($request);
        if ($data instanceof \Illuminate\Http\RedirectResponse) {
            return $data;
        }

        $channel = config('withdrawal.channels.' . $data['channel_code']);
        $fee = (int) config('withdrawal.fee.' . $channel['type'], 0);
        $saldo = Saldo::where('user_id', auth()->id())->first();
        $balance = $saldo ? (int) $saldo->total_saldo : 0;

        $token = Str::random(40);
        session()->put('withdrawal_token', $token);

        return view('user-app.tarik-saldo.konfirmasi', [
            'data'    => $data,
            'channel' => $channel,
            'fee'     => $fee,
            'balance' => $balance,
            'token'   => $token,
        ]);
    }

    /** Eksekusi: potong saldo lalu antrikan pengiriman */
    public function store(Request $request)
    {
        $expected = session()->pull('withdrawal_token');
        $given = (string) $request->input('submit_token');
        if (!$expected || !hash_equals($expected, $given)) {
            // Klik ganda / halaman lama: jangan buat pengajuan baru.
            return redirect()->route('tarikSaldo.riwayat')
                ->with('error', 'Pengajuan ini sudah diproses atau sesinya berakhir. Cek riwayat penarikan Anda.');
        }

        $data = $this->validated($request);
        if ($data instanceof \Illuminate\Http\RedirectResponse) {
            return $data;
        }

        try {
            $w = $this->service->create(auth()->user(), $data, $request->ip());
        } catch (WithdrawalException $e) {
            return redirect()->route('tarikSaldo.index')->withInput()->with('error', $e->getMessage());
        }

        try {
            SendPayoutJob::dispatch($w->id);
        } catch (\Throwable $e) {
            // Saldo sudah tercatat; withdrawal tetap "pending" dan akan dikirim ulang oleh withdrawals:reconcile.
            Log::error('Gagal mengantrikan SendPayoutJob', ['withdrawal' => $w->id, 'error' => $e->getMessage()]);
        }

        return redirect()->route('tarikSaldo.show', $w->id);
    }

    public function show($id)
    {
        $w = Withdrawal::where('id', $id)->where('user_id', auth()->id())->firstOrFail();
        return view('user-app.tarik-saldo.status', ['w' => $w]);
    }

    /** Dipakai halaman status untuk polling ringan */
    public function status($id)
    {
        $w = Withdrawal::where('id', $id)->where('user_id', auth()->id())->firstOrFail();
        return response()->json(['status' => $w->status, 'label' => $w->statusLabel(), 'final' => $w->isFinal()]);
    }

    public function riwayat()
    {
        $items = Withdrawal::where('user_id', auth()->id())->latest('id')->paginate(15);
        return view('user-app.tarik-saldo.riwayat', ['items' => $items]);
    }

    /**
     * Validasi input + normalisasi nomor tujuan.
     * Mengembalikan array data bersih, atau RedirectResponse bila tidak valid.
     */
    private function validated(Request $request)
    {
        $channels = config('withdrawal.channels');

        $v = Validator::make($request->all(), [
            'channel_code'   => 'required|in:' . implode(',', array_keys($channels)),
            'account_number' => 'required|string|max:30',
            'account_name'   => ['required', 'string', 'min:3', 'max:60', 'regex:/^[\pL\s\.\'\-]+$/u'],
            'amount'         => 'required|integer|min:1',
        ], [
            'channel_code.required'   => 'Pilih tujuan penarikan.',
            'channel_code.in'         => 'Tujuan penarikan tidak didukung.',
            'account_number.required' => 'Nomor tujuan wajib diisi.',
            'account_name.required'   => 'Nama pemilik rekening/akun wajib diisi.',
            'account_name.regex'      => 'Nama hanya boleh berisi huruf, spasi, titik, apostrof, dan tanda hubung.',
            'amount.required'         => 'Nominal wajib diisi.',
            'amount.integer'          => 'Nominal harus berupa angka bulat.',
        ]);

        $v->after(function ($validator) use ($request, $channels) {
            $code = $request->input('channel_code');
            if (!isset($channels[$code])) {
                return;
            }
            $number = preg_replace('/[\s\-]/', '', (string) $request->input('account_number'));
            if ($channels[$code]['type'] === 'ewallet') {
                if (!preg_match('/^(\+62|62|0)8[0-9]{8,12}$/', $number)) {
                    $validator->errors()->add('account_number', 'Nomor e-wallet tidak valid (contoh: 081234567890).');
                }
            } elseif (!preg_match('/^[0-9]{6,20}$/', $number)) {
                $validator->errors()->add('account_number', 'Nomor rekening harus berupa 6-20 digit angka.');
            }
        });

        if ($v->fails()) {
            return redirect()->route('tarikSaldo.index')->withErrors($v)->withInput();
        }

        $data = $v->validated();
        $number = preg_replace('/[\s\-]/', '', $data['account_number']);
        if ($channels[$data['channel_code']]['type'] === 'ewallet') {
            $number = preg_replace('/^(\+62|62)/', '0', $number); // Xendit: format 08xxxxxxxxxx
        }
        $data['account_number'] = $number;
        $data['account_name'] = trim(preg_replace('/\s+/', ' ', $data['account_name']));
        $data['amount'] = (int) $data['amount'];

        return $data;
    }
}
