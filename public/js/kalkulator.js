/* Kalkulator berat & nilai setoran. Menerima angka koma ("1,7", "1,7kg 2,5kg", "1,2+0,5").
   Kalkulator.pasang(elemen, {sampah:[{id,name,harga,poin,kategori}]}) — perlu js/berat.js.
   Pembulatan sama dengan server: berat 2 desimal, rupiah = round(berat*harga), poin = round(berat*poin). */
(function (w) {
  function esc(s) { return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) { return {'&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'}[c]; }); }

  function pasang(el, opt) {
    var sampah = (opt && opt.sampah) || [], B = w.Berat;
    el.classList.add('kalk');
    el.innerHTML =
      '<div class="kalk-kartu"><h4>Jumlahkan berat</h4>' +
      '<p class="kalk-ket">Ketik beberapa berat sekaligus, pakai koma untuk desimal. Contoh: <b>1,7kg 2,5kg</b> atau <b>1,7 + 2,5 + 3</b>. Satuan g/gr juga bisa (500g).</p>' +
      '<input type="text" class="kalk-cepat" inputmode="decimal" autocomplete="off" placeholder="mis. 1,7kg 2,5kg 0,8kg" aria-label="Berat yang dijumlahkan">' +
      '<div class="kalk-err kalk-cepat-err" role="alert"></div><div class="kalk-hasil kalk-cepat-hasil"></div></div>' +
      '<div class="kalk-kartu"><h4>Hitung nilai setoran</h4>' +
      '<p class="kalk-ket">Pilih jenis sampah, isi berat (boleh pakai koma). Rupiah dan poin dihitung otomatis.</p>' +
      (sampah.length ? '<div class="kalk-daftar"></div>' +
        '<p style="margin:10px 0 0"><button type="button" class="kalk-tombol kalk-tambah">+ Tambah jenis sampah</button> ' +
        '<button type="button" class="kalk-tombol kalk-reset">Bersihkan</button></p>' +
        '<div class="kalk-total"><span>Total berat<small class="kalk-t-kg">0 kg</small></span><span>Perkiraan saldo<small class="kalk-t-rp">Rp 0</small></span><span>Perkiraan poin<small class="kalk-t-poin">0</small></span></div>'
        : '<p class="kalk-ket">Belum ada jenis sampah yang terdaftar di unit Anda.</p>') + '</div>';

    // --- jumlahkan cepat ---
    var inp = el.querySelector('.kalk-cepat'), err = el.querySelector('.kalk-cepat-err'), hasil = el.querySelector('.kalk-cepat-hasil');
    inp.addEventListener('input', function () {
      var r = B.parse(inp.value);
      if (!r.ok) { err.textContent = r.pesan; hasil.textContent = ''; return; }
      err.textContent = r.dibulatkan ? 'Dibulatkan ke 2 angka di belakang koma.' : '';
      hasil.textContent = r.kosong ? '' : 'Total: ' + B.format(r.kg) + ' kg';
    });
    if (!sampah.length) return;

    // --- nilai setoran ---
    var daftar = el.querySelector('.kalk-daftar');
    function opsi() {
      var h = '<option value="">— pilih jenis —</option>', g = null;
      sampah.forEach(function (s) {
        var k = s.kategori || 'Lainnya';
        if (k !== g) { if (g !== null) h += '</optgroup>'; h += '<optgroup label="' + esc(k) + '">'; g = k; }
        h += '<option value="' + s.id + '">' + esc(s.name) + ' — ' + B.rupiah(s.harga) + '/kg</option>';
      });
      return h + (g !== null ? '</optgroup>' : '');
    }
    function tambah() {
      var d = document.createElement('div'); d.className = 'kalk-baris';
      d.innerHTML = '<select class="kalk-jenis" aria-label="Jenis sampah">' + opsi() + '</select>' +
        '<input type="text" class="kalk-berat" inputmode="decimal" autocomplete="off" placeholder="kg, mis. 1,7" aria-label="Berat (kg)">' +
        '<button type="button" class="kalk-hapus" aria-label="Hapus baris">✕</button>' +
        '<div class="kalk-nilai"></div><div class="kalk-err" role="alert" style="grid-column:1/-1"></div>';
      daftar.appendChild(d); hitung(); return d;
    }
    function hitung() {
      var kg = 0, rp = 0, pn = 0;
      [].forEach.call(daftar.querySelectorAll('.kalk-baris'), function (d) {
        var id = d.querySelector('.kalk-jenis').value, t = d.querySelector('.kalk-berat').value;
        var s = sampah.filter(function (x) { return String(x.id) === id; })[0];
        var r = B.parse(t), nilai = d.querySelector('.kalk-nilai'), e = d.querySelector('.kalk-err');
        e.textContent = r.ok ? '' : r.pesan; nilai.textContent = '';
        if (!r.ok || r.kosong) return;
        var r1 = Math.round(r.kg * s_harga(s)), p1 = Math.round(r.kg * s_poin(s));
        kg += r.kg;
        if (s) { rp += r1; pn += p1; nilai.textContent = B.format(r.kg) + ' kg × ' + B.rupiah(s.harga) + ' = ' + B.rupiah(r1) + ' · ' + p1 + ' poin'; }
        else { nilai.textContent = B.format(r.kg) + ' kg — pilih jenis sampah'; }
      });
      el.querySelector('.kalk-t-kg').textContent = B.format(kg) + ' kg';
      el.querySelector('.kalk-t-rp').textContent = B.rupiah(rp);
      el.querySelector('.kalk-t-poin').textContent = pn;
    }
    function s_harga(s) { return s ? +s.harga : 0; }
    function s_poin(s) { return s ? +s.poin : 0; }

    daftar.addEventListener('input', hitung); daftar.addEventListener('change', hitung);
    daftar.addEventListener('click', function (e) { var b = e.target.closest ? e.target.closest('.kalk-hapus') : null; if (b) { b.parentNode.remove(); hitung(); } });
    el.querySelector('.kalk-tambah').onclick = function () { tambah().querySelector('select').focus(); };
    el.querySelector('.kalk-reset').onclick = function () { daftar.innerHTML = ''; tambah(); inp.value = ''; err.textContent = ''; hasil.textContent = ''; };
    tambah();
  }
  w.Kalkulator = {pasang: pasang};
})(window);
