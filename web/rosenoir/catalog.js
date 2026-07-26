/* ==========================================================================
   Rose Noir — catalogue data, cart, and shared chrome
   Single source of truth for products. index.html and product.html both
   render from CATALOG, so adding an item means editing one array.

   PLACEHOLDER DATA: names, prices, and copy are stand-ins. Swap for the
   real inventory before going live. Prices are in PLN, gross.
   ========================================================================== */

var CATEGORIES = [
  { id: 'toys',       label: 'Toys' },
  { id: 'lingerie',   label: 'Lingerie' },
  { id: 'restraints', label: 'Restraints' },
  { id: 'care',       label: 'Oils & care' },
  { id: 'wellness',   label: 'Wellness' },
  { id: 'gifts',      label: 'Gift sets' }
];

var CATALOG = [
  {
    id: 'onyx-wand', name: 'Onyx Vibrating Wand', cat: 'toys', price: 489,
    material: 'Medical silicone', tag: 'New',
    blurb: 'A weighted wand with a flexible neck and eight steady settings. Quiet enough for thin walls.',
    care: 'Rinse with warm water and a pH-neutral toy cleaner. Fully submersible.',
    specs: [['Material', 'Medical-grade silicone, non-porous'], ['Power', 'USB-C, ~2h runtime'], ['Water rating', 'IPX7 submersible'], ['Noise', 'Under 45 dB']]
  },
  {
    id: 'glass-curve', name: 'Glass Curve No. 2', cat: 'toys', price: 239,
    material: 'Borosilicate glass',
    blurb: 'Seamless annealed glass with a weighted curve. Holds temperature, so it can be warmed or cooled.',
    care: 'Dishwasher safe. Inspect for chips before each use and retire if any are found.',
    specs: [['Material', 'Annealed borosilicate glass'], ['Finish', 'Seamless, hand-polished'], ['Thermal', 'Safe to warm or chill'], ['Inspection', 'Individually checked before dispatch']]
  },
  {
    id: 'dual-ring', name: 'Dual Ring, Rechargeable', cat: 'toys', price: 329,
    material: 'Medical silicone',
    blurb: 'A stretch-forgiving ring with a low-frequency motor. Designed to be worn by either partner.',
    care: 'Wash before and after use. Store away from other silicone items.',
    specs: [['Material', 'Medical-grade silicone'], ['Power', 'USB-C, ~90min runtime'], ['Stretch', 'Fits 32–52mm'], ['Water rating', 'IPX6 splash-proof']]
  },
  {
    id: 'silk-slip', name: 'Silk Slip, Ink', cat: 'lingerie', price: 399,
    material: '19mm mulberry silk',
    blurb: 'Bias-cut in heavyweight mulberry silk, with French seams throughout. Falls without clinging.',
    care: 'Hand wash cold or dry clean. Line dry away from direct sun.',
    specs: [['Fabric', '19 momme mulberry silk, OEKO-TEX'], ['Cut', 'Bias, French seams'], ['Sizes', 'XS–XL'], ['Origin', 'Made in Portugal']]
  },
  {
    id: 'lace-harness', name: 'Lace Harness Set', cat: 'lingerie', price: 279,
    material: 'Leavers lace',
    blurb: 'Two pieces in Leavers lace from a Calais mill, on adjustable webbing with brass hardware.',
    care: 'Hand wash cold in a mesh bag. Do not wring.',
    specs: [['Fabric', 'Leavers lace, Calais'], ['Hardware', 'Solid brass, nickel-free'], ['Sizes', 'XS–XL, fully adjustable'], ['Pieces', 'Two']]
  },
  {
    id: 'satin-robe', name: 'Satin Robe, Charcoal', cat: 'lingerie', price: 459,
    material: 'Silk satin',
    blurb: 'Full-length silk satin with a wide self-tie belt and a deep back pleat.',
    care: 'Dry clean recommended. Press on low with a cloth between.',
    specs: [['Fabric', '22 momme silk satin'], ['Length', 'Full, 132cm'], ['Sizes', 'S–XL'], ['Detail', 'Deep back pleat, self-tie belt']]
  },
  {
    id: 'leather-cuffs', name: 'Leather Cuffs, Lined', cat: 'restraints', price: 459,
    material: 'Vegetable-tanned leather', tag: 'Top rated',
    blurb: 'Vegetable-tanned leather lined with garment lambskin, so they hold without biting. Quick-release clips.',
    care: 'Wipe with a barely damp cloth. Condition the outer leather twice a year.',
    specs: [['Leather', 'Vegetable-tanned, 3mm'], ['Lining', 'Garment lambskin'], ['Hardware', 'Stainless steel quick-release'], ['Fit', '14–22cm circumference']]
  },
  {
    id: 'silk-ties', name: 'Silk Tie Set of Two', cat: 'restraints', price: 189,
    material: 'Sandwashed silk',
    blurb: 'Two long sandwashed silk ties. Soft enough for wrists, long enough to be useful elsewhere.',
    care: 'Hand wash cold. Air dry flat.',
    specs: [['Fabric', 'Sandwashed silk'], ['Length', '200cm each'], ['Width', '6cm'], ['Pieces', 'Two']]
  },
  {
    id: 'collar-fine', name: 'Fine Collar, Blackened Brass', cat: 'restraints', price: 529,
    material: 'Leather and brass',
    blurb: 'Reads as jewellery in daylight. Blackened brass ring on a slim lined leather band.',
    care: 'Keep the brass dry. Polish with a dry cloth only.',
    specs: [['Leather', 'Vegetable-tanned, lined'], ['Hardware', 'Blackened solid brass'], ['Sizes', 'Three, 34–44cm'], ['Closure', 'Concealed'] ]
  },
  {
    id: 'oil-neroli', name: 'Massage Oil, Neroli', cat: 'care', price: 129,
    material: 'Jojoba base',
    blurb: 'A jojoba and sweet almond base with neroli and a trace of vetiver. Absorbs without a slick.',
    care: 'Store below 25°C. Use within 12 months of opening.',
    specs: [['Base', 'Jojoba, sweet almond'], ['Scent', 'Neroli, vetiver'], ['Volume', '100ml'], ['Note', 'Not compatible with latex']]
  },
  {
    id: 'lube-water', name: 'Water-Based Lubricant', cat: 'care', price: 79,
    material: 'Water-based, glycerin-free',
    blurb: 'Glycerin-free and pH-balanced, with no warming agents or fragrance. Safe with every material we stock.',
    care: 'Close fully after use. Do not decant.',
    specs: [['Base', 'Water, glycerin-free'], ['pH', '4.5–5.5'], ['Volume', '150ml'], ['Compatibility', 'Silicone, glass, latex — all safe']]
  },
  {
    id: 'cleaner-toy', name: 'Toy Cleaner, Unscented', cat: 'care', price: 59,
    material: 'Alcohol-free foam',
    blurb: 'An alcohol-free foam that will not degrade silicone. No scent, no residue.',
    care: 'Spray, wait ten seconds, rinse.',
    specs: [['Type', 'Alcohol-free foam'], ['Scent', 'None'], ['Volume', '150ml'], ['Safe on', 'Silicone, glass, steel']]
  },
  {
    id: 'candle-ember', name: 'Massage Candle, Ember', cat: 'wellness', price: 149,
    material: 'Soy and shea wax',
    blurb: 'Burns at skin temperature, so the pool doubles as a warm massage oil. Smells of woodsmoke and fig.',
    care: 'Trim the wick to 5mm. Test temperature on a forearm first.',
    specs: [['Wax', 'Soy, shea butter'], ['Burn time', '~25 hours'], ['Scent', 'Woodsmoke, fig'], ['Pour temp', 'Skin-safe']]
  },
  {
    id: 'pelvic-set', name: 'Pelvic Floor Set', cat: 'wellness', price: 269,
    material: 'Medical silicone',
    blurb: 'Three progressive weights in medical silicone, with a short printed programme. Boring, and it works.',
    care: 'Wash before and after each use. Do not share between people.',
    specs: [['Material', 'Medical-grade silicone'], ['Weights', '28g, 43g, 61g'], ['Includes', 'Printed 8-week programme'], ['Retrieval', 'Silicone loop']]
  },
  {
    id: 'coffret-first', name: 'The First Coffret', cat: 'gifts', price: 649,
    material: 'Mixed', tag: 'Best seller',
    blurb: 'For people new to all of this. One toy, one oil, one silk tie, and a card that explains nothing awkwardly.',
    care: 'See each item for its own care notes.',
    specs: [['Contains', 'Glass Curve No. 2, Neroli oil, one silk tie'], ['Packaging', 'Unbranded rigid box'], ['Card', 'Blank, handwritten on request'], ['Value', 'Saves 58 zł against separate purchase']]
  },
  {
    id: 'coffret-pair', name: 'The Pair Coffret', cat: 'gifts', price: 899,
    material: 'Mixed',
    blurb: 'Built for two: the ring, the cuffs, the candle, and the lubricant that works with all of them.',
    care: 'See each item for its own care notes.',
    specs: [['Contains', 'Dual Ring, Leather Cuffs, Ember candle, lubricant'], ['Packaging', 'Unbranded rigid box'], ['Card', 'Blank, handwritten on request'], ['Value', 'Saves 117 zł against separate purchase']]
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

/* Escape any string before it goes near innerHTML. */
function esc(s) {
  return String(s)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
}

/* Only http(s) and protocol-relative image URLs — never javascript: or data:
   from a supplier feed we don't control. */
function safeImageUrl(u) {
  var s = String(u || '').trim();
  return /^(https?:)?\/\//i.test(s) ? s : '';
}

/* Product media: renders the feed image when there is one, otherwise the
   placeholder tile. `inner` is the placeholder caption. A broken remote image
   falls back to the placeholder rather than showing a torn-icon box. */
function mediaInner(p, placeholder) {
  var src = safeImageUrl(p && p.image);
  if (!src) return esc(placeholder || 'Product image');
  return '<img src="' + esc(src) + '" alt="' + esc(p.name || '') + '" loading="lazy" ' +
         'onerror="this.parentNode.classList.add(&quot;is-empty&quot;);this.remove()">';
}

/* ------------------------------------------------------------------- cart */

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

  /* Free delivery above this threshold — a real merchandising lever. */
  freeFrom: 300,

  shipping: function () {
    var sub = this.subtotal();
    if (sub === 0) return 0;
    return sub >= this.freeFrom ? 0 : 19;
  },

  total: function () { return this.subtotal() + this.shipping(); },

  /* ---- rendering ---- */

  render: function () {
    var n = this.count();
    var badges = document.querySelectorAll('[data-cart-count]');
    for (var i = 0; i < badges.length; i++) badges[i].textContent = n;

    var body = document.getElementById('cartBody');
    var foot = document.getElementById('cartFoot');
    if (!body || !foot) return;

    var lines = this.read();
    if (!lines.length) {
      body.innerHTML = '<p style="color:var(--text-dim);font-size:var(--t-sm);margin:0">Your cart is empty.</p>';
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
              '<button type="button" data-qty-down="' + esc(p.id) + '" aria-label="Decrease quantity">&minus;</button>' +
              '<span>' + lines[j].qty + '</span>' +
              '<button type="button" data-qty-up="' + esc(p.id) + '" aria-label="Increase quantity">+</button>' +
            '</div>' +
            '<button type="button" class="line__remove" data-remove="' + esc(p.id) + '">Remove</button>' +
          '</div>' +
          '<div class="line__price">' + esc(zl(p.price * lines[j].qty)) + '</div>' +
        '</div>';
    }
    body.innerHTML = html;

    var sub = this.subtotal();
    var ship = this.shipping();
    var away = this.freeFrom - sub;
    foot.innerHTML =
      '<div class="totals"><span>Subtotal</span><span>' + esc(zl(sub)) + '</span></div>' +
      '<div class="totals"><span>Delivery</span><span>' + (ship === 0 ? 'Free' : esc(zl(ship))) + '</span></div>' +
      (away > 0
        ? '<div style="font-size:var(--t-xs);color:var(--text-faint)">Add ' + esc(zl(away)) + ' for free delivery.</div>'
        : '') +
      '<div class="totals totals--grand"><span>Total</span><span>' + esc(zl(this.total())) + '</span></div>' +
      '<button class="btn btn--primary btn--block" type="button" data-checkout>Checkout</button>' +
      '<p style="font-size:var(--t-xs);color:var(--text-faint);margin:0;text-align:center">' +
        'Plain packaging &middot; neutral billing descriptor' +
      '</p>';
  }
};

/* -------------------------------------------------- shared page behaviour */

function initChrome() {
  /* age gate, remembered for the session */
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

  /* cart drawer open/close */
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

  /* delegated cart actions — works for buttons rendered after load */
  document.addEventListener('click', function (e) {
    var t = e.target.closest ? e.target.closest('[data-add],[data-qty-up],[data-qty-down],[data-remove],[data-checkout]') : null;
    if (!t) return;

    if (t.hasAttribute('data-add')) {
      Cart.add(t.getAttribute('data-add'), 1);
      /* Non-blocking confirmation. Auto-opening the drawer here would cover the
         grid and force a close before the next add — bad in a dense catalogue. */
      if (!t.dataset.reverting) {
        var original = t.textContent;
        t.dataset.reverting = '1';
        t.textContent = 'Added ✓';
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
      /* Honest placeholder: no payment processor is connected to this build. */
      var foot = document.getElementById('cartFoot');
      if (foot && !document.getElementById('checkoutNote')) {
        var note = document.createElement('p');
        note.id = 'checkoutNote';
        note.className = 'note';
        note.style.marginTop = '0.25rem';
        note.innerHTML = '<strong>Checkout is not connected yet.</strong> This build has no payment processor, so no order can be placed and no card details are collected. Wire up a provider before taking real orders.';
        foot.appendChild(note);
      }
    }
  });

  Cart.render();
}

document.addEventListener('DOMContentLoaded', initChrome);
