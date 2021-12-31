#!/bin/sh
YES="   yes"
NO="   no"

CHOICE=$(echo -e "$YES\n$NO" | rofi -dmenu -i -config ~/.config/rofi/styles/confirm.rasi \
    -mesg " are you sure you want to do this?" \
    -selected-row 1 )

if [ "$CHOICE" == "$YES" ]; then
    echo "Yes"
else
    echo "No"
fi
