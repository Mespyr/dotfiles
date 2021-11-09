#!/usr/bin/env bash

# Options
shutdown=" Shutdown "
reboot=" Reboot "
lock=" Lock "
suspend=" Suspend "
logout=" Logout "

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
chosen="$(echo -e "$options" | rofi -dmenu -p " power " -l 5)"

case $chosen in
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        i3lock -c 12191d
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        pkill -KILL -u $(whoami)
        ;;
esac
