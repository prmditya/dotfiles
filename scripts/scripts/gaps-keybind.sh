#!/usr/bin/env bash

gaps_in=$(hyprctl -j getoption general:gaps_in | jq '.custom' | awk '{print $1}' | cut -c 2-)
gaps_out=$(hyprctl -j getoption general:gaps_out | jq '.custom' | awk '{print $1}' | cut -c 2-)

function turn_on_gaps() {
  hyprctl keyword general:gaps_in $((3))
  hyprctl keyword general:gaps_out $((10))
}

function turn_off_gaps() {
  hyprctl keyword general:gaps_in $((0))
  hyprctl keyword general:gaps_out $((0))
}

while [[ $# -gt 0 ]]; do
  case $1 in
  --turn-on-gaps)
    turn_on_gaps
    ;;
  --turn-off-gaps)
    turn_off_gaps
    ;;
  *)
    printf "Error: Unknown option %s" "$1"
    exit 1
    ;;
  esac
  shift
done
