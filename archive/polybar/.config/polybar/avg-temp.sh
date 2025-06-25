#!/bin/bash
# Get average CPU temp after cleaning non-numeric characters

# For Intel CPUs (using Core)
temps=$(sensors | grep 'Core [0-9]' | awk '{gsub(/[^0-9.]/, "", $3); print $3}')

# Calculate average
sum=0
count=0
for temp in $temps; do
  sum=$(echo "$sum + $temp" | bc)
  count=$((count + 1))
done

average=$(echo "scale=1; $sum / $count" | bc)
echo "${average}°C"
