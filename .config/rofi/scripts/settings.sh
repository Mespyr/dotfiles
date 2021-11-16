POWERMENU="   Power Menu"
BACKLIGHT="   Backlight"
RUN="   Run Menu"

OPTIONS="$POWERMENU\n$BACKLIGHT\n$RUN"
CHOSEN="$(echo -e "$OPTIONS" | rofi -dmenu -i \
    -config ~/.config/rofi/styles/settings.rasi \
    -location 8 \
    -mesg " Settings")"

case $CHOSEN in 
    $POWERMENU)
        sh ~/.config/rofi/scripts/powermenu.sh
        ;;
    $BACKLIGHT)
        python3 ~/.config/rofi/scripts/backlight.py
        ;;
    $RUN)
        sh ~/.config/rofi/scripts/run.sh
        ;;
esac
