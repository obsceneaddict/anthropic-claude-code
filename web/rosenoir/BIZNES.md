# Rose Noir — instrukcja operacyjna

Wszystko oznaczone **DO WERYFIKACJI** wymaga potwierdzenia u księgowego, prawnika, w urzędzie skarbowym albo u dostawcy. Nie jestem prawnikiem ani doradcą podatkowym, a w sesji, w której to pisałem, nie miałem dostępu do sieci — nie mogłem sprawdzić aktualnych kwot ani nazw formularzy.

---

## 1. Rachunek, który musisz zobaczyć przed startem

Działalność nierejestrowana ma limit **75% minimalnego wynagrodzenia miesięcznie, liczony od przychodu** (nie od zysku). Przy płacy minimalnej ~4666–4900 zł to ok. **3500–3675 zł przychodu na miesiąc**. **DO WERYFIKACJI: sprawdź kwotę na aktualny rok i wpisz ją w narzędziu ewidencji.**

Co to znaczy przy tym katalogu:

| | |
|---|---|
| Średnia cena produktu | ~330 zł |
| Limit przychodu / mies. | ~3 500 zł |
| **Zamówień do wyczerpania limitu** | **~10** |
| Marża brutto w dropshippingu erotycznym | ~25–40% |
| Zysk brutto przy pełnym limicie | ~900–1 400 zł |
| Minus wysyłka, opakowania, prowizje płatnicze, reklama | mniej |

**Wniosek: to jest narzędzie walidacji, nie model biznesowy.** Cel działalności nierejestrowanej to sprawdzić w 4–6 tygodni, czy ktokolwiek kupuje — bez ZUS, bez rejestracji, bez ryzyka. Gdy przekroczysz limit, rejestrujesz JDG. To sensowna kolejność, nie kompromis.

Dodatkowy koszt, o którym łatwo zapomnieć: jako sprzedawca **zwolniony z VAT** nie odliczysz VAT-u z faktur od hurtowni. Cena hurtowa, którą widzisz, jest Twoim realnym kosztem. Uwzględnij to w mnożniku marży w importerze.

---

## 2. Kroki, które musisz wykonać Ty

Te wymagają Twojej tożsamości i podpisu — nikt ich za Ciebie nie zrobi.

### 2.1 NIP (bo hurtownia go wymaga)
Erotizo potwierdziło: działalność nierejestrowana OK, ale NIP potrzebny. **Możesz dostać NIP bez rejestracji firmy.**

- Formularz **NIP-7** — zgłoszenie identyfikacyjne osoby fizycznej będącej podatnikiem, która **nie** podlega wpisowi do CEIDG. Dokładnie Twój przypadek.
- Gdzie: urząd skarbowy właściwy dla miejsca zamieszkania, albo elektronicznie przez e-Urząd Skarbowy.
- **DO WERYFIKACJI:** nazwa i numer formularza mogą się różnić — zapytaj wprost w US: *„prowadzę działalność nierejestrowaną, kontrahent wymaga NIP, jak go uzyskać".* To rutynowa sprawa.

### 2.2 Konto B2B w Erotizo
Po otrzymaniu NIP-u. Przy zakładaniu koniecznie ustal na piśmie:
- czy wysyłają w **neutralnym opakowaniu** z Twoim adresem nadawcy (bez tego cała obietnica dyskrecji na stronie jest nieprawdziwa — a to jest Twój główny argument sprzedażowy);
- format i częstotliwość **feedu produktowego** oraz czy zawiera **zdjęcia** i **stany magazynowe**;
- kto pokrywa koszt zwrotu i jak wygląda procedura reklamacyjna między Wami.

### 2.3 Rachunek bankowy
Osobny rachunek nie jest obowiązkowy przy działalności nierejestrowanej, ale **zrób go**. Rozdzielenie prywatnych i sklepowych przelewów oszczędzi Ci godzin przy PIT i przy ewentualnej kontroli.

### 2.4 Płatności online
Potrzebujesz operatora (Przelewy24, PayU, Stripe). Dwie rzeczy do ustalenia z nimi:
- czy akceptują **działalność nierejestrowaną** (część wymaga wpisu do CEIDG — **DO WERYFIKACJI**);
- czy akceptują branżę **adult** i pod jakim **deskryptorem** pojawi się obciążenie na wyciągu klienta. Deskryptor musi być neutralny, ale **nie może wprowadzać w błąd** — ustal dokładne brzmienie z operatorem, bo strona to obiecuje.

---

## 3. Obowiązki, gdy już sprzedajesz

### 3.1 Ewidencja sprzedaży — obowiązkowa
Uproszczona ewidencja sprzedaży za **każdy dzień**, nie zbiorczo na koniec miesiąca. Narzędzie: [`tools/ewidencja.html`](tools/ewidencja.html) — kolumny zgodne z wymaganym układem (lp., data, kwota, narastająco), z licznikiem limitu i ostrzeżeniem przy 80% i 100%.

Dwie rzeczy, które ludzie mylą:
- Przychód liczy się **kasowo** — w dacie otrzymania zapłaty, nie złożenia zamówienia.
- Dane w narzędziu siedzą tylko w Twojej przeglądarce. **Eksportuj CSV co miesiąc** i trzymaj kopię.

### 3.2 Podatek
Przychód z działalności nierejestrowanej rozliczasz w **PIT-36 jako „inne źródła"**, raz w roku. Brak zaliczek miesięcznych, brak ZUS, brak VAT (do progu). Koszty możesz odliczyć — trzymaj faktury od hurtowni. **DO WERYFIKACJI z księgowym.**

