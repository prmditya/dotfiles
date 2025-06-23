#!/bin/bash
WALLPAPER="$HOME/Pictures/Wallpapers/mbeek.png"

# 1. Handle ImageMagick v7 warning
# This part is CLI-based and works fine on Wayland as well.
if command -v magick &>/dev/null; then
  CONVERT="magick convert"
else
  CONVERT="convert"
fi

# 2. Remove X11 session verification
# This check is for X11, and we're moving to Wayland (Sway), so it should be removed.
# If you keep it, the script would exit immediately in a Sway session.
# if [ "$XDG_SESSION_TYPE" != "x11" ]; then
#   notify-send "Error" "This script requires X11. Detected: $XDG_SESSION_TYPE"
#   exit 1
# fi

# 3. Create locked version
# ImageMagick is a command-line tool, so this works independently of the display server.
$CONVERT "$WALLPAPER" \
  -blur 0x8 \
  -fill black -colorize 30% \
  /tmp/locked-wallpaper.png

# 4. Lock with swaylock (replacement for i3lock)
# swaylock is the Wayland-native screen locker for Sway.
# Options removed:
# - --tiling: swaylock doesn't have a direct tiling option for images like i3lock did.
#             It defaults to scaling the image to fit. If you need explicit tiling,
#             you'd preprocess the image with `convert` to tile it before passing to `swaylock`.
# - --nofork: swaylock runs in the foreground by default, so this is implicit.
# - --ignore-empty-password: swaylock handles empty passwords by default.
# - --pointer=default: Swaylock doesn't have this specific option; pointer appearance is
#                      generally handled by the Wayland compositor/theme.
swaylock \
  -i /tmp/locked-wallpaper.png

# 5. Cleanup
rm -f /tmp/locked-wallpaper.png
