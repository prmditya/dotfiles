#!/bin/bash
WALLPAPER="$HOME/Pictures/Wallpapers/mbeek.png"

# 1. Handle ImageMagick v7 warning
if command -v magick &>/dev/null; then
  CONVERT="magick convert"
else
  CONVERT="convert"
fi

# 2. Verify X11 session
if [ "$XDG_SESSION_TYPE" != "x11" ]; then
  notify-send "Error" "This script requires X11. Detected: $XDG_SESSION_TYPE"
  exit 1
fi

# 3. Create locked version
$CONVERT "$WALLPAPER" \
  -blur 0x8 \
  -fill black -colorize 30% \
  /tmp/locked-wallpaper.png

# 4. Lock with i3lock
i3lock \
  -i /tmp/locked-wallpaper.png \
  --tiling \
  --nofork \
  --ignore-empty-password \
  --pointer=default

# 5. Cleanup
rm -f /tmp/locked-wallpaper.png
