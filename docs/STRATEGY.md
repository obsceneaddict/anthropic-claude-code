# Auranomics — pełny plan produktowy, techniczny i biznesowy

*Przygotowane przez autonomicznego co-foundera. Data: 2026-07-09. Kod źródłowy MVP: [`ios/Auranomics/`](../ios/Auranomics/).*

**Wszystkie założenia rynkowe/cenowe/prawne oznaczone są jako ZAŁOŻENIE lub DO WERYFIKACJI — zatwierdź je przed realnym wydaniem pieniędzy, publikacją lub podpisaniem czegokolwiek.**

---

## CZĘŚĆ 1 — 30 pomysłów

Legenda kolumn: **Viral** (1-10) · **Mon.** = potencjał monetyzacji (1-10) · **MVP** = trudność MVP (1-10, niżej = łatwiej) · **AS ryzyko** = ryzyko odrzucenia w App Store (1-10) · **Solo** = nadaje się dla solo foundera · **BE** = wymaga backendu · **AI** = wymaga AI API · **Werdykt**.

| # | Nazwa | Opis / dla kogo / haczyk | Viral | Mon. | MVP | AS ryzyko | Koszt MVP | Czas | Solo | BE | AI | Największe ryzyko | Werdykt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | **Auranomics** | Gamifikowany tracker "aura points" (viralowy trend Gen Z, 378% wzrost #aurapoints, "Word of the Year 2025"). Loguj momenty dnia, dostajesz punkty, budujesz streak, wrzucasz shareable kartę. | 9 | 8 | 2 | 2 | 0 zł (własna praca) | 3-5 dni | Tak | Nie | Nie (opcjonalnie) | Trend może wygasnąć za 6-12 mies. | **TOP KANDYDAT** |
| 2 | RizzRate | Wklej swoją wiadomość/bio z randkówki, AI ocenia "rizz" 0-100 i sugeruje poprawki. | 8 | 7 | 4 | 3 | ~500 zł/mc API | 1-2 tyg. | Tak | Lekki (proxy) | Tak | Koszt API przy skalowaniu, jakość promptu | Rozważ |
| 3 | GlowUp Mirror | Selfie → wizualizacja "glow up" (AI image edit) na 4 tygodnie do przodu jako motywacja. | 9 | 8 | 7 | 7 | ~2000 zł/mc API | 3-4 tyg. | Nie do końca | Tak | Tak | Body image / health claims — ryzyko App Store i etyczne | Odrzucić (na start) |
| 4 | BioDoctor | AI przepisuje Twoje bio na Instagram/Tinder/LinkedIn pod dany cel (więcej matchy, więcej followersów). | 6 | 7 | 3 | 2 | ~300 zł/mc | 1 tydz. | Tak | Lekki | Tak | Niska wiralowość, mało "wow" | Rozważ |
| 5 | Aura Farming Cam | Nakładka AR/filtr do nagrywania "aura farming" clipów (styl NBA/TikTok slow-mo z efektami). | 8 | 5 | 8 | 3 | Wysoki (AR/wideo) | 4-6 tyg. | Nie | Możliwe | Nie | Trudny MVP wideo/AR w SwiftUI | Odrzucić (na start) |
| 6 | LonelyNoMore | Codzienny AI "companion" do rozmowy dla osób samotnych, z pamięcią kontekstu. | 5 | 8 | 6 | 6 | ~1500 zł/mc API | 3 tyg. | Tak | Tak | Tak | Ryzyko emocjonalnej zależności, ostrożne guidelines Apple ws. AI companion | Rozważ ostrożnie |
| 7 | RedFlagScan | Wklej opis osoby/czatu, AI wypisuje potencjalne "red flags" w związku. | 7 | 6 | 4 | 4 | ~400 zł/mc | 1-2 tyg. | Tak | Lekki | Tak | Możliwe fałszywe oskarżenia, odpowiedzialność za "porady" | Rozważ |
| 8 | StreakLife | Uniwersalny tracker nawyków ze streakami i pięknym UI (jak Auranomics, ale bez humoru/mema). | 4 | 6 | 2 | 1 | 0 zł | 3-5 dni | Tak | Nie | Nie | Rynek zdominowany (Streaks, Habitify) — brak wyróżnika | Odrzucić |
| 9 | DecisionDice | "Nie wiem co zrobić" — losowe, ale spersonalizowane sugestie decyzji (co zjeść, co ubrać, czy pisać do niej). | 6 | 4 | 2 | 1 | 0 zł | 3 dni | Tak | Nie | Nie | Niska monetyzacja, jednorazowy użytek | Odrzucić |
| 10 | ClosetAI | Skanujesz szafę, AI układa outfity i ocenia "fit score" na dziś. | 7 | 7 | 8 | 4 | Wysoki (vision) | 5-6 tyg. | Nie | Tak | Tak | Bardzo złożony MVP (segmentacja ubrań) | Odrzucić (na start) |
| 11 | TextTherapy | Wklej SMS-a od kogoś, AI tłumaczy "co on/ona naprawdę miał/a na myśli". | 8 | 6 | 3 | 3 | ~400 zł/mc | 1-2 tyg. | Tak | Lekki | Tak | Powtarzalność (jednorazowa ciekawostka) | Rozważ |
| 12 | AuraDex Pets | Wirtualne stworzonko, które rośnie/zmienia formę na podstawie Twoich "aura points". | 8 | 6 | 6 | 2 | Średni | 3-4 tyg. | Tak | Nie | Nie | Bardziej złożony niż punkt 1, wolniejszy launch | Rozważ (v2 Auranomics) |
| 13 | ExGraveyard | Anonimowe, prywatne "archiwum" wiadomości/wspomnień o eks, z automatycznym "closure ritual". | 6 | 5 | 3 | 4 | Niski | 1-2 tyg. | Tak | Nie | Nie | Wrażliwy temat emocjonalny, moderacja treści | Rozważ ostrożnie |
| 14 | FameMeter | Wklejasz link do social media, dostajesz "personal brand score" + plan poprawy. | 5 | 6 | 5 | 3 | Wymaga scrapingu | 3 tyg. | Nie | Tak | Tak | Scraping API innych platform = kruche i ryzykowne (ToS) | Odrzucić |
| 15 | CringeArchive | Anonimowe wrzucanie własnych "cringe" momentów, głosowanie społeczności, viral compilation. | 8 | 4 | 5 | 6 | Średni | 3 tyg. | Nie | Tak (moderacja) | Nie | UGC = moderacja treści, ryzyko nadużyć/hejtu | Odrzucić (na start) |
| 16 | MorningManifest | Codzienny rytuał: 3 zdania intencji + AI "energizująca" odpowiedź na dziś. | 5 | 6 | 3 | 4 | ~300 zł/mc | 1-2 tyg. | Tak | Lekki | Tak | Rynek "manifestacji" nasycony, ryzyko pseudo-zdrowotnych obietnic | Rozważ ostrożnie |
| 17 | SplitTheBill Aesthetic | Piękna, prosta appka do dzielenia rachunków ze znajomymi. | 3 | 5 | 2 | 1 | 0 zł | 3 dni | Tak | Nie | Nie | Zero efektu wow, brak wiralowości | Odrzucić |
| 18 | VibeCheck Widget | Widget na ekran główny pokazujący "vibe dnia" wygenerowany z pogody/kalendarza/pory dnia. | 6 | 4 | 5 | 1 | Niski | 2 tyg. | Tak | Nie | Nie | Widgety = niska retencja bez głównej aplikacji za nimi | Rozważ (feature, nie produkt) |
| 19 | ConfidenceCoach | Codzienne mikro-wyzwania budujące pewność siebie (np. "zagadaj do obcego") + tracking. | 5 | 6 | 3 | 2 | Niski | 1-2 tyg. | Tak | Nie | Nie | Podobne do istniejących appek self-improvement, mało unikalne | Rozważ |
| 20 | RoastMyFit | Wgraj zdjęcie outfitu, AI "roastuje" (żartobliwie) i ocenia styl. | 9 | 7 | 6 | 6 | Wysoki (vision) | 3-4 tyg. | Nie do końca | Tak | Tak | Ocena wizerunku/ciała = wrażliwe, wymaga bardzo starannego tonu | Rozważ ostrożnie (v2) |
| 21 | NightRoutine Glow | Wieczorny rytuał z pięknymi animacjami "kończenia dnia", journaling + sen. | 4 | 5 | 3 | 1 | Niski | 1-2 tyg. | Tak | Nie | Nie | Rynek wellness nasycony (Calm, Headspace) | Odrzucić |
| 22 | GroupChatMVP | Ranking "kto jest MVP tygodnia" w grupowym czacie znajomych — głosowanie, punkty. | 7 | 4 | 5 | 2 | Wymaga multi-user sync | 3-4 tyg. | Nie | Tak (sync) | Nie | Multiplayer od dnia 1 = wolniejszy MVP, potrzebuje krytycznej masy znajomych | Rozważ (v2) |
| 23 | PickMeOut | AI dobiera Ci strój na konkretną okazję na podstawie 3 zdjęć szafy. | 6 | 6 | 7 | 4 | Wysoki | 4 tyg. | Nie | Tak | Tak | Podobny do #10, złożony MVP | Odrzucić (na start) |
| 24 | LuckyDay | Codzienny "wskaźnik szczęścia" — losowy, ale piękny, z rytuałami na "podbicie" szczęścia. | 6 | 5 | 2 | 3 | Niski | 3-5 dni | Tak | Nie | Nie | Zbyt blisko "horoskopu" — ryzyko postrzegania jako pseudonauka | Rozważ ostrożnie |
| 25 | SocialBatteryTracker | Śledzenie poziomu energii społecznej introwertyków, sugestie kiedy potrzebujesz "recharge". | 5 | 5 | 3 | 1 | Niski | 1-2 tyg. | Tak | Nie | Nie | Nisza mniejsza niż "aura", wolniejszy wzrost organiczny | Rozważ |
| 26 | FirstImpressionAI | Nagraj 10-sek. wideo "przedstaw się", AI ocenia pierwsze wrażenie (ton, tempo, energia). | 7 | 7 | 7 | 5 | Wysoki (audio/video AI) | 4 tyg. | Nie | Tak | Tak | Analiza głosu/wideo = przetwarzanie danych biometrycznych, wysoka wrażliwość prywatności | Odrzucić (na start) |
| 27 | TinyWinsJournal | Minimalistyczny journal tylko "małych zwycięstw" dnia, z pięknymi kartami podsumowań. | 5 | 5 | 2 | 1 | Niski | 3-5 dni | Tak | Nie | Nie | Zbyt spokojne — brak silnego haczyka viralowego | Rozważ (inspiracja dla v2 Auranomics) |
| 28 | ExcuseGenerator | AI generuje śmieszne, kreatywne wymówki na każdą okazję, do wysłania/udostępnienia. | 7 | 3 | 2 | 3 | Niski | 3-5 dni | Tak | Nie | Tak | Zabawne, ale słaby model płatności (jednorazowa ciekawostka) | Odrzucić |
| 29 | AuraLeaderboard | Jak #1, ale multiplayer od startu — ranking aury wśród znajomych przez kody zaproszeń. | 8 | 7 | 6 | 3 | Wymaga lekkiego BE (sync kodów) | 3-4 tyg. | Częściowo | Tak (lekki) | Nie | Multiplayer = wolniejszy MVP, potrzeba density znajomych | Rozważ (v1.1 Auranomics) |
| 30 | PostBreakupReset | 21-dniowy "program resetu" po rozstaniu — codzienne mikro-zadania + tracking nastroju. | 5 | 7 | 3 | 3 | Niski | 1-2 tyg. | Tak | Nie | Nie | Wąska, sezonowa nisza; wymaga wrażliwego, przemyślanego tonu | Rozważ ostrożnie |

