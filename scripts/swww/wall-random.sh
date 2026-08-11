#!/usr/bin/env bash

# Main wallpapers directory
wall_dir="$HOME/Media/images/wallpapers"

# Effect list
effects=("outer" "wave" "center" "top" "right" "bottom" "left" "wipe" "grow" "simple" "fade" "random")

# Exclude current wallpaper
current=$(awww query | grep -oP 'image: \K.*')

# Filter candidates
candidates=()
for f in "$wall_dir"/*; do
  if [ "$f" != "$current" ] && [ -f "$f" ]; then
    candidates+=("$f")
  fi
done

# Pick random wall and effect
if [ ${#candidates[@]} -gt 0 ]; then
  img="${candidates[RANDOM % ${#candidates[@]}]}"
  effect="${effects[RANDOM % ${#effects[@]}]}"

  # Establish wallpaper
  awww img "$img" --transition-type "$effect" --transition-fps 60 --transition-duration 2
fi
