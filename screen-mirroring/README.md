# Screen Mirroring na LG TV — jedna komenda

Skrypt `mirror-to-lg.sh` robi na Macu dwie rzeczy:

1. Otwiera **Screen Mirroring** z paska menu, wybiera telewizor **LG**
   (LGTV / LGWEBOS) i włącza **Mirror Entire Screen**.
2. Ustawia LG jako **główny ekran** (odpowiednik "Use as main display").

## Jednorazowa konfiguracja

1. Nadaj Terminalowi uprawnienia Accessibility (bez tego macOS nie pozwoli
   skryptowi klikać w Control Center):
   **System Settings → Privacy & Security → Accessibility → dodaj Terminal**
2. Zainstaluj narzędzie do zarządzania ekranami:
   ```bash
   brew install jakehilborn/jakehilborn/displayplacer
   ```

## Użycie

```bash
cd screen-mirroring
chmod +x mirror-to-lg.sh
./mirror-to-lg.sh
```

Domyślnie skrypt szuka urządzenia z "LG" w nazwie. Jeśli chcesz wskazać
konkretne, podaj nazwę jako argument:

```bash
./mirror-to-lg.sh "LGWEBOS"
```

## Usuwanie innych wyświetlaczy

macOS nie pozwala programowo "usunąć" ekranu z listy — ekrany AirPlay
znikają same po rozłączeniu, a fizyczne monitory trzeba odpiąć kablem.
Jeśli na liście w **System Settings → Displays** wiszą stare wirtualne
wyświetlacze (np. po aplikacjach typu DeskPad, BetterDisplay), usuń je
w aplikacji, która je utworzyła.

## Rozwiązywanie problemów

- **Skrypt nic nie klika** → brakuje uprawnień Accessibility (punkt 1 wyżej).
- **Nie widzi telewizora** → upewnij się, że LG jest w tej samej sieci Wi-Fi
  i widać go ręcznie w Control Center → Screen Mirroring.
- **Główny ekran się nie zmienił** → uruchom `displayplacer list`, znajdź
  `Persistent screen id` telewizora i wykonaj:
  ```bash
  displayplacer "id:<ID_TELEWIZORA> origin:(0,0)"
  ```
