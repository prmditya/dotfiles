#!/bin/bash

DIR="$HOME/Pictures/Screenshots/"
mkdir -p "$DIR"

FILE="$DIR/screenshot-$(date +%Y%m%d-%H%M%S).png"

case "$1" in
area)
  maim -s "$FILE" && notify-send "📸 Area Screenshot Saved" "$FILE"
  ;;
full)
  maim "$FILE" && notify-send "📸 Fullscreen Screenshot Saved" "$FILE"
  ;;
window)
  maim -i "$(xdotool getactivewindow)" "$FILE" && notify-send "📸 Window Screenshot Saved" "$FILE"
  ;;
clipboard)
  maim -s | xclip -selection clipboard -t image/png && notify-send "📸 Screenshot Copied to Clipboard"
  ;;
*)
  echo "Usage: $0 {area|full|window|clipboard}"
  ;;
esac
