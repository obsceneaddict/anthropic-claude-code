# Rose Noir — premium sex shop, front end

Static multi-page site. No build step, no framework, no external fonts,
scripts, images, or trackers. Drop the folder on any static host.

## Files

| Plik | Co to |
|---|---|
| `index.html` | Strona główna + katalog z filtrami kategorii |
| `produkt.html` | Karta produktu, sterowana `?id=` |
| `regulamin.html` | Regulamin sklepu |
| `prywatnosc.html` | Polityka prywatności / RODO |
| `zwroty.html` | Zwroty i odstąpienie od umowy |
| `polityka-18.html` | Polityka 18+ |
| `style.css` | Wspólny system projektowy |
| `catalog.js` | Dane produktów, koszyk, wspólne elementy stron |
| `tools/ewidencja.html` | Ewidencja sprzedaży (działalność nierejestrowana) |
| `tools/import-feed.html` | Import feedu hurtowni → katalog *(interfejs po angielsku — narzędzie wewnętrzne)* |
| `BIZNES.md` | Instrukcja operacyjna: limity, NIP, obowiązki, marketing |

**Język:** serwis jest po polsku. Angielska wersja istnieje w historii gita —
`git log --oneline -- web/rosenoir/index.html`. Nie utrzymujemy dwóch wersji
równolegle, dopóki nie ma realnego powodu (eksport).

## Publish it (~2 minutes, free)

Go to [app.netlify.com/drop](https://app.netlify.com/drop) and drag this
`rosenoir/` folder onto the page. You get a live URL immediately. For a custom
domain (`rosenoir.pl`), add it under Domain settings and point your DNS there.

## Design tokens (client-approved, clean/technical direction)

```
ground    #0B0B0E      surface  #16161A / #1C1C21
border    #26262C      strong   #33333B
text      #EDEDEF      dim      #9A9AA3    faint  #6B6B75
accent    #6E56CF      — interactive affordances only, never decorative
semantic  #3DA95E ok   #C99A2E warn        — kept separate from the accent
type      one sans, tight heading tracking, 16px base, 1.25 scale
radius    6px          shadows  none/minimal
```

An earlier editorial version (Didot display type, wine/rose palette, animated
canvas hero) is in git history: `git log --oneline -- web/rosenoir/index.html`

## Cart

Real, working, client-side: add/remove/quantity, persisted to `localStorage`,
free-delivery threshold at 300 zł. Adding an item gives inline button feedback
rather than opening the drawer, so browsing isn't interrupted.

**Checkout is deliberately not wired to a payment processor.** The button
explains that no order can be placed and no card details are collected. Do not
replace that message with a fake success state — connect a real provider
(Stripe, Przelewy24, PayU) first.

## Before you sell anything

- [ ] **Have a Polish consumer-law specialist review the four legal pages.**
      They are substantive drafts, not lawyer-reviewed. Each carries a
      `DO WERYFIKACJI` banner explaining what needs checking. The most
      important clause is the hygiene exclusion from the 14-day withdrawal
      right in `returns.html` — get that wording right.
- [ ] **Insert your company details** — registered name, address, NIP, REGON
      (and KRS if applicable). Polish law requires these to be displayed;
      they're marked as placeholders in `terms.html` and `privacy.html`.
- [ ] **Polish-language versions.** The site is in English. Your customers are
      Polish consumers, and consumer-facing legal terms should be in a language
      they understand. This is an ASSUMPTION worth confirming — say the word
      and the whole site can be translated.
- [ ] **Product photography.** Every image is a placeholder. This is now the
      single biggest gap — a catalogue of grey boxes won't convert.
- [ ] **Real inventory.** Names, prices, materials, and copy in `catalog.js`
      are stand-ins. Prices are PLN gross.
- [ ] Swap `hello@rosenoir.pl`, `returns@rosenoir.pl`, `privacy@rosenoir.pl`
      for real inboxes.
- [ ] Register the neutral billing descriptor with your acquirer, and confirm
      the exact wording is permitted.

## Verified

Rendered headless at 1440px and 390px: catalogue filters, cart add/quantity/
remove/persistence across navigation, free-delivery threshold, missing-product
fallback, all four legal pages, no console errors, no horizontal overflow.

## Tło Premium (obsydian, reagujące na kursor)

Pliki: `premium-bg.css`, `premium-bg.js`, demo w `premium.html`,
port React/Next.js w `PremiumBackground.jsx`.

Wpięcie na dowolnej stronie — dwie linijki, moduł sam buduje swoje warstwy:

```html
<link rel="stylesheet" href="premium-bg.css">
<script src="premium-bg.js" defer></script>
```

Treść powinna mieć `position: relative` (albo klasę `.pbg-content`), żeby
znalazła się nad płytą.

**Wdrożenie na OnePage:** wklej zawartość `premium-bg.css` do sekcji custom CSS,
a zawartość `premium-bg.js` do custom JS / bloku HTML jako `<script>`. Nie ma
zależności ani odwołań do zewnętrznych plików, więc nie wymaga hostingu assetów.

**Strojenie** — `window.PremiumBackground.config`:

| Parametr | Domyślnie | Co robi |
|---|---|---|
| `near.stiffness` | `0.050` | jak szybko bliższe odbicie goni kursor |
| `far.stiffness` | `0.032` | dalsza warstwa; różnica względem `near` tworzy głębię |
| `epsilon` | `1.0` | poniżej tego ruchu sprężyna przyciąga się do celu i pętla zasypia |
| `--pbg-reflect-a` | `0.065` | szczytowe krycie odbicia (trzymaj w paśmie 5–8%) |
| `--pbg-reflect-w/h` | `1400/900px` | rozmiar odbicia |

**Zmierzone** (headless Chromium): ruch kursora daje **0 przeliczeń układu** —
przesuwanie odbywa się wyłącznie przez `translate3d`, czyli na kompozytorze.
Sprężyna uspokaja się po **80 klatkach (~1,3 s przy 60 fps)** i pętla `rAF`
całkowicie zasypia — przy nieruchomym kursorze nie zużywa ani jednej klatki.
Brak myszy → statyczny dryf w CSS. `prefers-reduced-motion` → wszystko zamiera.
