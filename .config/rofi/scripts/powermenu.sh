#!/usr/bin/env bash

shutdown=" ⏻  Shutdown"
reboot=" ⏻  Reboot"
lock="   Lock"
suspend=" ⏻  Suspend"
logout="   Logout"

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
chosen="$(echo -e "$options" | rofi -dmenu -p " power " -i \
    -config ~/.config/rofi/styles/powermenu.rasi)"

confirm="sh $HOME/.config/rofi/scripts/confirm.sh"

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
        i3lock -c 12191d
        ;;
    $suspend)
        if [ "$($confirm)" == "Yes" ]; then
            systemctl suspend
        fi
        ;;
    $logout)
        if [ "$($confirm)" == "Yes" ]; then
            pkill -KILL -u $(whoami)
        fi
        ;;
esac
