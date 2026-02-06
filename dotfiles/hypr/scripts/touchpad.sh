#!/bin/bash
TOUCHPAD1="elan0412:01-04f3:3240-touchpad"
STATUS_FILE="/tmp/touchpad_status"

if [ ! -f "$STATUS_FILE" ] || [ "$(cat $STATUS_FILE)" = "on" ]; then
    hyprctl keyword "device[$TOUCHPAD1]:enabled" false
    echo "off" > "$STATUS_FILE"
    notify-send "Touchpad" "Turned off" -t 1000
else
    hyprctl keyword "device[$TOUCHPAD1]:enabled" true
    echo "on" > "$STATUS_FILE"
    notify-send "Touchpad" "Turned on" -t 1000
fi
