POWERMENU="   Power Menu"
BACKLIGHT="   Backlight"

OPTIONS="$POWERMENU\n$BACKLIGHT"
CHOSEN="$(echo -e "$OPTIONS" | rofi -dmenu -p " power " -i \
    -config ~/.config/rofi/styles/settings.rasi \
    -mesg "Settings")"

case $CHOSEN in 
    $POWERMENU)
        sh ~/.config/rofi/scripts/powermenu.sh
        ;;
    $BACKLIGHT)
        python3 ~/.config/rofi/scripts/backlight.py
        ;;
esac
