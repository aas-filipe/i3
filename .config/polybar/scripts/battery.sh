#!/usr/bin/env bash

# Get battery percentage and status
info=$(acpi -b)
percent=$(echo "$info" | grep -oP '[0-9]+(?=%)')
status=$(echo "$info" | awk '{print $3}' | tr -d ',')

# Choose icon based on percentage / status
if [ "$status" = "Charging" ]; then
    icon=""
    icon="%{F#bd93f9}$icon%{F-}"
elif [ "$status" = "Full" ]; then
    icon=""
#    icon="%{F#bd93f9}$icon%{F-}"
elif [ "$percent" -ge 80 ]; then
    icon=""
#    icon="%{F#bd93f9}$icon%{F-}"
elif [ "$percent" -ge 60 ]; then
    icon=""
#    icon="%{F#bd93f9}$icon%{F-}"
elif [ "$percent" -ge 40 ]; then
    icon=""
#    icon="%{F#bd93f9}$icon%{F-}"
elif [ "$percent" -ge 20 ]; then
    icon=""
    icon="%{F#BF616A}$icon%{F-}"
else
    icon=""
    icon="%{F#BF616A}$icon%{F-}"
fi

# Output icon + percentage
echo "$icon $percent%"
