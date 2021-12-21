#!/bin/sh
POWERMENU="   Power Menu"
BACKLIGHT="   Backlight"
BATTERY="   Battery"
RUN="   Run Menu"
SOUND="   Sound"
BLUETOOTH="   Bluetooth"
SCREENSHOT="   Screenshot"

OPTIONS="$POWERMENU\n$BACKLIGHT\n$BATTERY\n$RUN\n$SOUND\n$BLUETOOTH\n$SCREENSHOT"
CHOSEN="$(echo -e "$OPTIONS" | rofi -dmenu -i \
    -config ~/.config/rofi/styles/settings.rasi )"

case $CHOSEN in 
    $POWERMENU)
        $HOME/.config/rofi/scripts/powermenu.sh
        ;;
    $BACKLIGHT)
        $HOME/.config/rofi/scripts/backlight.py
        ;;
    $BATTERY)
        notify-send "$(acpi -bs)" &
        ;;
    $RUN)
        $HOME/.config/rofi/scripts/run.sh
        ;;
    $SOUND)
        pavucontrol &
        ;;
    $BLUETOOTH)
        blueberry &
        ;;
    $SCREENSHOT)
        sleep 1;
        scrot ~/Pictures/screenshot.png -z &
        notify-send "Screenshot saved in ~/Pictures/" &
        ;;
esac
