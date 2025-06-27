#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"

# Show nsxiv in thumbnail mode, wait for user to mark
WALL=$(nsxiv -t -o "$WALL_DIR" | head -n 1)

# Cancel if nothing selected
[ -z "$WALL" ] && notify-send "❌ No wallpaper selected" && exit

# Cancel if selected non image
[[ "$WALL" =~ \.(jpg|jpeg|png|webp)$ ]] || {
  notify-send "❌ Not an image: $WALL"
  exit
}

# Normalize full path
WALL=$(realpath "$WALL")

# Set wallpaper with hyprpaper
hyprpaper-client unload all
hyprpaper-client preload "$WALL"

# Auto-detect monitors
MONITORS=$(hyprctl monitors | awk '/Monitor/ {print $2}')
for MON in $MONITORS; do
  hyprpaper-client wallpaper "$MON,$WALL"
done

# Save to config
echo "preload = $WALL" >~/.config/hypr/hyprpaper.conf
for MON in $MONITORS; do
  echo "wallpaper = $MON,$WALL" >>~/.config/hypr/hyprpaper.conf
done

# Generate pywal theme
wal -i "$WALL"
nvim --headless "+lua require('lushwal').generate()" +qa
sed -i "s|^ *path = .*|    path = $WALL|" ~/.config/hypr/hyprlock.conf
~/.config/hypr/update-hypr-colors.sh
~/.config/dunst/update-dunst-colors.sh

# Reload components
killall waybar && waybar &
killall dunst && dunst &
hyprctl reload
killall hyprpaper
sleep 0.2
hyprpaper &

notify-send "🎨 Wallpaper & theme updated!"
