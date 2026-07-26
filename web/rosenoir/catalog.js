/* ==========================================================================
   Rose Noir — dane katalogu, koszyk i wspólne elementy stron
   Jedno źródło prawdy dla produktów. index.html i product.html renderują
   z CATALOG, więc dodanie produktu to edycja jednej tablicy.

   DANE ZASTĘPCZE: nazwy, ceny i opisy są tymczasowe. Podmień na realny
   asortyment przed startem. Ceny w złotych, brutto.
   ========================================================================== */

var CATEGORIES = [
  { id: 'zabawki',     label: 'Zabawki' },
  { id: 'bielizna',    label: 'Bielizna' },
  { id: 'krepowanie',  label: 'Krępowanie' },
  { id: 'pielegnacja', label: 'Olejki i pielęgnacja' },
  { id: 'zdrowie',     label: 'Zdrowie intymne' },
  { id: 'prezenty',    label: 'Zestawy prezentowe' }
];

var CATALOG = [
  {
    id: 'onyx-wand', name: 'Masażer wibracyjny Onyx', cat: 'zabawki', price: 489,
    material: 'Silikon medyczny', tag: 'Nowość', image: '',
    blurb: 'Wyważony masażer z elastyczną szyjką i ośmioma równymi trybami. Cichy na tyle, żeby nie przeszkadzał za cienką ścianą.',
    care: 'Przemyj ciepłą wodą i płynem o neutralnym pH. Można zanurzać w całości.',
    specs: [['Materiał', 'Silikon medyczny, nieporowaty'], ['Zasilanie', 'USB-C, ok. 2 h pracy'], ['Wodoodporność', 'IPX7, pełne zanurzenie'], ['Głośność', 'poniżej 45 dB']]
  },
  {
    id: 'glass-curve', name: 'Szklany masażer Curve nr 2', cat: 'zabawki', price: 239,
    material: 'Szkło borokrzemowe', image: '',
    blurb: 'Bezszwowe szkło odprężane z wyważonym wygięciem. Trzyma temperaturę, więc można je ogrzać albo ochłodzić.',
    care: 'Można myć w zmywarce. Przed każdym użyciem sprawdź, czy nie ma odprysków — jeśli są, wycofaj z użycia.',
    specs: [['Materiał', 'Szkło borokrzemowe, odprężane'], ['Wykończenie', 'Bezszwowe, polerowane ręcznie'], ['Temperatura', 'Można ogrzewać i chłodzić'], ['Kontrola', 'Sprawdzane pojedynczo przed wysyłką']]
  },
  {
    id: 'dual-ring', name: 'Pierścień Dual, ładowany', cat: 'zabawki', price: 329,
    material: 'Silikon medyczny', image: '',
    blurb: 'Wyrozumiały na rozciąganie pierścień z silnikiem o niskiej częstotliwości. Zaprojektowany tak, żeby mógł go nosić każde z partnerów.',
    care: 'Myj przed i po użyciu. Przechowuj osobno od innych przedmiotów silikonowych.',
    specs: [['Materiał', 'Silikon medyczny'], ['Zasilanie', 'USB-C, ok. 90 min pracy'], ['Rozciągliwość', 'Pasuje na 32–52 mm'], ['Wodoodporność', 'IPX6, ochrona przed zalaniem']]
  },
  {
    id: 'silk-slip', name: 'Jedwabna halka, Atrament', cat: 'bielizna', price: 399,
    material: 'Jedwab morwowy 19 mm', image: '',
    blurb: 'Cięta ze skosu z ciężkiego jedwabiu morwowego, w całości na szwy francuskie. Opada, nie oblepia.',
    care: 'Pierz ręcznie w zimnej wodzie lub czyść chemicznie. Susz na sznurku, z dala od słońca.',
    specs: [['Tkanina', 'Jedwab morwowy 19 momme, OEKO-TEX'], ['Krój', 'Ze skosu, szwy francuskie'], ['Rozmiary', 'XS–XL'], ['Pochodzenie', 'Szyte w Portugalii']]
  },
  {
    id: 'lace-harness', name: 'Uprząż z koronki, komplet', cat: 'bielizna', price: 279,
    material: 'Koronka Leavers', image: '',
    blurb: 'Dwa elementy z koronki Leavers z przędzalni w Calais, na regulowanych taśmach z mosiężnymi okuciami.',
    care: 'Pierz ręcznie w zimnej wodzie, w siatce. Nie wykręcaj.',
    specs: [['Tkanina', 'Koronka Leavers, Calais'], ['Okucia', 'Mosiądz, bez niklu'], ['Rozmiary', 'XS–XL, pełna regulacja'], ['Elementy', 'Dwa']]
  },
  {
    id: 'satin-robe', name: 'Szlafrok z satyny, Antracyt', cat: 'bielizna', price: 459,
    material: 'Satyna jedwabna', image: '',
    blurb: 'Pełna długość w jedwabnej satynie, z szerokim wiązanym pasem i głęboką kontrafałdą na plecach.',
    care: 'Zalecane czyszczenie chemiczne. Prasuj na niskiej temperaturze przez tkaninę.',
    specs: [['Tkanina', 'Satyna jedwabna 22 momme'], ['Długość', 'Pełna, 132 cm'], ['Rozmiary', 'S–XL'], ['Detal', 'Kontrafałda, wiązany pas']]
  },
  {
    id: 'leather-cuffs', name: 'Kajdanki skórzane, podszyte', cat: 'krepowanie', price: 459,
    material: 'Skóra roślinnie dubiona', tag: 'Najwyżej oceniane', image: '',
    blurb: 'Skóra dubiona roślinnie, podszyta jagnięciną odzieżową — trzymają, ale nie wgryzają się. Karabinki z szybkim zwolnieniem.',
    care: 'Przetrzyj lekko wilgotną ściereczką. Skórę zewnętrzną natłuszczaj dwa razy w roku.',
    specs: [['Skóra', 'Dubiona roślinnie, 3 mm'], ['Podszewka', 'Jagnięcina odzieżowa'], ['Okucia', 'Stal nierdzewna, szybkie zwolnienie'], ['Obwód', '14–22 cm']]
  },
  {
    id: 'silk-ties', name: 'Jedwabne wiązania, para', cat: 'krepowanie', price: 189,
    material: 'Jedwab piaskowany', image: '',
    blurb: 'Dwa długie wiązania z piaskowanego jedwabiu. Miękkie dość na nadgarstki, długie dość, żeby przydały się gdzie indziej.',
    care: 'Pierz ręcznie w zimnej wodzie. Susz na płasko.',
    specs: [['Tkanina', 'Jedwab piaskowany'], ['Długość', '200 cm każde'], ['Szerokość', '6 cm'], ['Elementy', 'Dwa']]
  },
  {
    id: 'collar-fine', name: 'Obroża, czerniony mosiądz', cat: 'krepowanie', price: 529,
    material: 'Skóra i mosiądz', image: '',
    blurb: 'W świetle dnia czyta się jak biżuteria. Czerniony mosiężny pierścień na wąskiej, podszytej opasce ze skóry.',
    care: 'Chroń mosiądz od wilgoci. Polerować wyłącznie suchą ściereczką.',
    specs: [['Skóra', 'Dubiona roślinnie, podszyta'], ['Okucia', 'Mosiądz czerniony'], ['Rozmiary', 'Trzy, 34–44 cm'], ['Zapięcie', 'Ukryte']]
  },
  {
    id: 'oil-neroli', name: 'Olejek do masażu, Neroli', cat: 'pielegnacja', price: 129,
    material: 'Baza jojoba', image: '',
    blurb: 'Baza z jojoby i olejku ze słodkich migdałów, z neroli i śladem wetywerii. Wchłania się, nie zostawia tłustej warstwy.',
    care: 'Przechowuj poniżej 25°C. Zużyj w ciągu 12 miesięcy od otwarcia.',
    specs: [['Baza', 'Jojoba, słodkie migdały'], ['Zapach', 'Neroli, wetyweria'], ['Pojemność', '100 ml'], ['Uwaga', 'Niezgodny z lateksem']]
  },
  {
    id: 'lube-water', name: 'Lubrykant na bazie wody', cat: 'pielegnacja', price: 79,
    material: 'Wodny, bez gliceryny', image: '',
    blurb: 'Bez gliceryny, o zbalansowanym pH, bez substancji rozgrzewających i bez zapachu. Bezpieczny ze wszystkim, co mamy w katalogu.',
    care: 'Zamykaj dokładnie po użyciu. Nie przelewaj do innych pojemników.',
    specs: [['Baza', 'Woda, bez gliceryny'], ['pH', '4,5–5,5'], ['Pojemność', '150 ml'], ['Zgodność', 'Silikon, szkło, lateks — bezpieczny']]
  },
  {
    id: 'cleaner-toy', name: 'Płyn do akcesoriów, bezwonny', cat: 'pielegnacja', price: 59,
    material: 'Pianka bez alkoholu', image: '',
    blurb: 'Pianka bez alkoholu, która nie niszczy silikonu. Bez zapachu, bez osadu.',
    care: 'Spryskaj, odczekaj dziesięć sekund, spłucz.',
    specs: [['Rodzaj', 'Pianka bez alkoholu'], ['Zapach', 'Brak'], ['Pojemność', '150 ml'], ['Bezpieczny na', 'Silikon, szkło, stal']]
  },
  {
    id: 'candle-ember', name: 'Świeca do masażu, Żar', cat: 'zdrowie', price: 149,
    material: 'Wosk sojowy i shea', image: '',
    blurb: 'Pali się w temperaturze skóry, więc rozpuszczony wosk służy jako ciepły olejek do masażu. Pachnie dymem z drewna i figą.',
    care: 'Skracaj knot do 5 mm. Temperaturę sprawdź najpierw na przedramieniu.',
    specs: [['Wosk', 'Sojowy, masło shea'], ['Czas palenia', 'ok. 25 godzin'], ['Zapach', 'Dym z drewna, figa'], ['Temperatura', 'Bezpieczna dla skóry']]
  },
  {
    id: 'pelvic-set', name: 'Zestaw do mięśni Kegla', cat: 'zdrowie', price: 269,
    material: 'Silikon medyczny', image: '',
    blurb: 'Trzy rosnące obciążenia w silikonie medycznym, z krótkim programem w druku. Nudne i skuteczne.',
    care: 'Myj przed i po każdym użyciu. Nie udostępniaj innym osobom.',
    specs: [['Materiał', 'Silikon medyczny'], ['Obciążenia', '28 g, 43 g, 61 g'], ['W zestawie', 'Program 8-tygodniowy'], ['Wyjmowanie', 'Silikonowa pętelka']]
  },
  {
    id: 'coffret-first', name: 'Pierwszy zestaw', cat: 'prezenty', price: 649,
    material: 'Mieszane', tag: 'Bestseller', image: '',
    blurb: 'Dla osób, które zaczynają. Jedna zabawka, jeden olejek, jedno jedwabne wiązanie i kartka, która nie tłumaczy niczego niezręcznie.',
    care: 'Sposób pielęgnacji każdego elementu opisany przy produkcie.',
    specs: [['Zawiera', 'Masażer Curve nr 2, olejek Neroli, jedno wiązanie'], ['Opakowanie', 'Nieoznaczone pudełko'], ['Kartka', 'Pusta, na życzenie napiszemy ręcznie'], ['Korzyść', 'Taniej o 58 zł niż osobno']]
  },
  {
    id: 'coffret-pair', name: 'Zestaw dla dwojga', cat: 'prezenty', price: 899,
    material: 'Mieszane', image: '',
    blurb: 'Zbudowany dla dwojga: pierścień, kajdanki, świeca i lubrykant, który pasuje do wszystkiego powyżej.',
    care: 'Sposób pielęgnacji każdego elementu opisany przy produkcie.',
    specs: [['Zawiera', 'Pierścień Dual, kajdanki, świeca Żar, lubrykant'], ['Opakowanie', 'Nieoznaczone pudełko'], ['Kartka', 'Pusta, na życzenie napiszemy ręcznie'], ['Korzyść', 'Taniej o 117 zł niż osobno']]
  }
];

