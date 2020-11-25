#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c ~/.config/berry/polybar/polybar top &
polybar -c ~/.config/berry/polybar/polybar bom &
