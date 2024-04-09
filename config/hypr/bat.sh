#!/usr/bin/env bash

# the purpose of the script is to notify when battery percentage is low

while true; do
    lvl=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$lbl" -le 30 ]; then
        notify-send --urgency=CRITICAL "Battery Low" "Consider plugging cable in"
        sleep 1200
    else
        sleep 120
    fi
done
