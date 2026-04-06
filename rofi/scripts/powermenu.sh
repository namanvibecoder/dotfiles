#!/bin/bash

# Options
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend="⏾ Suspend"
logout=" Logout"
chosen=$(printf "%s\n%s\n%s\n%s\n%s" "$shutdown" "$reboot" "$lock" "$suspend" "$logout" | rofi -dmenu -i -theme ~/.config/rofi/themes/powermenu.rasi -p "Power")

case "$chosen" in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        i3lock
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$logout")
        i3-msg exit
        ;;
esac

