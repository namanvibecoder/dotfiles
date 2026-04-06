#!/bin/bash

# Check if WiFi is OFF
if [[ "$(nmcli radio wifi)" == "disabled" ]]; then
    echo "󰖪 WiFi Off"
    exit
fi

# Get connected SSID
ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)

# Get signal strength
signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d: -f2)

# If connected
if [[ -n "$ssid" ]]; then
    # Choose icon based on signal strength
    if [[ $signal -ge 75 ]]; then
        icon="󰤨"   # strong
    elif [[ $signal -ge 50 ]]; then
        icon="󰤥"   # medium
    elif [[ $signal -ge 25 ]]; then
        icon="󰤢"   # weak
    else
        icon="󰤟"   # very weak
    fi

    echo "$icon"
else
    echo "󰤭 "
fi
