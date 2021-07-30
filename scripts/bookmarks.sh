#!/usr/bin/env bash

rofi_command="dmenu -p bookmarks"
options=$(cat ~/.config/bookmarks)

# echo "$options"

chosen="$(echo -e "$options" | $rofi_command )"
$chosen &
