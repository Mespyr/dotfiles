#!/usr/bin/env bash
options=$(cat ~/.config/bookmarks)

chosen="$(echo -e "$options" | dmenu -p " bookmarks " )"
$chosen &
