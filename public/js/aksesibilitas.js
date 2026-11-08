/* Aksesibilitas: ukuran huruf (4 tingkat), ukuran ikon (4 tingkat), warna (preset + kustom).
   Disimpan di browser (localStorage). Panel pengaturan: A11Y.panel(elemen).
   Ukuran diterapkan dengan menskalakan ukuran huruf tiap elemen (hierarki tulisan tetap terjaga). */
(function (w) {
  var KEY = 'a11y_pref_v2';
  var TEKS = {kecil: 0.85, sedang: 1, besar: 1.3, sangat: 1.7};
  var IKON = {kecil: 0.85, sedang: 1, besar: 1.45, sangat: 1.9};
  var NAMA = {kecil: 'Kecil', sedang: 'Sedang', besar: 'Besar', sangat: 'Sangat Besar'};
  var PRESET = {
    kontras: {nama: 'Kontras Tinggi', teks: '#000000', latar: '#ffffff', aksen: '#003399', tautan: '#0033cc'},
    gelap:   {nama: 'Mode Gelap',     teks: '#ffffff', latar: '#000000', aksen: '#ffd400', tautan: '#66b3ff'},
    kuning:  {nama: 'Kuning di Hitam', teks: '#ffe600', latar: '#000000', aksen: '#ffe600', tautan: '#ffffff'}
  };
  var STANDAR = {ukuran: 'sedang', ikon: 'sedang', tema: 'normal', kustom: {teks: '#1a1a1a', latar: '#ffffff', aksen: '#0b6b3a', tautan: '#0645ad'}};
  var root = document.documentElement, pref = muat(), timer = null, sibuk = false;

  function salin(o) { return JSON.parse(JSON.stringify(o)); }
  function muat() {
    var p = salin(STANDAR);
    try {
      var s = JSON.parse(localStorage.getItem(KEY) || 'null');
      if (s) {
        if (TEKS[s.ukuran]) p.ukuran = s.ukuran;
        if (IKON[s.ikon]) p.ikon = s.ikon;
        if (s.tema === 'normal' || s.tema === 'kustom' || PRESET[s.tema]) p.tema = s.tema;
        if (s.kustom) for (var k in p.kustom) { if (/^#[0-9a-f]{6}$/i.test(s.kustom[k] || '')) p.kustom[k] = s.kustom[k]; }
      } else { // migrasi dari versi lama
        var o = JSON.parse(localStorage.getItem('a11y_pref') || 'null');
        if (o) { if (TEKS[o.ukuran]) p.ukuran = o.ukuran; if (o.ikon === 'besar') p.ikon = 'besar'; if (o.kontras === 'tinggi') p.tema = 'kontras'; }
      }
    } catch (e) {}
    return p;
  }
  function simpan() { try { localStorage.setItem(KEY, JSON.stringify(pref)); } catch (e) {} }

  // ---------- warna ----------
  function warna() { return pref.tema === 'kustom' ? pref.kustom : (PRESET[pref.tema] || null); }
  function lum(hex) {
    var c = [1, 3, 5].map(function (i) { var v = parseInt(hex.substr(i, 2), 16) / 255; return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4); });
    return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2];
  }
  function rasio(a, b) { var x = lum(a), y = lum(b); return (Math.max(x, y) + 0.05) / (Math.min(x, y) + 0.05); }
  function terapkanWarna() {
    var c = warna();
    if (!c) {
      root.removeAttribute('data-tema');
      ['--a-teks', '--a-latar', '--a-aksen', '--a-aksen-teks', '--a-tautan'].forEach(function (v) { root.style.removeProperty(v); });
      return;
    }
    root.setAttribute('data-tema', 'aktif');
    root.style.setProperty('--a-teks', c.teks); root.style.setProperty('--a-latar', c.latar);
    root.style.setProperty('--a-aksen', c.aksen); root.style.setProperty('--a-tautan', c.tautan);
    root.style.setProperty('--a-aksen-teks', lum(c.aksen) > 0.4 ? '#000000' : '#ffffff');
  }

  // ---------- ukuran ----------
  var IKON_SEL = '.bi,.fa,.fas,.far,.fab,.glyphicon,.ion,[class^="bi-"],[class*=" bi-"],[class^="fa-"],[class*=" fa-"],[class^="ion-"],[class*=" ion-"]';
  function lewati(e) { var t = e.tagName; return t === 'SCRIPT' || t === 'STYLE' || t === 'LINK' || t === 'META' || t === 'NOSCRIPT' || t === 'BR' || e.id === 'a11y-toggle' || e.hasAttribute('data-skip'); }
  function skala() {
    sibuk = true;
    var els = [].slice.call(document.body.querySelectorAll('*')).filter(function (e) { return !lewati(e); });
    // 1) kembalikan gaya asli
    els.forEach(function (e) { if (e.hasAttribute('data-a11y-fs')) { e.style.fontSize = e.getAttribute('data-a11y-fs'); e.removeAttribute('data-a11y-fs'); } });
    if (pref.ukuran !== 'sedang' || pref.ikon !== 'sedang') {
      // 2) baca ukuran asli (satu putaran baca) lalu 3) tulis (satu putaran tulis)
      var asli = els.map(function (e) { return parseFloat(getComputedStyle(e).fontSize) || 0; });
      var ikon = els.map(function (e) { return e.matches(IKON_SEL); });
      els.forEach(function (e, i) {
        if (!asli[i]) return;
        e.setAttribute('data-a11y-fs', e.style.fontSize || '');
        e.style.fontSize = (asli[i] * (ikon[i] ? IKON[pref.ikon] : TEKS[pref.ukuran])).toFixed(2) + 'px';
      });
    }
    setTimeout(function () { sibuk = false; }, 0);
  }
  function jadwalSkala() { clearTimeout(timer); timer = setTimeout(skala, 250); }

  function terapkan() {
    terapkanWarna();
    if (document.body) skala();
    simpan();
  }

  // ---------- panel pengaturan ----------
  function btn(grup, nilai, label, extra) {
    var on = pref[grup] === nilai;
    return '<button type="button" class="a11y-opt' + (on ? ' on' : '') + '" data-g="' + grup + '" data-v="' + nilai + '" aria-pressed="' + on + '">' + (extra || '') + label + '</button>';
  }
  function panel(el) {
    function gambar() {
      var h = '<div class="a11y-kartu"><b>Ukuran huruf</b><div class="a11y-baris">' +
        ['kecil', 'sedang', 'besar', 'sangat'].map(function (k) { return btn('ukuran', k, NAMA[k], '<span class="a11y-contoh" data-skip style="font-size:' + (12 * TEKS[k]).toFixed(0) + 'px">A</span>'); }).join('') + '</div></div>' +
        '<div class="a11y-kartu"><b>Ukuran ikon</b><div class="a11y-baris">' +
        ['kecil', 'sedang', 'besar', 'sangat'].map(function (k) { return btn('ikon', k, NAMA[k], '<span class="a11y-contoh" data-skip style="font-size:' + (14 * IKON[k]).toFixed(0) + 'px">●</span>'); }).join('') + '</div></div>' +
        '<div class="a11y-kartu"><b>Warna tampilan</b><div class="a11y-baris">' +
        btn('tema', 'normal', 'Standar') + Object.keys(PRESET).map(function (k) { return btn('tema', k, PRESET[k].nama); }).join('') + btn('tema', 'kustom', 'Warna sendiri') + '</div>';
      if (pref.tema === 'kustom') {
        var c = pref.kustom;
        h += '<p class="a11y-ket">Pilih warna sendiri. Awali dari: <button type="button" class="a11y-mini" data-salin="kontras">Kontras Tinggi</button> <button type="button" class="a11y-mini" data-salin="gelap">Gelap</button> <button type="button" class="a11y-mini" data-salin="kuning">Kuning di Hitam</button></p><div class="a11y-warna">' +
          [['teks', 'Warna tulisan'], ['latar', 'Warna latar'], ['aksen', 'Warna tombol'], ['tautan', 'Warna tautan']].map(function (r) {
            return '<label>' + r[1] + '<input type="color" data-c="' + r[0] + '" value="' + c[r[0]] + '"></label>';
          }).join('') + '</div>';
      }
      var cw = warna();
      if (cw) {
        var r1 = rasio(cw.teks, cw.latar), r2 = rasio(cw.tautan, cw.latar), r3 = rasio(lum(cw.aksen) > 0.4 ? '#000000' : '#ffffff', cw.aksen);
        var nilai = function (x) { return x >= 7 ? '✔ sangat baik' : (x >= 4.5 ? '✔ baik' : '⚠ rendah, sulit dibaca'); };
        h += '<ul class="a11y-rasio"><li>Tulisan terhadap latar: <b>' + r1.toFixed(1) + ':1</b> ' + nilai(r1) + '</li><li>Tautan terhadap latar: <b>' + r2.toFixed(1) + ':1</b> ' + nilai(r2) + '</li><li>Tulisan pada tombol: <b>' + r3.toFixed(1) + ':1</b> ' + nilai(r3) + '</li></ul>';
      }
      h += '</div><div class="a11y-kartu"><b>Pratinjau</b><div class="a11y-pratinjau"><p>Contoh tulisan: Saldo tabungan Anda Rp 125.000.</p><p><a href="javascript:void(0)">Contoh tautan</a> · <i class="bi bi-recycle fa fa-recycle"></i> ikon</p><button type="button" class="btn a11y-mini">Contoh tombol</button></div></div>' +
        '<p><button type="button" class="a11y-reset">Kembalikan ke standar</button></p><p class="a11y-ket">Pengaturan tersimpan di perangkat/peramban ini.</p>';
      el.innerHTML = h;
    }
    el.classList.add('a11y-panel-full');
    el.addEventListener('click', function (e) {
      var t = e.target.closest ? e.target.closest('button') : null; if (!t) return;
      if (t.getAttribute('data-g')) { pref[t.getAttribute('data-g')] = t.getAttribute('data-v'); }
      else if (t.getAttribute('data-salin')) { var p = PRESET[t.getAttribute('data-salin')]; pref.kustom = {teks: p.teks, latar: p.latar, aksen: p.aksen, tautan: p.tautan}; }
      else if (t.classList.contains('a11y-reset')) { pref = salin(STANDAR); }
      else return;
      terapkan(); gambar();
    });
    el.addEventListener('input', function (e) {
      var k = e.target.getAttribute && e.target.getAttribute('data-c');
      if (k) { pref.kustom[k] = e.target.value; terapkanWarna(); simpan(); var r = el.querySelector('.a11y-rasio'); if (r) { /* segarkan rasio tanpa menutup pemilih warna */ var cw = warna(); var f = function (x) { return x >= 7 ? '✔ sangat baik' : (x >= 4.5 ? '✔ baik' : '⚠ rendah, sulit dibaca'); }; var a = rasio(cw.teks, cw.latar), b = rasio(cw.tautan, cw.latar), c3 = rasio(lum(cw.aksen) > 0.4 ? '#000000' : '#ffffff', cw.aksen); r.innerHTML = '<li>Tulisan terhadap latar: <b>' + a.toFixed(1) + ':1</b> ' + f(a) + '</li><li>Tautan terhadap latar: <b>' + b.toFixed(1) + ':1</b> ' + f(b) + '</li><li>Tulisan pada tombol: <b>' + c3.toFixed(1) + ':1</b> ' + f(c3) + '</li>'; } }
    });
    gambar();
  }

  // ---------- tombol "Aa" pintasan menuju halaman pengaturan ----------
  function widget() {
    if (document.getElementById('a11y-toggle') || w.A11Y_NO_WIDGET || !w.A11Y_URL) return;
    var a = document.createElement('a'); a.id = 'a11y-toggle'; a.href = w.A11Y_URL; a.textContent = 'Aa';
    a.setAttribute('aria-label', 'Pengaturan aksesibilitas dan tampilan'); a.title = 'Pengaturan tampilan';
    document.body.appendChild(a);
  }

  function mulai() {
    widget(); terapkan();
    if (w.MutationObserver) {
      new MutationObserver(function () { if (!sibuk && (pref.ukuran !== 'sedang' || pref.ikon !== 'sedang')) jadwalSkala(); })
        .observe(document.body, {childList: true, subtree: true});
    }
  }
  terapkanWarna(); // sebelum render pertama agar tidak berkedip
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', mulai); else mulai();

  w.A11Y = {panel: panel, pref: function () { return salin(pref); }, rasio: rasio, terapkan: terapkan};
})(window);
