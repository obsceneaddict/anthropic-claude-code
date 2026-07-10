#!/bin/bash
#
# mirror-to-lg.sh — włącza Screen Mirroring na telewizor LG i ustawia go
# jako główny ekran (main display).
#
# Użycie (na Macu):
#   chmod +x mirror-to-lg.sh
#   ./mirror-to-lg.sh
#
# Wymagania:
#   1. Terminal musi mieć uprawnienia Accessibility:
#      System Settings -> Privacy & Security -> Accessibility -> dodaj Terminal
#   2. Do ustawienia głównego ekranu potrzebny jest displayplacer:
#      brew install jakehilborn/jakehilborn/displayplacer
#
# Nazwa urządzenia AirPlay dopasowywana jest po fragmencie "LG"
# (złapie LGTV, LGWEBOS itd.). Można nadpisać: ./mirror-to-lg.sh "LGWEBOS"

set -u

TV_MATCH="${1:-LG}"

echo "==> Krok 1/2: Włączam Screen Mirroring na urządzenie zawierające: ${TV_MATCH}"

osascript <<EOF
-- UI scripting Control Center: macOS Ventura / Sonoma / Sequoia
tell application "System Events"
    tell process "ControlCenter"
        -- otwórz Control Center (ikona na pasku menu)
        try
            click (first menu bar item of menu bar 1 whose description contains "Control Center" or description contains "Centrum sterowania")
        on error
            click menu bar item "Control Center" of menu bar 1
        end try
        delay 1

        -- kliknij Screen Mirroring
        try
            click (first button of window 1 whose description contains "Screen Mirroring" or description contains "Klonowanie ekranu" or description contains "Mirror")
        on error
            -- na niektórych wersjach to checkbox, nie button
            click (first checkbox of window 1 whose description contains "Screen Mirroring" or description contains "Klonowanie")
        end try
        delay 1.5

        -- wybierz telewizor LG z listy
        set tvClicked to false
        repeat with el in (every UI element of window 1)
            try
                if (description of el contains "${TV_MATCH}") or (name of el contains "${TV_MATCH}") then
                    click el
                    set tvClicked to true
                    exit repeat
                end if
            end try
        end repeat
        if not tvClicked then
            -- spróbuj głębiej (elementy bywają zagnieżdżone w scroll area)
            repeat with el in (every UI element of every UI element of window 1)
                try
                    if (description of el contains "${TV_MATCH}") or (name of el contains "${TV_MATCH}") then
                        click el
                        set tvClicked to true
                        exit repeat
                    end if
                end try
            end repeat
        end if
        delay 2

        -- jeśli pojawi się wybór trybu, kliknij "Mirror Entire Screen"
        try
            click (first UI element of window 1 whose description contains "Mirror Entire Screen" or description contains "Klonuj cały ekran" or description contains "Mirror Built-in")
        end try
    end tell
end tell
EOF

if [ $? -ne 0 ]; then
    echo "!! UI scripting nie zadziałał. Upewnij się, że Terminal ma uprawnienia"
    echo "   Accessibility (System Settings -> Privacy & Security -> Accessibility)"
    echo "   i że telewizor LG jest widoczny w Screen Mirroring."
fi

echo "==> Krok 2/2: Ustawiam LG jako główny ekran (main display)"

if ! command -v displayplacer >/dev/null 2>&1; then
    echo "!! Brak displayplacer — zainstaluj i uruchom skrypt ponownie:"
    echo "   brew install jakehilborn/jakehilborn/displayplacer"
    exit 1
fi

sleep 3  # daj systemowi chwilę na podpięcie ekranu AirPlay

# znajdź ID ekranu, którego nazwa/typ pasuje do LG lub AirPlay
LG_ID=$(displayplacer list | awk -v m="${TV_MATCH}" '
    /Persistent screen id/ { id=$4 }
    tolower($0) ~ tolower(m) && id { print id; exit }
')

if [ -z "${LG_ID}" ]; then
    # fallback: pierwszy ekran typu AirPlay
    LG_ID=$(displayplacer list | awk '
        /Persistent screen id/ { id=$4 }
        /Type:.*(AirPlay|airplay)/ && id { print id; exit }
    ')
fi

if [ -z "${LG_ID}" ]; then
    echo "!! Nie znalazłem ekranu LG/AirPlay na liście displayplacer."
    echo "   Sprawdź ręcznie: displayplacer list"
    exit 1
fi

# origin (0,0) = główny ekran
displayplacer "id:${LG_ID} origin:(0,0)" \
    && echo "==> Gotowe: LG (${LG_ID}) jest teraz głównym ekranem." \
    || echo "!! Nie udało się ustawić głównego ekranu — sprawdź: displayplacer list"
