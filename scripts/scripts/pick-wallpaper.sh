#!/bin/bash

# Define the directory where wallpapers are stored.
WALL_DIR="$HOME/Pictures/Wallpapers"

# Ensure nsxiv is installed before proceeding.
if ! command -v nsxiv &>/dev/null; then
  notify-send "❌ Error: nsxiv is not installed. Please install it to use this script."
  exit 1
fi

# Show nsxiv in thumbnail mode for user selection.
# -t: thumbnail mode
# -o: print selected files to stdout
# head -n 1: only take the first selected file
WALL=$(nsxiv -t -o "$WALL_DIR" | head -n 1)

# Cancel if no wallpaper was selected by the user.
if [ -z "$WALL" ]; then
  notify-send "❌ No wallpaper selected. Aborting."
  exit 0 # Exit successfully as it's a user cancellation, not an error
fi

# Cancel if the selected file is not a common image format.
# This uses a case-insensitive regex match.
if [[ ! "$WALL" =~ \.(jpg|jpeg|png|webp|gif|bmp)$ ]]; then
  notify-send "❌ Not a supported image format: $(basename "$WALL"). Supported: JPG, PNG, WEBP, GIF, BMP."
  exit 1 # Exit with an error code
fi

# Normalize the full path of the selected wallpaper.
# This handles cases where nsxiv might return a relative path.
WALL=$(realpath "$WALL")

# --- Apply Wallpaper with hyprpaper ---
# Ensure hyprpaper-client is available.
if ! command -v hyprpaper-client &>/dev/null; then
  notify-send "❌ Error: hyprpaper-client is not installed or not in PATH."
  exit 1
fi

hyprpaper-client unload all || { notify-send "❌ Failed to unload existing wallpapers."; }
hyprpaper-client preload "$WALL" || {
  notify-send "❌ Failed to preload wallpaper: $WALL"
  exit 1
}

# Auto-detect currently connected monitors using hyprctl.
# Ensure hyprctl is available.
if ! command -v hyprctl &>/dev/null; then
  notify-send "❌ Error: hyprctl is not installed or not in PATH."
  exit 1
fi

MONITORS=$(hyprctl monitors | awk '/Monitor/ {print $2}')
if [ -z "$MONITORS" ]; then
  notify-send "⚠️ Warning: No monitors detected by hyprctl. Wallpaper might not apply correctly."
fi

for MON in $MONITORS; do
  hyprpaper-client wallpaper "$MON,$WALL" || notify-send "❌ Failed to set wallpaper on monitor: $MON"
done

# --- Save Wallpaper Configuration to hyprpaper.conf ---
# Overwrite the hyprpaper.conf with only the new wallpaper settings.
# This assumes you only want preload/wallpaper lines in this config.
# If you have other persistent hyprpaper settings, you might need a more
# sophisticated parsing/editing approach (e.g., sed or config file library).
echo "preload = $WALL" >~/.config/hypr/hyprpaper.conf
for MON in $MONITORS; do
  echo "wallpaper = $MON,$WALL" >>~/.config/hypr/hyprpaper.conf
done
notify-send "✔️ hyprpaper.conf updated with new wallpaper."

# --- Generate pywal Theme ---
# Ensure wal is installed.
if ! command -v wal &>/dev/null; then
  notify-send "❌ Error: wal (pywal) is not installed. Skipping theme generation."
else
  # Generate a 16-color theme using pywal, lightening the colors.
  wal --cols16 lighten -i "$WALL" || notify-send "❌ Failed to generate pywal theme."

  # Update hyprlock.conf with the new wallpaper path for the lockscreen.
  # This uses sed to find and replace the 'path =' line.
  sed -i "s|^ *path = .*|    path = $WALL|" ~/.config/hypr/hyprlock.conf || notify-send "❌ Failed to update hyprlock.conf."

  # Execute spicetify and dunst update scripts if they exist and are executable.
  if command -v pywal-spicetify &>/dev/null; then
    pywal-spicetify text || notify-send "❌ pywal-spicetify failed."
  else
    notify-send "⚠️ pywal-spicetify not found. Skipping Spicetify theme update."
  fi

  if [ -x ~/.config/dunst/update-dunst-colors.sh ]; then
    ~/.config/dunst/update-dunst-colors.sh || notify-send "❌ Dunst color update script failed."
  else
    notify-send "⚠️ Dunst update script not found or not executable. Skipping Dunst color update."
  fi
  notify-send "✔️ Pywal theme generated and configurations updated."
fi

# --- Reload Components ---
# Reload Waybar: kill existing instances and start a new one.
if pgrep -x "waybar" >/dev/null; then
  killall waybar && waybar &
  disown
  notify-send "✔️ Waybar reloaded."
else
  waybar &
  disown # Start if not running
  notify-send "✔️ Waybar started."
fi

# Reload Dunst: kill existing instances and start a new one.
if pgrep -x "dunst" >/dev/null; then
  killall dunst && dunst &
  disown
  notify-send "✔️ Dunst reloaded."
else
  dunst &
  disown # Start if not running
  notify-send "✔️ Dunst started."
fi

# Reload Hyprland configuration. This typically restarts applications
# like hyprpaper if they are part of Hyprland's startup config.
hyprctl reload || notify-send "❌ Failed to reload Hyprland configuration."
notify-send "✔️ Hyprland configuration reloaded."

# Restart hyprpaper explicitly, in case hyprctl reload doesn't fully handle it
# or if hyprpaper is not managed by Hyprland's startup.
if pgrep -x "hyprpaper" >/dev/null; then
  killall hyprpaper
  sleep 0.2 # Give it a moment to fully terminate
  hyprpaper &
  disown
  notify-send "✔️ Hyprpaper restarted."
else
  hyprpaper &
  disown # Start if not running
  notify-send "✔️ Hyprpaper started."
fi

notify-send "🎉 Wallpaper & theme updated successfully!"
