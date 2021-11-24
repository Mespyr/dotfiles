#!/bin/sh
POWERMENU="   Power Menu"
BACKLIGHT="   Backlight"
RUN="   Run Menu"

OPTIONS="$POWERMENU\n$BACKLIGHT\n$RUN"
CHOSEN="$(echo -e "$OPTIONS" | rofi -dmenu -i \
    -config ~/.config/rofi/styles/settings.rasi )"

case $CHOSEN in 
    $POWERMENU)
        $HOME/.config/rofi/scripts/powermenu.sh
        ;;
    $BACKLIGHT)
        $HOME/.config/rofi/scripts/backlight.py
        ;;
    $RUN)
        $HOME/.config/rofi/scripts/run.sh
        ;;
esac
