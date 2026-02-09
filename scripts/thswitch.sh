#!/bin/bash

# Directory of wallpapers
wall_dir="$HOME/Pictures/Wallpapers"

# current directory (to cd back to)
cwd="$(pwd)"

cd "$wall_dir" || exit

# handle spaces in filenames
IFS=$'\n'

# grab the user-selected Wallpaper
selected_wallpaper=$(for a in *.jpg *.png; do echo "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")

# if not empty, pass to tswitch-backend
if [ -n "$selected_wallpaper" ]; then
    tswitch-backend "$selected_wallpaper"
fi

# go back to where you came from
cd "$cwd" || exit
