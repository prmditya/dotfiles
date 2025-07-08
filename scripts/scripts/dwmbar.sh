#!/bin/bash
while true; do
  temp="$(/home/ditya/.config/waybar/avg-temp.sh)"
  volume="$(pamixer --get-volume)%"
  brightness=$(brightnessctl -m | cut -d',' -f4)
  battery1="$(acpi -b | grep '^Battery 0' | awk -F', ' '{print $2}')"
  battery2="$(acpi -b | grep '^Battery 1' | awk -F', ' '{print $2}')"
  battery1_num=$(echo "${battery1}" | sed 's/%//')
  battery2_num=$(echo "${battery2}" | sed 's/%//')
  if ((battery1_num > 0)); then
    display_battery=$battery1
  elif ((battery2_num > 0)); then
    display_battery=$battery2
  fi
  echo $display_battery
  date="$(date '+%a %d %b %H:%M')"
  xsetroot -name "$temp | 󰕾 $volume | 󰃟 $brightness |  $display_battery | $date"
  sleep 5
done