---

## CZĘŚĆ 2 — Wybór: **Auranomics** (#1)

**Dlaczego ten, a nie inne:**
- To jedyny pomysł, który łączy: MVP do zbudowania w 3-5 dni **bez backendu i bez AI API**, potwierdzony żywy trend kulturowy (nie wymyślony przeze mnie — realne dane: #aurapoints +378% m/m, "Aura" = Word of the Year 2025 wg WSJ, 2.3 mln wzmianek, 31.9 mld wyświetleń), oraz naturalny, wbudowany w koncept mechanizm dzielenia się (karta wyniku = gotowy content na TikToka/Instagram).
- Odrzucam pomysły oparte o analizę zdjęć/ciała/twarzy (#3, #10, #20, #23, #26) na start — wyższe ryzyko App Store, wyższy koszt (Vision API), wolniejszy MVP, i etycznie bardziej śliskie (oceny wizerunku). Zostawiam je jako możliwy kierunek v2, gdy będzie już baza użytkowników i budżet na ostrożne, przetestowane wdrożenie.
- Odrzucam pomysły "użyteczne, ale nudne" (#8, #17, #21) — brak efektu wow, zero potencjału TikTok, będą się gubić w zatłoczonych kategoriach.
- Odrzucam pomysły wymagające dużego backendu/multiplayer od dnia 1 (#22, #26) — złamią zasadę "szybki MVP solo founder".

**Kto będzie użytkownikiem:** 16-27 lat, aktywni na TikToku/Instagramie, znają już słowo "aura" z memów, chcą narzędzia, które nazywa i gamifikuje to, co już robią (żartobliwe komentowanie własnego dnia).

**Kto zapłaci i za co:** najbardziej zaangażowani użytkownicy (top ~3-5% jak w każdym freemium) płacą za brak limitu wpisów własnych, pełną historię, ładniejsze karty do udostępniania (status/estetyka > funkcjonalność) i cotygodniowy "Aura Wrapped".

**Dlaczego użytkownik wróci:** streak + naturalna potrzeba "rozliczenia dnia" (jak w dzienniku, ale zabawnie) + ciekawość "ile mam dzisiaj punktów".

**Haczyk:** slang, który już wygrywa organicznie w internecie — aplikacja nie tworzy trendu, tylko go dosiada.

**Moment wow:** pełnoekranowa, kinowa animacja "+2500 AURA" z hapticiem i poświatą w kolorze tier'a, zaraz po zalogowaniu wydarzenia — to ma się dziać w pierwszych 60 sekundach użycia.

**Co będzie w pierwszym viralowym wideo:** ktoś nagrywa ekran, jak loguje absurdalny moment dnia ("spóźniłem się na autobus o 2 sekundy -900") i pokazuje reakcję aplikacji + finalną kartę do udostępnienia.

**Jak zarobić pierwsze 1000 zł:** ~50 płacących użytkowników rocznego planu (99,99 zł) lub ~200 miesięcznych — realistyczne przy nawet skromnym, ale prawdziwie viralowym uruchomieniu na TikToku (patrz Część 10).

**Jak dojść do 10 000 zł/mc:** ok. 500 aktywnych subskrybentów miesięcznych (przy mieszance planów, ARPU ~20 zł) — do osiągnięcia przy kilkudziesięciu tysiącach organicznych instalacji i konwersji free→paid na poziomie 2-4%, co jest realne dla dobrze zaprojektowanego paywalla w kategorii lifestyle/social.

**Co musiałoby się wydarzyć, żeby to był duży biznes:** jedno viralowe wideo z dużym zasięgiem (>1M wyświetleń) w pierwszych 30 dniach + dodanie mechaniki multiplayer (ranking wśród znajomych, #29 z listy) w wersji 1.1, co zmienia produkt z narzędzia solo w sieć społecznościową.

---

## CZĘŚĆ 3 — Definicja produktu

### 3.1 Nazwa

30 propozycji: Auranomics, Aurafolio, AuraTally, AuraDex, Aurastack, AuraLedger, Aurable, Auralog, AuraLoop, AuraQuest, Aurameter, AuraWorks, Aurafy, Aurabase, AuraLevel, AuraPoints Daily, MyAuraScore, VibePoints, AuraGains, AuraDrift, AuraCurve, AuraVault, AuraCircuit, Aurastat, AuraFrame, AuraTrail, AuraSignal, AuraNet, AuraKit, AuraForm.

**Wybrana: Auranomics.** Sugeruje żartobliwie "ekonomię aury" (dokładnie tak, jak trend jest już opisywany w internecie: "aura farming", "aura economy") — zapadająca w pamięć, unikalna, nie koliduje wprost z dużymi markami (w przeciwieństwie do samego słowa "Aura", zajętego przez Aura — firmę od ochrony tożsamości, i Aura Health).

**5 alternatyw:** Aurafolio, AuraTally, Aurable, AuraLoop, AuraDex.

**Sprawdzenie pod kątem kopii dużej marki:** "Auranomics" nie jest używane przez żadną znaną, dużą markę (DO WERYFIKACJI: pełne wyszukiwanie w App Store + USPTO/EUIPO przed rejestracją firmy/domeny — ja nie mam dostępu do żywej bazy znaków towarowych).

**Ocena:**
- App Store: unikalna fraza, dobrze się indeksuje pod "aura points", "aura tracker".
- TikTok/Instagram: łatwy hashtag `#auranomics`, dobrze współgra z istniejącym `#aurapoints` / `#auratrend`.
- Domena: `auranomics.app` — DO WERYFIKACJI dostępność.

### 3.2 One-liner
"Every move you make changes your aura. Track it."

### 3.3 Elevator pitch
Dla użytkownika: Auranomics zamienia Twój dzień w grę — logujesz momenty (dobre i żenujące), dostajesz punkty aury, budujesz streak i wrzucasz wynik na Instagram/TikTok. Dla inwestora: produkt dosiada już trwający, mierzalny trend kulturowy (Word of the Year 2025 wg WSJ), ma zero-backendowy, tani do utrzymania MVP, wbudowaną pętlę wiralową (każdy udostępniony wynik to reklama appki) i jasny model subskrypcyjny od dnia 1.

### 3.4 Główna obietnica
Po pierwszym uruchomieniu użytkownik w mniej niż 60 sekund loguje swój pierwszy "moment" i widzi kinową animację przyznania punktów — natychmiastowa gratyfikacja, zero setupu.

### 3.5 Moment wow
Pełnoekranowa animacja wyniku (`AuraRevealView`) z dużą, świecącą liczbą punktów, kolorem i hapticiem dopasowanym do skali zdarzenia ("LEGENDARY AURA GAIN" przy dużych plusach) — to ten moment użytkownik nagrywa i wysyła znajomym.

### 3.6 Główna pętla produktu
Otwórz app → wybierz/napisz moment → dostajesz natychmiastowy wynik (reveal) → zapisuje się do dzisiejszej osi czasu → jednym tapem robisz shareable kartę → wracasz jutro, bo streak i ciekawość "ile mam dziś" → w end tygodnia widzisz "Aura Wrapped" i naturalnie trafiasz na paywall (pełna historia, więcej wpisów własnych).

### 3.7 MVP (dokładnie 5 funkcji)
1. Szybkie logowanie zdarzeń z gotowej biblioteki (preset events).
2. Logowanie własnego tekstu z automatyczną (on-device, regułową) wyceną punktów.
3. Pełnoekranowy "reveal" wyniku z animacją i hapticiem.
4. Dzisiejsza oś czasu + total score + tier + streak.
5. Generowanie i udostępnianie karty wyniku (share sheet).

### 3.8 Nie-MVP (świadomie odłożone)
- Multiplayer / ranking znajomych (mocny kandydat na v1.1, patrz Część 2).
- AI-generowana wycena zdarzeń przez zewnętrzne API (Część 8 — wariant B).
- Widgety na ekran główny / Live Activities.
- Powiadomienia push.
- Logowanie/konto w chmurze, sync między urządzeniami.
- Wirtualne "zwierzątko aury" (#12 z listy pomysłów).
- Analiza zdjęć/wizerunku w jakiejkolwiek formie.

---

## CZĘŚĆ 4 — Monetyzacja

**Model: freemium subskrypcja**, bez reklam (czyste demo premium, zero szumu wizualnego).

1. **Darmowe:** biblioteka presetów bez limitu, 3 własne (tekstowe) wpisy dziennie, 7 dni historii, podstawowy motyw karty.
2. **Płatne (Auranomics Pro):** nielimitowane własne wpisy, pełna historia, premium motywy kart, cotygodniowy "Aura Wrapped", własne kategorie (later).
3. **Kiedy paywall:** (a) przy 4. własnym wpisie tego dnia, (b) przy próbie zobaczenia historii starszej niż 7 dni, (c) miękkie przypomnienie w Ustawieniach.
4. **Wygląd paywalla:** pełnoekranowy, lista korzyści, 3 warianty cen, przycisk "Restore Purchases", linki Terms/Privacy — patrz `PaywallView.swift`.
5. **Ceny miesięczne:** 19,99 zł / 4,99 USD / 4,99 EUR (ZAŁOŻENIE, do testów).
6. **Ceny roczne:** 99,99 zł / 24,99 USD / 24,99 EUR (~58% taniej niż 12× miesięczna).
7. **Lifetime:** 149 zł / 34,99 USD / 34,99 EUR — daje pewność pierwszego przychodu od "power userów" nieufnych wobec subskrypcji.
8. **3 warianty testów cenowych:** (A) 19,99/99,99/149 zł — bazowy; (B) niżej wejściowo 14,99 zł/mc, wyżej rocznie 119,99 zł (push w stronę rocznej); (C) bez lifetime, tylko miesięczna/roczna (upraszcza decyzję, testuje czy lifetime kanibalizuje roczną).
9. **Zwiększenie konwersji:** pokazywać paywall dopiero PO pierwszym momencie wow (nie na starcie), domyślnie zaznaczony plan roczny z badge "BEST VALUE", jasne "restore purchases".
10. **Jak nie wkurzyć użytkownika:** limit darmowy (3 wpisy/dzień) jest hojny, nie blokuje głównej pętli (presety zawsze darmowe), paywall pokazuje się w naturalnych momentach, nie co uruchomienie.
11. **Unikanie dark patterns:** brak fałszywych liczników "zostały 2 miejsca", brak ukrytego auto-odnowienia bez jasnej informacji o cenie, łatwy "Restore Purchases" i link do zarządzania subskrypcją w Ustawieniach systemowych.
12. **Pierwsze 100 zł:** 1-5 subskrypcji miesięcznych z pierwszej fali organicznych instalacji po pierwszym poście TikTok.
13. **Pierwsze 1000 zł:** patrz Część 2 — ~50 rocznych lub ~200 miesięcznych użytkowników.
14. **Poziom "utrzymania się w Warszawie"** (ZAŁOŻENIE: cel netto ~6000-8000 zł/mc): przy ARPU ~20 zł/mc potrzeba ok. 300-400 aktywnych subskrybentów — realny cel na 3-6 miesięcy przy konsekwentnym content marketingu, nie przy jednym poście.
15. **Metryki od dnia 1:** D1/D7/D30 retention, % użytkowników którzy logują ≥1 zdarzenie w pierwszej sesji (activation), % dotarcia do paywalla, konwersja paywall→zakup, źródło instalacji (UTM z linków w bio TikTok), liczba wygenerowanych kart do udostępnienia na użytkownika.

---

## CZĘŚĆ 5 — Design i UX

**Styl:** dark luxury / glassmorphism — czarne tło (`#0A0A0F`), dryfujące radialne poświaty w kolorze aktualnego tieru, karty na `.ultraThinMaterial` z subtelnym gradientowym obramowaniem, duża zaokrąglona typografia `rounded design`, cienie i blask dopasowane do koloru zdarzenia (zielony = zysk, czerwony = strata, złoty = legendarny). Zaimplementowane w `GradientBackground.swift` i `GlassCard.swift`.

**User flow:** Onboarding (3 karty) → Home (ring + dziś) → tap "+" → wybór presetu lub własny tekst → pełnoekranowy Reveal → opcjonalny Share Card → powrót do Home → zakładki History / Settings.

**Ekrany:** Onboarding, Home (ring + statystyki + oś czasu), Log Event (presety/custom), Aura Reveal (wow moment), Share Card, History (tygodniowy recap + oś dni), Paywall, Settings.

**Komponenty UI:** `GlassCard`, `PrimaryButtonStyle`/`SecondaryButtonStyle`, `AuraCountText` (animowany licznik), `AuraRingView` (pierścień postępu tieru), `AuraEventRow`.

**Kolory:** tło `#0A0A0F`; tiery: Shadow `#3A3A45→#1C1C22`, Flicker `#6C6CE5→#2E2E7A`, Glow `#5AC8FA→#4A6CF7`, Radiant `#FF5AA5→#A66CFF`, Legendary `#FFD34D→#FF8A3D`; zysk `#6CFFB0`, strata `#FF6C6C`.

**Fonty:** systemowy SF Pro / `.rounded` design (zero fontów zewnętrznych — zero zależności, zero problemów licencyjnych).

**Animacje / micro-interactions:** `.spring()` na przyciskach (scale on press), `contentTransition(.numericText)` na liczbach, dryfujący gradient tła (`repeatForever`), haptic sukces/ostrzeżenie dopasowany do znaku zdarzenia.

**Empty / loading / error states:** `EmptyStateView`, `LoadingView`, `InlineErrorView` — spójne, w stylu appki, nigdy gołe systemowe komunikaty.

**Paywall, Settings, ekran wyniku, ekran udostępniania:** patrz odpowiednie pliki w `ios/Auranomics/Auranomics/Views/`.

**App Store screenshots (koncepcja):** 1) Reveal ze "+2500 LEGENDARY AURA GAIN", 2) Home z ringiem i tierem, 3) Share Card gotowa do posta, 4) oś czasu dnia pełna zdarzeń, 5) paywall/premium motywy.

**App Preview Video (koncepcja):** 15 sek.: telefon w ręce → log zdarzenia → wow reveal → udostępnienie na Instagram Story w czasie rzeczywistym, szybkie cięcia w rytm trendującego dźwięku.

---

## CZĘŚĆ 6-7 — Tech stack i kod MVP

**Stack:** SwiftUI, iOS 17+, MVVM (`@Observable` view modele), zero zależności zewnętrznych, zero backendu — trwały zapis lokalny w pliku JSON w `Documents/`. StoreKit 2 przygotowany do podpięcia (na razie mock w `PaywallStore`, patrz TODO w kodzie). Analytics przygotowane jako protokół (`AnalyticsServicing`) z domyślną implementacją konsolową — podmiana na realny SDK to jedna linijka.

**Pełny kod źródłowy** (gotowy do wklejenia do Xcode) znajduje się w [`ios/Auranomics/`](../ios/Auranomics/) — struktura projektu, wszystkie modele, widoki, view modele i serwisy, plus instrukcja uruchomienia krok po kroku w `ios/Auranomics/README.md`.

Struktura:
```
Auranomics/
  AuranomicsApp.swift
  Models/            AuraEvent, AuraCategory, AuraTier
  Data/              PresetEventLibrary
  Services/          AuraRepository, AuraScoringEngine, PaywallStore,
                      HapticsService, ShareImageRenderer, AnalyticsService
  ViewModels/        HomeViewModel, LogEventViewModel, HistoryViewModel, PaywallViewModel
  Views/
    Onboarding/      OnboardingView
    Home/            HomeView, AuraRingView, TodayTimelineView
    LogEvent/        LogEventView, QuickEventGridView, CustomEventInputView
    Result/          AuraRevealView
    History/         HistoryView, WeeklyRecapView
    ShareCard/       AuraShareCardView
    Paywall/         PaywallView
    Settings/        SettingsView
    Components/      GradientBackground, GlassCard, PrimaryButton, AuraCountText, EmptyLoadingErrorStates
    RootTabView.swift
  Support/           Constants.swift
  Assets.xcassets/
```

---

## CZĘŚĆ 8 — AI: wariant z API i bez API

**Wariant bez API (wybrany na start):** `AuraScoringEngine.swift` — deterministyczny, regułowy silnik on-device: słownik słów pozytywnych/negatywnych, mnożnik na podstawie interpunkcji/emfazy, i deterministyczny "vibe roll" oparty o hash tekstu dla wpisów bez słów kluczowych (to samo zdanie zawsze dostaje ten sam wynik — czuć intencjonalność, nie losowość). Zero kosztu, zero opóźnienia, zero ryzyka wycieku danych.

**Dlaczego wariant bez API na start:** MVP musi działać natychmiast po instalacji, offline, bez kosztów zmiennych rosnących z liczbą użytkowników — kluczowe przy niepewnym, wczesnym etapie monetyzacji.

**Wariant z API (Faza 2, gdy jest już baza płacących użytkowników):** wywołanie LLM (np. Claude Haiku/Sonnet) do oceny dowolnego tekstu z dużo lepszym "poczuciem humoru" i kontekstem.

Bezpieczna architektura: **nigdy nie trzymaj klucza API w aplikacji.** Prosty backend-proxy (np. jedna funkcja Cloudflare Worker / Vercel Edge Function) przyjmuje tekst od aplikacji, dokleja klucz po stronie serwera, woła model, zwraca tylko JSON `{points, category}`. Aplikacja rozmawia wyłącznie z Twoim proxy przez HTTPS.

System prompt (szkic):
```
You are the scoring engine for a gamified "aura points" journaling app.
Given a short first-person sentence describing something that happened today,
return ONLY JSON: {"points": <integer -3000..3000>, "category": "confidence|social|love|chaos|fails"}.
Be funny, Gen-Z-coded, and decisive. Never explain. Never refuse a benign entry.
```

Prompt użytkownika: surowy tekst wpisu (np. "spilled coffee on myself before a meeting").

**Zabezpieczenia treści:** filtr słów niedozwolonych przed wysłaniem do modelu i przed eksportem na kartę do udostępnienia (dane wrażliwe, mowa nienawiści, dane osobowe osób trzecich — nie wysyłamy, nie renderujemy).

**Limity kosztów:** cache identycznych zapytań (hash tekstu), twardy limit np. 50 wywołań API/użytkownika/dzień nawet dla Pro, fallback na silnik lokalny po przekroczeniu limitu lub błędzie sieci.

**Fallback / mock responses:** jeśli proxy nie odpowie w 2 sekundy lub zwróci błąd, aplikacja bezszwowo przełącza się na `AuraScoringEngine` lokalny — użytkownik nigdy nie widzi błędu, tylko odrobinę mniej "inteligentną" wycenę.

---

## CZĘŚĆ 9 — Pakiet App Store

*Wersja skrócona/paste-ready do wklejenia bezpośrednio w App Store Connect, plus krok-po-kroku runbook na dziś: [`docs/LAUNCH_TODAY.md`](LAUNCH_TODAY.md).*

1. **Nazwa:** Auranomics
2. **Subtitle:** Track your aura, daily
3. **Promotional text:** Every move changes your aura. Log it, flex it, share it.
4. **Description (szkic):**
   > Confidence, cringe, chaos, love — your day is full of aura-changing moments. Auranomics turns them into points.
   >
   > • Log a moment in one tap from the quick library, or type your own
   > • Get an instant, animated aura score — good or brutal
   > • Build your streak and climb from Shadow to Legendary tier
   > • Turn your best (or worst) moment into a shareable Aura Card
   >
   > No account. No ads. Your data stays on your phone.
   >
   > Auranomics Pro unlocks unlimited custom entries, full history, and premium card themes.
5. **Keywords:** aura,aura points,aura farming,vibe tracker,streak,gen z,mood tracker,journal,self improvement,glow up
6. **What's New (v1.0):** Welcome to Auranomics. Start tracking your aura today.
7. **Kategoria:** Lifestyle (drugorzędna: Health & Fitness → *DO WERYFIKACJI*, może lepiej Entertainment ze względu na żartobliwy ton).
8. **Age rating:** 12+ (ZAŁOŻENIE — swobodny/żartobliwy język w przykładach; brak treści dla dorosłych, brak UGC widocznego publicznie w MVP).
9. **Privacy nutrition label (szkic):** Data Not Collected — wszystko lokalnie na urządzeniu w MVP (żadnego trackingu, żadnego backendu). Gdy dojdzie prawdziwy analytics SDK, zaktualizować o kategorię "Usage Data" powiązaną z użytkownikiem lub nie, zależnie od SDK.
10. **Support URL:** `https://obsceneaddict.github.io/anthropic-claude-code/site/support.html` — realna strona, źródło w `docs/site/support.html` (patrz `docs/LAUNCH_TODAY.md` po instrukcję włączenia hostingu).
11. **Marketing URL:** `https://obsceneaddict.github.io/anthropic-claude-code/site/index.html` — źródło w `docs/site/index.html`.
12. **Polityka prywatności:** pełna wersja gotowa do publikacji w `docs/site/privacy.html` (realny link: `.../site/privacy.html`) — treść odzwierciedla faktyczne zachowanie appki (brak backendu, dane tylko lokalnie, IAP przez Apple). *DO WERYFIKACJI przez prawnika przed publikacją.*
13. **Terms of use:** pełna wersja gotowa do publikacji w `docs/site/terms.html`. *DO WERYFIKACJI przez prawnika przed publikacją.*
14. **Screenshots plan / 15. App preview video plan:** patrz Część 5.
16. **Potencjalne powody odrzucenia:** (a) niejasność co IAP faktycznie odblokowuje — musi być 1:1 zgodne z paywallem, (b) brak działającego "Restore Purchases", (c) metadane sugerujące realne porady zdrowotne/psychologiczne, (d) placeholdery (Lorem ipsum, "DO WERYFIKACJI") widoczne w buildzie wysłanym do review.
17. **Jak ich uniknąć:** przetestować pełny flow zakupu w Sandboxie przed wysyłką, usunąć wszystkie placeholdery tekstowe, jasno oznaczyć appkę jako rozrywkową/self-improvement, nie jako zdrowotną.
18. **Checklist zgodności (skrót, Guideline 2.x/3.x):** ☐ IAP przez StoreKit, zero zewnętrznych linków płatności ☐ jasny opis co jest darmowe/płatne ☐ Restore Purchases działa ☐ Privacy Policy URL działa i jest aktualny ☐ brak fałszywych/przesadzonych obietnic w opisie ☐ ikona i screenshoty zgodne z faktycznym UI.
19. **Do zweryfikowania przed wysyłką:** realny bundle ID i certyfikaty podpisywania, realne produkty IAP utworzone i "Ready to Submit" w App Store Connect, realne URL-e polityki prywatności/wsparcia (nie placeholdery), test na fizycznym urządzeniu (nie tylko symulator).

---

## CZĘŚĆ 10 — Marketing i growth (plan 30 dni)

**Kanały:** TikTok (główny), Instagram Reels (repost tego samego contentu), X, Reddit (r/GenZ, r/AppIdeas — bez spamu, tylko wartościowe posty "zbudowałem to"), Product Hunt (launch day), organiczny content + mikroinfluencerzy.

**50 pomysłów na TikToki/Reels (skrót po kategoriach, rozwijaj dowolny w pełne scenariusze):**
Codzienne logowanie absurdalnych momentów (x10) · "Ranking mojego tygodnia w aurze" (x5) · POV nagłego -2000 na oczach kamery (x5) · reakcje znajomych na ich wynik aury (x5) · "rate your ex's aura" format (x3) · "zgadnij ile punktów to jest warte" quiz z widzami (x5) · founder-story "zbudowałem appkę w 3 dni bo trend mnie wkurzył" (x3) · przed/po dnia (rano Shadow, wieczorem Radiant) (x5) · duety z popularnymi "aura" filtrami (x5) · najlepsze/najgorsze zgłoszenia od community (x4).

**30 hooków (przykłady):** "POV: twoja aura właśnie spadła o 2000 punktów" / "Zbudowałem appkę, która ocenia twój dzień" / "Nie wierzysz w aurę? Ta appka właśnie cię zbanowała" / "Straciłem całą swoją aurę w 3 sekundy" / "To jest dokładnie to, o czym mówił WSJ" / +25 wariacji na bazie tych wzorców.

**20 caption / 20 CTA:** captions typu "current aura: humbled 💀" / "we do not recover from this L" ; CTA typu "rate your day →" / "log your aura before midnight" / "link in bio, 0zł to start".

**10 scenariuszy 15s / 10 scenariuszy 30s:** krótkie = jeden moment → reveal → reakcja; dłuższe = cały dzień w timelapie zakończony kartą tygodniową.

**10 pomysłów na screenshoty / 10 na organiczne reklamy bez budżetu:** collab z 5-10 mikroinfluencerami (bary 1k-20k followers) za wczesny dostęp + kod promo zamiast pieniędzy; posty w społecznościach studenckich; własny "duet challenge".

**10 miejsc na legalną prezentację:** TikTok, Instagram, X, Product Hunt, Reddit (zgodnie z zasadami subreddita), Discord serwery indie-dev, Threads, lokalne grupy FB dla studentów w Warszawie, newslettery indie hackers (np. Starter Story, Indie Hackers forum), własna landing page z waitlistą.

**5 eksperymentów viralowych:** (1) "aura battle" — dwie osoby porównują wynik na koniec dnia, (2) wyzwanie 7 dni streak z publicznym pokazywaniem wyniku, (3) collab z 1 mikroinfluencerem na ekskluzywny "early access" kod, (4) reakcja na trendujący dźwięk z realnym demo appki, (5) "zgadnij wynik" quiz w komentarzach.

**5 mechanik udostępniania w appce:** karta wyniku (już w MVP), karta tygodniowego recapu, "wyzwij znajomego" link (v1.1), watermark appki na każdej karcie, opcjonalny format 1:1 pod feed vs 9:16 pod Story.

**5 powodów pokazania appce znajomemu:** żeby się pochwalić dużym plusem, żeby się pośmiać z L-a, żeby porównać wyniki, bo wygląda "z przyszłości", bo pasuje do już trendującego memu.

**5 pomysłów na launch stunt (bez łamania regulaminów):** dzień "Aura Farming Challenge" z hashtagiem, publiczny licznik "total aura points logged" na landing page, "roast my aura" live na TikTok, partnerstwo barterowe z 1 kreatorem lifestyle, post na Product Hunt w dniu premiery App Store.

**5 sposobów na pierwsze 100 użytkowników:** własna sieć (znajomi, grupy studenckie w Warszawie), 3-5 pierwszych TikToków własnoręcznie nagranych, post na Reddit r/SideProject / r/iOSProgramming z historią budowy, Product Hunt launch, DM do 10 mikroinfluencerów.

**5 sposobów na pierwsze 1000 użytkowników:** 1 viralowy TikTok (>500k wyświetleń realistycznie osiągalne przy dobrym hooku i trendującym temacie), Apple Search Ads na frazę "aura points" (mały budżet, wysoka intencja), collab z 3-5 twórcami 10k-50k followers, feature w newsletterze indie/Product Hunt "top products", cross-post tego samego contentu na TikTok/Reels/Shorts jednocześnie.

---

## CZĘŚĆ 11 — Retencja

| Mechanika | Jak działa | W MVP? | Wpływ na retencję | Ryzyko wkurzenia | Jak zrobić elegancko |
|---|---|---|---|---|---|
| Streak | Licznik kolejnych dni z ≥1 wpisem | Tak | Wysoki | Średnie (presja) | Streak nie resetuje się brutalnie — brak wpisu "dziś" nie liczy się jako zerwanie, dopóki nie minie cały dzień bez logowania |
| Zapisane wyniki / historia | Oś czasu + tygodniowy recap | Tak | Średni | Niskie | Zawsze dostępne bez frykcji dla ostatnich 7 dni |
| Shareable output | Karta wyniku do eksportu | Tak | Wysoki (viral + powrót po komentarzach) | Niskie | Domyślnie prywatne, użytkownik świadomie eksportuje |
| Tygodniowy raport | "Aura Wrapped" z biggest win/loss | Tak (częściowo, w History) | Średni | Niskie | Krótki, pozytywny ton nawet przy złym tygodniu |
| Personalizacja / progres | Tier od Shadow do Legendary | Tak | Wysoki | Niskie | Progres widoczny cały czas na ringu, nie ukryty |
| Unlocki / premium themes | Motywy kart odblokowywane w Pro | Częściowo (Pro gate) | Średni | Niskie | Kosmetyczne, nie wpływają na "prawdziwość" wyniku |
| Przypomnienia push | "Nie zapomnij zalogować dzisiejszej aury" | Nie w MVP | Potencjalnie wysoki | Wysokie jeśli nadużywane | Max 1 dziennie, łatwe wyłączenie, dodać dopiero w v1.1 |

**Jak nie zrobić z aplikacji taniego kasyna dopaminowego:** żadnych losowych "loot boxów", żadnych sztucznych liczników czasu ("tylko dziś!"), żadnych kar finansowych za zerwanie streaka, żadnych ukrytych mechanik zwiększających retencję kosztem samopoczucia użytkownika — punkty są żartem, nie mają realnej wartości poza samą appką.

---

## CZĘŚĆ 12 — Roadmapa

**Dzisiaj:** ✅ wybór pomysłu, ✅ setup struktury Xcode, ✅ pełny kod MVP wklejony, pierwsze uruchomienie w symulatorze, drobne poprawki UI po pierwszym odpaleniu.

**Jutro:** testy manualne całego flow, dopracowanie edge case'ów (0 wpisów, bardzo długi tekst), mock paywall przetestowany, pierwsze nagranie promo, prosty landing page (jedna strona, waitlist).

**7 dni:** TestFlight z 10-20 znajomymi, zbiórka feedbacku, poprawki na jego podstawie, pierwsze organiczne posty na TikTok/Instagram.

**14 dni:** finalne screenshoty i opis, prawdziwa polityka prywatności, konfiguracja produktów IAP w App Store Connect, submission do review.

**30 dni:** pierwsze płatności, test 2-3 wariantów cenowych, analiza D1/D7 retention, pierwsza iteracja produktu na bazie danych.

**90 dni:** jeśli trakcja jest realna — multiplayer/ranking znajomych (v1.1), ewentualne wejście AI-scoringu (Część 8, wariant B), większy marketing (płatne Apple Search Ads), partnerstwa z mikroinfluencerami, automatyzacja publikacji contentu.

---

## CZĘŚĆ 14 — Kryteria sukcesu

1. **Szybki MVP?** Tak — 3-5 dni, kod już napisany, zero backendu.
2. **Moment wow?** Tak — pełnoekranowy reveal w <60 sek. od pierwszego otwarcia.
3. **Wartość jasna w 3 sek.?** Tak — one-liner + ring + duża liczba mówią wszystko.
4. **Da się pokazać w 15s TikToku?** Tak — to właściwie natywny format dla tego produktu.
5. **Powód do zapłaty?** Tak, ale umiarkowany — subskrypcja lifestyle to zawsze pod górkę; kluczowe będzie tempo iteracji cenowej.
6. **Da się wypuścić do App Store?** Tak — niskie ryzyko guideline, brak wrażliwych danych.
7. **Da się rozwijać po launchu?** Tak — multiplayer, AI-scoring, widgety to naturalne, nieblokujące MVP kierunki.
8. **Realna szansa na pierwsze pieniądze?** Tak, umiarkowanie wysoka — pod warunkiem realnej pracy nad dystrybucją (Część 10), nie samego launchu.
9. **Co może to zabić:** (a) trend "aura" wygasa szybciej niż launch, (b) zero wysiłku włożonego w dystrybucję/TikTok, (c) zbyt agresywny paywall zabijający pierwsze wrażenie, (d) fala klonów zalewająca kategorię.
10. **Co zrobić natychmiast:** nagrać i opublikować pierwszy TikTok pokazujący appkę **przed** pełnym dopracowaniem — walidacja zainteresowania jest tańsza niż perfekcja UI.

---

## Ryzyka (zbiorczo)

- **Trend-dependency:** siła hooka opiera się na żywym, ulotnym trendzie internetowym — mitygacja: nie sprzedawać appki *jako* mema, tylko jako trwałe narzędzie do "dziennika dnia" z aurowym skinem, żeby przetrwała, gdy słowo wyjdzie z mody.
- **Fala klonów:** trend = łatwy do skopiowania koncept — mitygacja: szybkość wejścia + jakość wykonania (animacje, ton, marka) jako fosa, nie sam pomysł.
- **Niska organiczna konwersja bez budżetu na reklamę:** mitygacja: konsekwentny, codzienny content przez pierwsze 30 dni, nie jeden post i cisza.
- **Ryzyko odrzucenia w App Store przez niedopracowane metadane/placeholdery:** mitygacja: checklist w Części 9 punkt 18-19 odhaczony przed każdą wysyłką.