/* ------------------------------------------------------------------ utils */

function findProduct(id) {
  for (var i = 0; i < CATALOG.length; i++) {
    if (CATALOG[i].id === id) return CATALOG[i];
  }
  return null;
}

function catLabel(catId) {
  for (var i = 0; i < CATEGORIES.length; i++) {
    if (CATEGORIES[i].id === catId) return CATEGORIES[i].label;
  }
  return catId;
}

function zl(n) {
  return n.toLocaleString('pl-PL') + ' zł';
}

/* Odmiana rzeczownika po liczbie: 1 produkt / 2 produkty / 5 produktów */
function plural(n, one, few, many) {
  if (n === 1) return one;
  var mod10 = n % 10, mod100 = n % 100;
  if (mod10 >= 2 && mod10 <= 4 && !(mod100 >= 12 && mod100 <= 14)) return few;
  return many;
}

/* Escape any string before it goes near innerHTML. */
function esc(s) {
  return String(s)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
}

/* Tylko http(s) i adresy protokołowo-relatywne — nigdy javascript: ani data:
   z feedu dostawcy, którego nie kontrolujemy. */
function safeImageUrl(u) {
  var s = String(u || '').trim();
  return /^(https?:)?\/\//i.test(s) ? s : '';
}

/* Kafel zdjęcia: renderuje zdjęcie z feedu, gdy jest, w przeciwnym razie
   placeholder. Nieudane wczytanie zdalnego zdjęcia wraca do placeholdera,
   zamiast pokazywać ikonę zepsutego obrazka. */
