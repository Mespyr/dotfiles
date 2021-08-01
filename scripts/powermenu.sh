#!/usr/bin/env bash

command="dmenu -p power"

# Options
shutdown=" Shutdown "
reboot=" Reboot "
lock=" Lock "
suspend=" Suspend "
logout=" Logout "

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $command )"
case $chosen in
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        i3lock -c 000000
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        pkill -KILL -u $(whoami)
        ;;
esac
