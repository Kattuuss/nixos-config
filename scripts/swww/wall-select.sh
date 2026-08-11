#!/usr/bin/env bash

# Variables (wallpapers directory, effects list)
wall_dir="$HOME/Media/images/wallpapers"
effects=("outer" "wave" "center" "top" "right" "bottom" "left" "wipe" "grow" "simple" "fade" "random")
effect="${effects[RANDOM % ${#effects[@]}]}"

# Current wallpaper basename
current_path=$(awww query | grep -oP 'image: \K.*')
current=$(basename "$current_path")

# List images on Rofi (filtering out current wallpaper)
selected=$(ls "$wall_dir" | grep -v "^$current$" | rofi -dmenu -p "Pick a wallpaper")

# Establish wallpaper
if [ -n "$selected" ]; then
  awww img "$wall_dir/$selected" --transition-type "$effect" --transition-fps 60 --transition-duration 2
fi
