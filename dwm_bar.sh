#!/bin/bash

block() {
	printf "^c#212121^ ^b#585858^ $1 $2 ^d^"
}

time_() {
	block 󱑃 "$(date '+%I:%M %p')"
}

date_() {
	block 󰃭 "$(date '+%A, %b %d')"
}

volume() {
	block " VOLUME:" "$(amixer -D pulse sget Master | grep "Front Right:" | awk -F'[][]' '{ print $2 }')%"
}

while true; do
	xsetroot -name "$(volume)$(date_)$(time_) " && sleep 2
done
