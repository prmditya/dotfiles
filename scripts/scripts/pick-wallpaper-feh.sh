#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"

# Ensure dependencies
for cmd in nsxiv wal feh; do
  command -v "$cmd" &>/dev/null || {
    notify-send "❌ Missing dependency: $cmd"
    exit 1
  }
done

# Select image
WALL=$(nsxiv -t -o "$WALL_DIR" | head -n 1)
[ -z "$WALL" ] && notify-send "❌ No wallpaper selected." && exit 0

# Valid format check
[[ ! "$WALL" =~ \.(jpg|jpeg|png|webp|gif|bmp)$ ]] && {
  notify-send "❌ Unsupported format: $(basename "$WALL")"
  exit 1
}

WALL=$(realpath "$WALL")

# Apply wallpaper
feh --bg-scale "$WALL"

# Generate pywal theme
wal --cols16 lighten -i "$WALL" || notify-send "❌ Pywal theme generation failed." && exit 1

# Update dunst if exists
if [ -x ~/.config/dunst/update-dunst-colors.sh ]; then
  ~/.config/dunst/update-dunst-colors.sh && notify-send "✔️ Dunst reloaded." || notify-send "❌ Dunst reload failed."
else
  notify-send "⚠️ Dunst color script not found."
fi

# Reload dwm colors — optional (manual recompile needed)
# echo "⚠️ DWM needs to be recompiled for new colors" | dunstify -u low

# Update spicetify if available
if command -v pywal-spicetify &>/dev/null; then
  pywal-spicetify text && notify-send "✔️ Spicetify updated." || notify-send "❌ Spicetify failed."
fi

notify-send "🎉 Wallpaper + Theme Updated!" -u normal
