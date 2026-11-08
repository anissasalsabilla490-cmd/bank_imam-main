/* Pembaca berat berformat Indonesia: koma sebagai desimal.
   Berat.parse("1,7kg 2,5kg") -> {ok:true, kg:4.2}
   Dukung: "1,7"  "1.7"  "1,7kg"  "1,7 kg + 2,5 kg"  "500g"  "500 gr + 1,5kg"  (pisah dengan spasi, + atau ;).
   Tanpa satuan = kg. Titik tunggal tanpa koma dianggap desimal ("2.5"). Pola ribuan ambigu ("1.000") ditolak
   agar tidak salah baca diam-diam. Hasil dibulatkan 2 desimal (sama dengan perhitungan server). */
(function (w) {
  var SATUAN = {kg: 1, kilo: 1, kilogram: 1, g: 0.001, gr: 0.001, gram: 0.001};

  function angka(t) {
    if (/^\d{1,3}(\.\d{3})+$/.test(t)) {
      var ribu = t.replace(/\./g, ''), des = format(parseFloat(t));
      return {err: 'Angka "' + t + '" ambigu. Tulis ' + ribu + ' (ribuan) atau ' + des + ' (desimal).'};
    }
    var koma = (t.match(/,/g) || []).length;
    if (koma > 1) return {err: 'Angka "' + t + '" memiliki lebih dari satu koma.'};
    var n = koma ? t.replace(/\./g, '').replace(',', '.') : t;
    if (!/^\d*\.?\d+$/.test(n) && !/^\d+\.?$/.test(n)) return {err: 'Angka "' + t + '" tidak valid.'};
    return {v: parseFloat(n)};
  }

  function parse(teks) {
    var s = String(teks == null ? '' : teks).toLowerCase().replace(/[;\n\r\t]+/g, ' ').replace(/\+/g, ' ').trim();
    if (!s) return {ok: true, kg: 0, kosong: true};
    // "1,7 kg" -> "1,7kg"
    s = s.replace(/(\d)\s+(kilogram|kilo|kg|gram|gr|g)\b/g, '$1$2');
    var token = s.split(/\s+/).filter(Boolean), total = 0, rinci = [];
    for (var i = 0; i < token.length; i++) {
      var m = /^([\d.,]+)(kilogram|kilo|kg|gram|gr|g)?$/.exec(token[i]);
      if (!m) return {ok: false, pesan: 'Tidak dapat membaca "' + token[i] + '". Contoh: 1,7 atau 1,7kg 2,5kg'};
      var a = angka(m[1]);
      if (a.err) return {ok: false, pesan: a.err};
      var kg = a.v * (SATUAN[m[2] || 'kg']);
      total += kg; rinci.push(kg);
    }
    total = Math.round(total * 1000) / 1000;
    var bulat = Math.round(total * 100) / 100;
    return {ok: true, kg: bulat, dibulatkan: Math.abs(bulat - total) > 1e-9, rinci: rinci};
  }

  /** 4.2 -> "4,2" ; 1000 -> "1.000" ; maks 2 desimal */
  function format(n) {
    n = Math.round((+n || 0) * 100) / 100;
    var neg = n < 0 ? '-' : '', p = Math.abs(n).toFixed(2).split('.');
    var ribu = p[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    var d = p[1].replace(/0+$/, '');
    return neg + ribu + (d ? ',' + d : '');
  }
  function rupiah(n) { return 'Rp ' + Math.round(+n || 0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.'); }

  w.Berat = {parse: parse, format: format, rupiah: rupiah, kg: function (t) { var r = parse(t); return r.ok ? r.kg : NaN; }};
  if (typeof module !== 'undefined') module.exports = w.Berat;
})(typeof window !== 'undefined' ? window : globalThis);
