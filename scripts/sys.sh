#!/usr/bin/env bash

case "$(printf "KEY\nVOLUME\nSHUTDOWN\nREBOOT\nLOCK\nLOGOUT\nKILL" | dmenu)" in
	KEY) xclip -selection clipboard < ~/.local/github.key ;;
	VOLUME) pavucontrol ;;
	SHUTDOWN) systemctl poweroff ;;
	REBOOT) systemctl reboot ;;
	LOCK) i3lock -c $1 ;;
	LOGOUT) pkill dwm ;;
	KILL) ps -u "$USER" -o comm | tail -n +2 |  dmenu -p "  " | awk '{print $1}' | xargs -r kill ;;
	*) exit 1 ;
esac
