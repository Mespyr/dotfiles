#!/usr/bin/env bash

case "$(printf "KILL\nLOGOUT\nLOCK\nREBOOT\nSHUTDOWN\nKEY" | dmenu)" in
	KILL) ps -u "$USER" -o comm | tail -n +2 |  dmenu -p "  " | awk '{print $1}' | xargs -r kill ;;
	LOGOUT) pkill dwm ;;
	LOCK) i3lock -c $1 ;;
	REBOOT) systemctl reboot ;;
	SHUTDOWN) systemctl poweroff ;;
	KEY) xclip -selection clipboard < ~/.local/github.key ;;
	*) exit 1 ;
esac
