# Auranomics — Launch-today runbook

Cel: dojść dziś do statusu **"Waiting for Review"** w App Store Connect. To jest jedyna część "wydania dzisiaj", którą realnie kontrolujesz — sam review Apple (zwykle 24-48h, czasem szybciej) jest poza Twoją kontrolą.

**Twarda prawda:** ja (Claude, w tej sesji) nie mam dostępu do macOS/Xcode, więc nie mogę sam skompilować ani wysłać binarki. Enrollment w Apple Developer Program musi być zrobiony przez Ciebie — wymaga Twojej tożsamości i płatności, prawnie nie mogę tego zrobić za Ciebie. Wszystko poniżej jest zaprojektowane tak, żebyś Ty wykonał minimum klików, a ja przygotowałem za Ciebie całą resztę (kod, teksty, strony prawne).

---

## Krok 0 — sprawdź, gdzie stoisz

- **Masz Maca + już masz konto Apple Developer Program?** → idź do Ścieżki A, możesz submitować dziś w ~2-3h.
- **Masz Maca, ale nie masz jeszcze Developer Program?** → idź do Ścieżki B (enrollment zwykle jest dziś, czasem weryfikacja trwa do 48h — to jedyny element poza Twoją kontrolą).
- **Nie masz Maca w ogóle?** → idź do Ścieżki C.

---

## Ścieżka A — masz Maca i konto Developer

1. Otwórz Xcode → New Project → iOS → App → SwiftUI → iOS 17.0 min. Bundle ID: `com.codeofreality.auranomics` (albo swój, jeśli masz inny team/entity).
2. Przeciągnij folder `ios/Auranomics/Auranomics/` z tego repo do projektu (Copy items if needed, Create groups). Skasuj domyślny `ContentView.swift`/`Item.swift`.
3. Signing & Capabilities → wybierz swój Team → niech Xcode sam zarządza podpisywaniem.
3a. Product → Scheme → Edit Scheme → Options → StoreKit Configuration → wybierz `Auranomics.storekit` (jest w repo obok folderu `Auranomics/`) — pozwala testować prawdziwy flow zakupu w symulatorze bez czekania na App Store Connect.
4. ⌘R na symulatorze — sprawdź, że wszystko działa (onboarding → log → reveal → share → paywall z realnym zakupem testowym → restore purchases → settings).
5. Dodaj prawdziwą ikonę 1024×1024 do `Assets.xcassets/AppIcon.appiconset` (bez alpha channel).
6. W App Store Connect (appstoreconnect.apple.com) → My Apps → "+" → New App. Wklej dane z sekcji **"Copy do App Store Connect"** poniżej.
7. App Store Connect → Features → In-App Purchases → utwórz 3 produkty z ID dokładnie takimi jak w `ios/Auranomics/Auranomics/Support/Constants.swift` (`Constants.IAP`): monthly, yearly, lifetime. Ceny wg Części 4 `docs/STRATEGY.md` (19,99 / 99,99 / 149 zł).
8. Zrób 5 screenshotów (Simulator → iPhone 16 Pro Max, ⌘S w kluczowych momentach: reveal, home, share card, timeline, paywall) — dokładny plan w `docs/STRATEGY.md` Część 5.
9. Xcode → Product → Archive → Distribute App → App Store Connect → Upload.
10. W App Store Connect uzupełnij metadane (sekcja niżej), podepnij build, zaznacz IAP-y, kliknij **Submit for Review**.

## Ścieżka B — masz Maca, ale bez Developer Program

1. Zapisz się na developer.apple.com/programs (99 USD/rok, Twój Apple ID, dane płatności) — dla osoby fizycznej zwykle zatwierdzenie jest natychmiastowe lub w kilka godzin.
2. W międzyczasie (czekając na zatwierdzenie): zrób kroki 1-5 ze Ścieżki A (setup Xcode, wklejenie kodu, ikona) — to nie wymaga jeszcze aktywnego konta.
3. Gdy dostaniesz potwierdzenie enrollmentu → wróć do Ścieżki A, krok 3.

## Ścieżka C — nie masz Maca

Realistycznie **nie zbudujesz i nie wyślesz binarki bez macOS** — to twardy wymóg Apple (Xcode działa tylko na macOS). Opcje na dziś:
- **Chmurowy Mac na godziny** — usługi typu MacinCloud / MacStadium dają dostęp do macOS + Xcode w przeglądarce za ~20-30 USD/mies. lub opłatę godzinową. To jedyna droga do realnego submission dzisiaj bez własnego sprzętu. *(Wymaga Twojej płatności — nie robię tego bez Twojej zgody, ale to najszybsza opcja.)*
- **Pożycz/wynajmij Maca** na 3-4 godziny (znajomy, coworking, Apple Store nie pozwoli na to, ale np. hackerspace w Warszawie może).
- Jeśli żadne z powyższych nie wchodzi dziś w grę: zamiast "submit dzisiaj" zrób dziś wszystko, co nie wymaga Maca — punkt niżej.

