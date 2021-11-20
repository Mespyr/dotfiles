YES="   Yes"
NO="   No"

CHOICE=$(echo -e "$YES\n$NO" | rofi -dmenu -i -config ~/.config/rofi/styles/confirm.rasi \
    -mesg " Are you sure you want to do this?" \
    -selected-row 1 )

if [ "$CHOICE" == "$YES" ]; then
    echo "Yes"
else
    echo "No"
fi
