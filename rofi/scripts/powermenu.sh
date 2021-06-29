#!/usr/bin/env bash

rofi_command="rofi -p : -theme themes/forest/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend=" Suspend"
logout=" Logout"

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        lxlock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        pkill -KILL -u $(whoami)
        ;;
esac