### Co możesz zrobić DZIŚ bez Maca (żeby jutro submit trwał 15 minut)
- Włącz hosting stron prawnych (patrz sekcja "Strony prawne" niżej) — 2 minuty.
- Zapisz się na Apple Developer Program już teraz (nie wymaga Maca, tylko przeglądarki) — Ścieżka B, krok 1.
- Nagraj i wypuść pierwszy TikTok/Reel pokazujący koncept (możesz nagrać ekran telefonu z appką odpaloną przez kogoś z Makiem, albo zrobić teaser na podstawie zrzutów ekranu z tego repo).
- Postaw landing page (już gotowy w `docs/site/index.html`) i zbieraj zainteresowanie.
- Znajdź na jutro dostęp do Maca (Ścieżka A/B pkt 2-3 dnia).

---

## Strony prawne — włącz hosting (2 minuty)

Pliki są już w repo: `docs/site/index.html`, `privacy.html`, `terms.html`, `support.html`.

**Najszybciej (0 sekund setupu, zero konta):** wejdź na [app.netlify.com/drop](https://app.netlify.com/drop) i przeciągnij folder `docs/site/` — dostaniesz żywy link w 10 sekund. Podmień URL-e w `Constants.swift` na ten link (albo zostaw domyślne GitHub Pages, jeśli wolisz Krok 2 niżej — Netlify Drop jest tylko na "dziś", do stałego adresu wróć do GitHub Pages).

**Docelowo (GitHub Pages, trwały link):** repo → Settings → Pages → Source: "Deploy from a branch" → Branch: `main` (po zmergowaniu PR #1) → Folder: `/docs` → Save. Po ~1 minucie strony będą żyć pod `https://obsceneaddict.github.io/anthropic-claude-code/site/privacy.html` (dokładnie ten adres jest już wpisany w kodzie w `Constants.swift`). Jeśli repo jest prywatne: GitHub Pages z prywatnego repo wymaga płatnego planu GitHub — w takim wypadku użyj Netlify (darmowe, działa z prywatnymi repo po zalogowaniu) albo ustaw repo na public.

Apple **wymaga działającego linku do Privacy Policy** przy submission — zrób to przed krokiem 6 w Ścieżce A.

---

## Copy do App Store Connect (wklej 1:1)

- **Name:** Auranomics
- **Subtitle:** Track your aura, daily
- **Category:** Lifestyle (secondary: Entertainment)
- **Age Rating:** 12+ (kwestionariusz w App Store Connect — zaznacz "Mature/Suggestive Themes: None", "Profanity: Infrequent/Mild" jeśli dopuszczasz swobodne wpisy własne użytkowników)
- **Privacy Policy URL:** (link z sekcji wyżej)
- **Support URL:** (link z sekcji wyżej, `support.html`)
- **Keywords:** `aura,aura points,aura farming,vibe tracker,streak,gen z,mood tracker,journal,self improvement,glow up`
- **Promotional text:**
  > Every move changes your aura. Log it, flex it, share it.
- **Description:**
  ```
  Confidence, cringe, chaos, love — your day is full of aura-changing moments. Auranomics turns them into points.

  • Log a moment in one tap from the quick library, or type your own
  • Get an instant, animated aura score — good or brutal
  • Build your streak and climb from Shadow to Legendary tier
  • Turn your best (or worst) moment into a shareable Aura Card

  No account. No ads. Your data stays on your phone.

  Auranomics Pro unlocks unlimited custom entries, full history, and premium card themes.
  ```
- **What's New (v1.0):** Welcome to Auranomics. Start tracking your aura today.
- **In-App Purchase names/prices:**
  - Auranomics Pro Monthly — `com.codeofreality.auranomics.pro.monthly` — 19,99 zł
  - Auranomics Pro Yearly — `com.codeofreality.auranomics.pro.yearly` — 99,99 zł
  - Auranomics Pro Lifetime — `com.codeofreality.auranomics.pro.lifetime` — 149 zł

---

## Zanim klikniesz Submit — 60-sekundowy check

- [ ] Privacy Policy URL faktycznie się otwiera (nie 404)
- [ ] `PaywallStore.swift` używa prawdziwego StoreKit 2 (już zaimplementowane — `Product.products`, `product.purchase()`, `Transaction.currentEntitlements`, `Transaction.updates`). Przetestuj zakup w symulatorze z dołączonym `Auranomics.storekit` (Product → Scheme → Edit Scheme → Options → StoreKit Configuration → wybierz `Auranomics.storekit`) **zanim** wyślesz do review — Apple wymaga realnie działającego IAP, nie mocka.
- [ ] W App Store Connect utworzone 3 produkty IAP ze statusem "Ready to Submit" i ID identycznymi jak w `Constants.IAP` — inaczej `Product.products(for:)` zwróci pustą listę na produkcji.
- [ ] Ikona aplikacji nie jest placeholderem
- [ ] Zrzuty ekranu pokazują faktyczny UI aplikacji, nie mockupy
- [ ] Opis nie obiecuje niczego, czego appka nie robi

## Zaraz po Submit (ten sam dzień)

Review trwa zwykle 24-48h — to czas, którego nie odzyskasz, więc nie czekaj bezczynnie:
1. Opublikuj landing page (`docs/site/index.html`) i zacznij zbierać zainteresowanie.
2. Nagraj i wrzuć pierwszy TikTok/Reel (patrz `docs/STRATEGY.md` Część 10) — buduj popyt, zanim appka będzie live, żeby dzień publikacji od razu miał ruch.
3. Skonfiguruj TestFlight i wyślij link do 10-20 znajomych — realny feedback, zero czekania na review.
