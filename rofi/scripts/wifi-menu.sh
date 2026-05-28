#!/bin/bash

THEME="$HOME/.config/rofi/themes/purple.rasi"

wifi_list=$(nmcli -t -f IN-USE,SSID,SECURITY dev wifi list | sed 's/:/  /g')

chosen=$(echo -e "$wifi_list" | rofi -dmenu -i -theme $THEME -p "WiFi")

ssid=$(echo "$chosen" | cut -d ' ' -f2-)

if [[ -z "$ssid" ]]; then
    exit
fi

security=$(echo "$chosen" | awk '{print $3}')

if [[ "$security" != "--" ]]; then
    password=$(rofi -dmenu -password -theme $THEME -p "Password")
    nmcli dev wifi connect "$ssid" password "$password"
else
    nmcli dev wifi connect "$ssid"
fi
