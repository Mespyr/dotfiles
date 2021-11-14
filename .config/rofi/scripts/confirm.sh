YES="   Yes"
NO="   No"

CHOICE=$(echo -e "$NO\n$YES" | rofi -dmenu -p " power " -i -config ~/.config/rofi/styles/confirm.rasi -mesg "Are you sure you want to do this?")

if [ "$CHOICE" == "$YES" ]; then
    echo "Yes"
else
    echo "No"
fi
