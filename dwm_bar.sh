#!/bin/bash


get_time() {
	echo "$(date '+%I:%M %p')"
}

get_ram()
{
	USED_RAM=$(free -mh --si | awk  {'print $3'} | head -n 2 | tail -1)
    echo "RAM $USED_RAM"
}

WIFI_FULL_ICON=' '
WIFI_MID_ICON=' '
WIFI_LOW_ICON=' '
NO_WIFI_ICON=''
get_wifi()
{
        if grep -q wl* "/proc/net/wireless"; then
                # Wifi quality percentage
                percentage=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70)}'| xargs)
                case $percentage in
                        0)                              echo $NO_WIFI_ICON;;
                        100|9[0-9]|8[0-9]|7[0-9])       echo "$WIFI_FULL_ICON" ;;
                        6[0-9]|5[0-9]|4[0-9]|3[0-9])    echo "$WIFI_MID_ICON" ;;
                        2[0-9]|1[0-9]|[0-9])            echo "$WIFI_LOW_ICON" ;;
                esac
        fi
}

VOLUME_ON_ICON=''
VOLUME_MUTED_ICON=''

get_volume(){
        curStatus=$(pactl get-sink-mute @DEFAULT_SINK@)
        volume=$(pactl get-sink-volume @DEFAULT_SINK@ | tail -n 2 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n 1)

        if [ "${curStatus}" = 'Mute: yes' ]
        then
            echo "$VOLUME_MUTED_ICON  $volume%"
        else
            echo "$VOLUME_ON_ICON  $volume%"
        fi
}

get_uptime()
{
    UPTIME=$(echo $(uptime | sed 's/.*up \([^,]*\), .*/\1/'))
    echo "UPTIME $UPTIME"
}

S="^c#ad8301^/^d^"
while true; do
	xsetroot -name "$(get_wifi) $S $(get_volume) $S $(get_ram) $S $(get_uptime) $S $(get_time)  " && sleep 2
done
