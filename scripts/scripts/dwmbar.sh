#!/bin/bash

while true; do
  temp="$(/home/ditya/.config/waybar/avg-temp.sh)"
  volume="$(pamixer --get-volume)%"
  brightness=$(brightnessctl -m | cut -d',' -f4)
  battery1="$(acpi -b | grep '^Battery 0' | awk -F', ' '{print $2}')"
  battery2="$(acpi -b | grep '^Battery 1' | awk -F', ' '{print $2}')"
  date="$(date '+%a %d %b %H:%M')"

  xsetroot -name "$temp | 󰕾 $volume | 󰃟 $brightness |  $battery1: $battery2 | $date"
  sleep 5
done
