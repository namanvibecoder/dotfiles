#!/bin/bash

# Get battery percentage
capacity=$(cat /sys/class/power_supply/BAT*/capacity)

# Get charging status
status=$(cat /sys/class/power_supply/BAT*/status)

# Choose icon based on battery level
if [[ $capacity -ge 90 ]]; then
    icon="󰁹"
elif [[ $capacity -ge 75 ]]; then
    icon="󰂁"
elif [[ $capacity -ge 50 ]]; then
    icon="󰁿"
elif [[ $capacity -ge 25 ]]; then
    icon="󰁻"
else
    icon="󰁺"
fi

# Charging icon override
if [[ "$status" == "Charging" ]]; then
    icon="󰂄"
fi

# Output
echo "$icon $capacity%"