### 3.3 Przekroczenie limitu
W miesiącu, w którym przekroczysz limit, działalność **automatycznie** przestaje być nierejestrowana. Masz **7 dni** na złożenie wniosku CEIDG. Narzędzie ewidencji ostrzega przy 80% — wtedy przygotuj rejestrację, nie czekaj do przekroczenia.

### 3.4 Prawo konsumenckie — Ty jesteś sprzedawcą
Nawet gdy paczkę wysyła hurtownia, **umowa jest między Tobą a klientem**. Zwroty, reklamacje, rękojmia — wszystko po Twojej stronie. Strony prawne są już pod to napisane (`terms.html`, `returns.html`). Nie odsyłaj klienta do hurtowni.

---

## 4. Zdjęcia produktów

Nie da się tego obejść kreatywnie: **zdjęcia bierzesz z feedu hurtowni.** Kod jest już na to gotowy — pole `image` w `catalog.js` renderuje się automatycznie, a gdy go brak, pokazuje placeholder. Importer feedu przepuszcza URL-e zdjęć.

Dwie decyzje do podjęcia:
- **Hotlinkowanie vs self-hosting.** Hotlink jest darmowy i natychmiastowy, ale znika, gdy hurtownia zmieni URL-e, i bywa zabronione w regulaminie. Bezpieczniej pobrać i hostować u siebie — ustal, czy licencja na to pozwala.
- **Zdjęcia hurtowni wyglądają jak zdjęcia hurtowni.** Białe tło, katalogowa estetyka, identyczne u wszystkich konkurentów. To zabija pozycjonowanie premium. Najwyższy zwrot z inwestycji w tym projekcie: **własna sesja zdjęciowa 8–10 najlepszych produktów.** Ciemne tło, faktura, światło zgodne z identyfikacją sklepu. To jest jedyna rzecz, która wizualnie odróżni Cię od trzydziestu innych sklepów sprzedających ten sam katalog Erotizo.

---

## 5. Marketing — przeczytaj, zanim założysz konta

**To jest trzecia twarda bariera tego projektu i lepiej poznać ją teraz niż po zbanowaniu konta.**

### Czego platformy nie pozwalają
- **TikTok**: zakazuje reklamowania produktów dla dorosłych, a treści o charakterze seksualnym są ograniczane lub usuwane także organicznie. Konto sklepu erotycznego pokazującego produkty jest w trwałym ryzyku bana. **DO WERYFIKACJI w aktualnym regulaminie** — zasady się zmieniają, ale kierunek jest stały.
- **Instagram / Meta**: reklamy płatne produktów dla dorosłych są zabronione. Konta organiczne funkcjonują, ale nagość i eksponowanie produktów seksualnych łamią wytyczne, a shadowban jest powszechny.
- **Google Ads**: mocno ograniczone dla tej kategorii.

Wniosek: **strategia „nagrywam produkty i wrzucam na TikToka" spali konto.** Potrzebna jest inna droga.

### Co realnie działa w tej kategorii
1. **Treść edukacyjna, nie produktowa.** Materiały, bezpieczeństwo, higiena, komunikacja w związku. Produkt w tle albo wcale. To przechodzi moderację i buduje autorytet.
2. **Estetyka bez produktu.** Ciemna, luksusowa identyfikacja sklepu jako *mood* — tkaniny, światło, opakowanie, rytuał wieczoru. Sprzedaje pozycjonowanie premium, nie łamie zasad.
3. **Dyskrecja jako temat.** Twoim realnym wyróżnikiem jest nieoznaczona paczka i neutralny deskryptor. To można pokazywać bez żadnej treści erotycznej — i to jest dokładnie to, czego boi się klient.
4. **SEO i treść długa.** Największy, najtrwalszy kanał dla adult e-commerce, bo nie zależy od moderacji platform. Poradniki materiałowe, porównania, „jak wybrać". Wolno się rozkręca, nie da się zbanować.
5. **Newsletter.** Kanał, którego nikt Ci nie odbierze. Zbieraj adresy od pierwszego dnia — formularz jest już na stronie.
6. **Mikroinfluencerzy w niszy sex-positive/wellness.** Oni już rozwiązali problem moderacji i mają zaufanie odbiorców. Barter zamiast gotówki na start.

### Czego nie robić
Nie kupuj reklam w tej kategorii, dopóki nie potwierdzisz, że dana platforma je dopuszcza dla Twojego typu działalności — spalisz budżet na odrzucone kreacje i ryzykujesz konto. Nie buduj całego ruchu na jednej platformie.

---

## 6. Kolejność działań

**Teraz (Ty):** NIP-7 → konto Erotizo → ustalenie neutralnej wysyłki i formatu feedu → operator płatności.

**Po feedzie (ja):** import katalogu i zdjęć, mapowanie kategorii, przeliczenie marż.

**Przed pierwszą sprzedażą (Ty):** prawnik przegląda cztery strony prawne, wpisanie danych sprzedawcy, realne adresy e-mail, deskryptor uzgodniony z operatorem.

**Potem (razem):** sesja zdjęciowa 8–10 produktów, treść edukacyjna i SEO, newsletter, mikroinfluencerzy.

**Gdy limit zacznie się kończyć:** rejestracja JDG, wtedy VAT i realne skalowanie.