function mediaInner(p, placeholder) {
  var src = safeImageUrl(p && p.image);
  if (!src) return esc(placeholder === undefined ? 'Zdjęcie produktu' : placeholder);
  return '<img src="' + esc(src) + '" alt="' + esc(p.name || '') + '" loading="lazy" ' +
         'onerror="this.parentNode.classList.add(&quot;is-empty&quot;);this.remove()">';
}

/* ------------------------------------------------------------------- koszyk */

var Cart = {
  key: 'rn_cart_v1',

  read: function () {
    try {
      var raw = localStorage.getItem(this.key);
      var parsed = raw ? JSON.parse(raw) : [];
      return Array.isArray(parsed) ? parsed.filter(function (l) { return findProduct(l.id); }) : [];
    } catch (e) { return []; }
  },

  write: function (lines) {
    try { localStorage.setItem(this.key, JSON.stringify(lines)); } catch (e) {}
    this.render();
  },

  add: function (id, qty) {
    var lines = this.read();
    var found = false;
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].id === id) { lines[i].qty += (qty || 1); found = true; break; }
    }
    if (!found) lines.push({ id: id, qty: qty || 1 });
    this.write(lines);
  },

  setQty: function (id, qty) {
    var lines = this.read();
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].id === id) {
        lines[i].qty = qty;
        if (lines[i].qty < 1) lines.splice(i, 1);
        break;
      }
    }
    this.write(lines);
  },

  remove: function (id) {
    this.write(this.read().filter(function (l) { return l.id !== id; }));
  },

  count: function () {
    return this.read().reduce(function (n, l) { return n + l.qty; }, 0);
  },

  subtotal: function () {
    return this.read().reduce(function (sum, l) {
      var p = findProduct(l.id);
      return sum + (p ? p.price * l.qty : 0);
    }, 0);
  },

  /* Darmowa dostawa od tej kwoty — realna dźwignia sprzedażowa. */
  freeFrom: 300,

  shipping: function () {
    var sub = this.subtotal();
    if (sub === 0) return 0;
    return sub >= this.freeFrom ? 0 : 19;
  },

  total: function () { return this.subtotal() + this.shipping(); },

  /* ---- renderowanie ---- */

  render: function () {
    var n = this.count();
    var badges = document.querySelectorAll('[data-cart-count]');
    for (var i = 0; i < badges.length; i++) badges[i].textContent = n;

    var body = document.getElementById('cartBody');
    var foot = document.getElementById('cartFoot');
    if (!body || !foot) return;

    var lines = this.read();
    if (!lines.length) {
      body.innerHTML = '<p style="color:var(--text-dim);font-size:var(--t-sm);margin:0">Koszyk jest pusty.</p>';
      foot.innerHTML = '';
      return;
    }

    var html = '';
    for (var j = 0; j < lines.length; j++) {
      var p = findProduct(lines[j].id);
      if (!p) continue;
      html +=
        '<div class="line">' +
          '<div class="line__thumb">' + (safeImageUrl(p.image) ? mediaInner(p, '') : '') + '</div>' +
          '<div>' +
            '<div class="line__name">' + esc(p.name) + '</div>' +
            '<div class="line__cat">' + esc(catLabel(p.cat)) + '</div>' +
            '<div class="qty">' +
              '<button type="button" data-qty-down="' + esc(p.id) + '" aria-label="Zmniejsz ilość">&minus;</button>' +
              '<span>' + lines[j].qty + '</span>' +
              '<button type="button" data-qty-up="' + esc(p.id) + '" aria-label="Zwiększ ilość">+</button>' +
            '</div>' +
            '<button type="button" class="line__remove" data-remove="' + esc(p.id) + '">Usuń</button>' +
          '</div>' +
          '<div class="line__price">' + esc(zl(p.price * lines[j].qty)) + '</div>' +
        '</div>';
    }
    body.innerHTML = html;

    var sub = this.subtotal();
    var ship = this.shipping();
    var away = this.freeFrom - sub;
    foot.innerHTML =
      '<div class="totals"><span>Suma częściowa</span><span>' + esc(zl(sub)) + '</span></div>' +
      '<div class="totals"><span>Dostawa</span><span>' + (ship === 0 ? 'Darmowa' : esc(zl(ship))) + '</span></div>' +
      (away > 0
        ? '<div style="font-size:var(--t-xs);color:var(--text-faint)">Dodaj jeszcze ' + esc(zl(away)) + ' do darmowej dostawy.</div>'
        : '') +
      '<div class="totals totals--grand"><span>Razem</span><span>' + esc(zl(this.total())) + '</span></div>' +
      '<button class="btn btn--primary btn--block" type="button" data-checkout>Przejdź do płatności</button>' +
      '<p style="font-size:var(--t-xs);color:var(--text-faint);margin:0;text-align:center">' +
        'Nieoznaczone opakowanie &middot; neutralny opis na wyciągu' +
      '</p>';
  }
};

