<?php

namespace App\Http\Controllers\UserApp;

use App\Models\User;
use App\Models\BSU;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    public function show()
    {
        $user = Auth::user();
        $list_bsu = BSU::unit()->get();
        $bsuName = $user->bsu ? $user->bsu->name : null;
        return view('user-app/profile',  [
            'user' => $user,
            'list_bsu' => $list_bsu,
            'bsu_name' => $bsuName
        ]);
    }

    public function update(Request $request)
    {
        $user = User::findOrFail(auth()->id());

        $request->validate([
            'username'     => ['nullable', 'string', 'max:50', Rule::unique('users')->ignore($user->id)],
            'email'        => ['nullable', 'email', 'max:100', Rule::unique('users')->ignore($user->id)],
            'phone_number' => ['nullable', 'string', 'max:20'],
            'address'      => ['nullable', 'string', 'max:500'],
            'picture'      => ['nullable', 'file', 'image', 'mimes:jpeg,png,jpg,webp', 'max:5120'], // Max 5MB
            'current_password' => ['nullable', 'required_with:new_password'],
            'new_password'     => ['nullable', 'string', 'min:6', 'confirmed'],
        ], [
            'username.unique' => 'Username ini sudah digunakan oleh nasabah lain.',
            'email.unique'    => 'Email ini sudah terdaftar di sistem.',
            'picture.image'   => 'Berkas yang diunggah harus berupa gambar.',
            'picture.mimes'   => 'Format foto yang diperbolehkan hanya JPG, JPEG, PNG, dan WEBP.',
            'picture.max'     => 'Ukuran foto maksimal 5 MB.',
            'current_password.required_with' => 'Kata sandi saat ini wajib diisi jika ingin mengganti kata sandi.',
            'new_password.min'               => 'Kata sandi baru minimal 6 karakter.',
            'new_password.confirmed'         => 'Konfirmasi kata sandi baru tidak sesuai.',
        ]);

        $user->username = $request->input('username') ?? $user->username;
        $user->email = $request->input('email') ?? $user->email;
        $user->address = $request->input('address') ?? $user->address;
        $user->phone_number = $request->input('phone_number') ?? $user->phone_number;

        // Secure handling of uploaded image:
        // 1. Never save raw user file to server's filesystem (prevents webshells/RCE)
        // 2. Decode pixels with GD (stripping any EXIF code, polyglots, or PHP shells)
        // 3. Normalize & compress dimensions (max 400x400)
        // 4. Store directly as safe Base64 Data URL into database (MEDIUMTEXT column)
        if ($request->hasFile('picture') && $request->file('picture')->isValid()) {
            $uploadedFile = $request->file('picture');

            // Layer 1: Verify with getimagesize
            $imageInfo = @getimagesize($uploadedFile->getRealPath());
            if ($imageInfo === false) {
                return redirect()->back()->withErrors(['picture' => 'Berkas gambar rusak atau tidak valid.'])->withInput();
            }

            // Layer 2: Decompress pixels with GD to neutralize any embedded scripts
            $fileContent = file_get_contents($uploadedFile->getRealPath());
            $srcImg = @imagecreatefromstring($fileContent);
            if (!$srcImg) {
                return redirect()->back()->withErrors(['picture' => 'Gagal memproses gambar.'])->withInput();
            }

            // Layer 3: Resize to avatar dimensions (max 400x400)
            $origWidth = imagesx($srcImg);
            $origHeight = imagesy($srcImg);
            $maxDim = 400;

            if ($origWidth > $maxDim || $origHeight > $maxDim) {
                if ($origWidth >= $origHeight) {
                    $newWidth = $maxDim;
                    $newHeight = (int) round(($origHeight / $origWidth) * $maxDim);
                } else {
                    $newHeight = $maxDim;
                    $newWidth = (int) round(($origWidth / $origHeight) * $maxDim);
                }
            } else {
                $newWidth = $origWidth;
                $newHeight = $origHeight;
            }

            $dstImg = imagecreatetruecolor($newWidth, $newHeight);

            // Handle transparency if PNG / WEBP
            imagealphablending($dstImg, false);
            imagesavealpha($dstImg, true);
            $transparent = imagecolorallocatealpha($dstImg, 255, 255, 255, 127);
            imagefilledrectangle($dstImg, 0, 0, $newWidth, $newHeight, $transparent);

            imagecopyresampled($dstImg, $srcImg, 0, 0, 0, 0, $newWidth, $newHeight, $origWidth, $origHeight);

            // Layer 4: Re-encode to clean JPEG
            ob_start();
            imagejpeg($dstImg, null, 85);
            $sanitizedData = ob_get_clean();

            imagedestroy($srcImg);
            imagedestroy($dstImg);

            // Layer 5: Store sanitized Data URL into database (no file on disk)
            $dataUri = 'data:image/jpeg;base64,' . base64_encode($sanitizedData);

            // Remove previous file from public disk if one existed
            if (!empty($user->picture) && strpos($user->picture, 'uploads/profile/') === 0 && file_exists(public_path($user->picture))) {
                @unlink(public_path($user->picture));
            }

            $user->picture = $dataUri;
        }

        // Handle Update Password
        $passwordChanged = false;
        if ($request->filled('new_password')) {
            if (!Hash::check($request->current_password, $user->password)) {
                return redirect()->back()
                    ->withErrors(['current_password' => 'Kata sandi saat ini yang Anda masukkan salah.'])
                    ->withInput();
            }
            $user->password = Hash::make($request->new_password);
            $passwordChanged = true;
        }

        $user->save();

        $successMsg = $passwordChanged
            ? 'Profil dan kata sandi berhasil diperbarui!'
            : 'Profil dan foto berhasil diperbarui!';

        return redirect()->back()->with('success', $successMsg);
    }
}
