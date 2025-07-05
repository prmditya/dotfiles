#!/bin/bash

while true; do
  temp="$(/home/ditya/.config/waybar/avg-temp.sh)"
  volume="$(pamixer --get-volume)%"
  brightness=$(brightnessctl -m | cut -d',' -f4)
  battery="$(acpi -b | grep '^Battery 0' | awk -F', ' '{print $2}')"
  date="$(date '+%a %d %b %H:%M')"

  xsetroot -name " $temp | 󰕾 $volume | 󰃟 $brightness |  $battery | $date"
  sleep 5
done
