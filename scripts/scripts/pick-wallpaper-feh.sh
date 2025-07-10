#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"
CURRENT_WALL="$HOME/.cache/current_wallpaper"

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

# Apply wallpaper
feh --bg-scale "$WALL"
echo "$WALL" >"$CURRENT_WALL"

# Generate pywal theme
if wal --cols16 lighten -i "$WALL"; then
  # Pywal theme generation succeeded.
  # No action needed here, the script will continue.
  : # This is a no-op command, simply does nothing.
else
  # Pywal theme generation failed.
  notify-send "❌ Pywal theme generation failed."
  exit 1 # Exit the script with an error code
fi

# Update dunst if exists
if [ -x /home/ditya/.config/dunst/update-dunst-colors.sh ]; then
  ~/.config/dunst/update-dunst-colors.sh
  if [ $? -eq 0 ]; then
    notify-send "✔️ Dunst reloaded."
  else
    notify-send "❌ Dunst reload failed. Check logs."
  fi
else
  notify-send "⚠️ Dunst color script not found."
fi

# Reload dwm colors — optional (manual recompile needed)
# echo "⚠️ DWM needs to be recompiled for new colors" | dunstify -u low

# Update spicetify if available
# Execute spicetify and dunst update scripts if they exist and are executable.
if command -v pywal-spicetify &>/dev/null; then
  pywal-spicetify text || notify-send "❌ pywal-spicetify failed."
else
  notify-send "⚠️ pywal-spicetify not found. Skipping Spicetify theme update."
fi

xdotool key 'Super+F5'
notify-send "🎉 Wallpaper + Theme Updated!"
