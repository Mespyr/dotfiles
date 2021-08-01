#!/usr/bin/env bash

command="dmenu -p bookmarks"
options=$(cat ~/.config/bookmarks)

# echo "$options"

chosen="$(echo -e "$options" | $command )"
$chosen &
