#!/bin/bash

ACCENT="^c#879a39^"

get_time() {
	echo "$ACCENT$(date '+%I:%M%p')^d^"
}

get_ram() {
	USED_RAM=$(free -mh --si | awk  {'print $3'} | head -n 2 | tail -1)
    echo "$(echo $ACCENT)RAM^d^ $USED_RAM"
}

VOLUME_ON_ICON="$(echo $ACCENT)  ^d^"
VOLUME_MUTED_ICON="$(echo $ACCENT)! ^d^"

get_volume() {
    curStatus=$(pactl get-sink-mute @DEFAULT_SINK@)
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | tail -n 2 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n 1)
	if [ "${curStatus}" = 'Mute: yes' ]
	then
	   echo "$VOLUME_MUTED_ICON$volume%"
	else
		echo "$VOLUME_ON_ICON$volume%"
	fi
}

get_uptime() {
    UPTIME=$(echo $(uptime | sed 's/.*up \([^,]*\), .*/\1/'))
    echo "$(echo $ACCENT)UPTIME^d^ $UPTIME"
}

# S="^c#ad8301^/^d^"
S="^c#66800b^♦^d^"
while true; do
	xsetroot -name "$(get_volume) $S $(get_ram) $S $(get_uptime) $S $(get_time)  " && sleep 5
done
