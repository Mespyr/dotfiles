#!/bin/sh

shutdown=" ⏻  Shutdown"
reboot=" ⏻  Reboot"
lock="   Lock"
_suspend=" ⏻  Suspend"
_logout="   Logout"

options="$shutdown\n$reboot\n$lock\n$_suspend\n$_logout"
chosen="$(echo -e "$options" | rofi -dmenu -i \
    -config ~/.config/rofi/styles/powermenu.rasi \
    -selected-row 2 )"

confirm="$HOME/.config/rofi/scripts/confirm.sh"

case $chosen in
    $shutdown)
        if [ "$($confirm)" == "Yes" ]; then
            poweroff
        fi
        ;;
    $reboot)
        if [ "$($confirm)" == "Yes" ]; then
            reboot
        fi
        ;;
    $lock)
        i3lock -c 151515
        ;;
    $_suspend)
        if [ "$($confirm)" == "Yes" ]; then
            systemctl suspend
        fi
        ;;
    $_logout)
        if [ "$($confirm)" == "Yes" ]; then
            pkill -KILL -u $(whoami)
        fi
        ;;
esac