/* ------------------------------------------- wspólne zachowanie stron */

function initChrome() {
  /* bramka wieku, pamiętana na czas sesji */
  var gate = document.getElementById('gate');
  if (gate) {
    var ok = false;
    try { ok = sessionStorage.getItem('rn_age') === '1'; } catch (e) {}
    if (ok) { gate.classList.add('is-open'); } else { document.body.style.overflow = 'hidden'; }
    var enter = document.getElementById('gateEnter');
    if (enter) {
      enter.addEventListener('click', function () {
        try { sessionStorage.setItem('rn_age', '1'); } catch (e) {}
        gate.classList.add('is-open');
        document.body.style.overflow = '';
      });
    }
  }

  var y = document.getElementById('year');
  if (y) y.textContent = new Date().getFullYear();

  /* szuflada koszyka */
  var drawer = document.getElementById('cartDrawer');
  var scrim = document.getElementById('cartScrim');

  function openCart() {
    if (!drawer) return;
    drawer.classList.add('is-open');
    scrim.classList.add('is-open');
    drawer.setAttribute('aria-hidden', 'false');
  }
  function closeCart() {
    if (!drawer) return;
    drawer.classList.remove('is-open');
    scrim.classList.remove('is-open');
    drawer.setAttribute('aria-hidden', 'true');
  }

  var openers = document.querySelectorAll('[data-open-cart]');
  for (var i = 0; i < openers.length; i++) openers[i].addEventListener('click', openCart);
  if (scrim) scrim.addEventListener('click', closeCart);
  var closer = document.getElementById('cartClose');
  if (closer) closer.addEventListener('click', closeCart);
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeCart(); });

  /* delegowane akcje koszyka — działają też dla przycisków wyrenderowanych później */
  document.addEventListener('click', function (e) {
    var t = e.target.closest ? e.target.closest('[data-add],[data-qty-up],[data-qty-down],[data-remove],[data-checkout]') : null;
    if (!t) return;

    if (t.hasAttribute('data-add')) {
      Cart.add(t.getAttribute('data-add'), 1);
      /* Potwierdzenie nieblokujące. Automatyczne otwarcie szuflady zasłaniałoby
         siatkę i wymuszało zamknięcie przed każdym kolejnym dodaniem. */
      if (!t.dataset.reverting) {
        var original = t.textContent;
        t.dataset.reverting = '1';
        t.textContent = 'Dodano ✓';
        setTimeout(function () {
          t.textContent = original;
          delete t.dataset.reverting;
        }, 1200);
      }
    } else if (t.hasAttribute('data-qty-up')) {
      var idU = t.getAttribute('data-qty-up');
      var lu = Cart.read().filter(function (l) { return l.id === idU; })[0];
      Cart.setQty(idU, (lu ? lu.qty : 0) + 1);
    } else if (t.hasAttribute('data-qty-down')) {
      var idD = t.getAttribute('data-qty-down');
      var ld = Cart.read().filter(function (l) { return l.id === idD; })[0];
      Cart.setQty(idD, (ld ? ld.qty : 0) - 1);
    } else if (t.hasAttribute('data-remove')) {
      Cart.remove(t.getAttribute('data-remove'));
    } else if (t.hasAttribute('data-checkout')) {
      /* Uczciwy placeholder: w tej wersji nie ma podłączonych płatności. */
      var foot = document.getElementById('cartFoot');
      if (foot && !document.getElementById('checkoutNote')) {
        var note = document.createElement('p');
        note.id = 'checkoutNote';
        note.className = 'note';
        note.style.marginTop = '0.25rem';
        note.innerHTML = '<strong>Płatności nie są jeszcze podłączone.</strong> Ta wersja sklepu nie ma operatora płatności, więc nie można złożyć zamówienia i nie zbieramy danych karty. Podłącz operatora, zanim zaczniesz przyjmować realne zamówienia.';
        foot.appendChild(note);
      }
    }
  });

  Cart.render();
}

document.addEventListener('DOMContentLoaded', initChrome);
