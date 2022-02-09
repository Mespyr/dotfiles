#!/bin/sh
POWERMENU="   power menu"
BACKLIGHT="   backlight"
RUN="   run menu"
SOUND="   sound"
BLUETOOTH="   bluetooth"
SCREENSHOT="   screenshot"

OPTIONS="$POWERMENU\n$BACKLIGHT\n$RUN\n$SOUND\n$BLUETOOTH\n$SCREENSHOT"
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
    $SOUND)
        pavucontrol &
        ;;
    $BLUETOOTH)
        blueberry &
        ;;
    $SCREENSHOT)
        sleep 1;
        scrot ~/Screenshots/screenshot.png -z &
        notify-send "Screenshot saved in ~/Screenshots/" &
        ;;
esac
