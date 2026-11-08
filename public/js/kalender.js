/* Kalender interaktif tanpa pustaka luar. Pilih tanggal sekali klik atau rentang (klik awal lalu klik akhir).
   Kalender.pasang(elemen, {mode:'single'|'range', dari:'YYYY-MM-DD', sampai:'YYYY-MM-DD', acara:{'YYYY-MM-DD':['teks']}, onPilih:function(dari,sampai){}}) */
(function (w) {
  var BULAN = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
  var HARI = ['Sen','Sel','Rab','Kam','Jum','Sab','Min'];
  function p2(n) { return (n < 10 ? '0' : '') + n; }
  function fmt(d) { return d.getFullYear() + '-' + p2(d.getMonth() + 1) + '-' + p2(d.getDate()); }
  function parse(s) { var a = s.split('-'); return new Date(+a[0], +a[1] - 1, +a[2]); }

  function pasang(el, opt) {
    opt = opt || {};
    var mode = opt.mode || 'single';
    var st = {dari: opt.dari || null, sampai: opt.sampai || null, acara: opt.acara || {}};
    var tampil = st.dari ? parse(st.dari) : new Date(); tampil.setDate(1);
    var menunggu = false; // true setelah klik pertama pada mode range

    function gambar() {
      var th = tampil.getFullYear(), bl = tampil.getMonth();
      var awal = (new Date(th, bl, 1).getDay() + 6) % 7; // Senin = 0
      var jml = new Date(th, bl + 1, 0).getDate(), hariIni = fmt(new Date());
      var h = '<div class="kal"><div class="kal-head"><button type="button" class="kal-nav" data-n="-1" aria-label="Bulan sebelumnya">‹</button>' +
        '<b>' + BULAN[bl] + ' ' + th + '</b><button type="button" class="kal-nav" data-n="1" aria-label="Bulan berikutnya">›</button></div><div class="kal-grid">';
      for (var i = 0; i < 7; i++) h += '<div class="kal-dow">' + HARI[i] + '</div>';
      for (i = 0; i < awal; i++) h += '<div></div>';
      for (var d = 1; d <= jml; d++) {
        var t = th + '-' + p2(bl + 1) + '-' + p2(d), c = 'kal-day';
        if (t === hariIni) c += ' today';
        if (st.dari && st.sampai && t >= st.dari && t <= st.sampai) c += ' range';
        if (t === st.dari || t === st.sampai || (!st.sampai && t === st.dari)) c += ' sel';
        var ac = st.acara[t];
        h += '<button type="button" class="' + c + '" data-t="' + t + '"' + (ac ? ' title="' + ac.join(' | ').replace(/"/g, '&quot;') + '"' : '') + '>' + d + (ac ? '<i class="kal-dot"></i>' : '') + '</button>';
      }
      el.innerHTML = h + '</div></div>';
    }
    el.addEventListener('click', function (e) {
      var b = e.target.closest ? e.target.closest('button') : null; if (!b) return;
      if (b.classList.contains('kal-nav')) { tampil.setMonth(tampil.getMonth() + (+b.getAttribute('data-n'))); gambar(); return; }
      var t = b.getAttribute('data-t'); if (!t) return;
      if (mode === 'single') { st.dari = st.sampai = t; }
      else if (!menunggu) { st.dari = t; st.sampai = null; menunggu = true; }
      else { if (t < st.dari) { st.sampai = st.dari; st.dari = t; } else { st.sampai = t; } menunggu = false; }
      gambar();
      if (opt.onPilih && (mode === 'single' || !menunggu)) opt.onPilih(st.dari, st.sampai || st.dari);
    });
    gambar();
    return {
      set: function (d, s) { st.dari = d; st.sampai = s; if (d) { tampil = parse(d); tampil.setDate(1); } menunggu = false; gambar(); },
      acara: function (a) { st.acara = a || {}; gambar(); }
    };
  }
  w.Kalender = {pasang: pasang, fmt: fmt};
})(window);
