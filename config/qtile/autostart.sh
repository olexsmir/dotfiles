#!/bin/sh
xautolock -time 5 -locker "betterlockscreen --off 300 -t \"Computer is lockerd\" -l" &
setxkbmap "us,ua" ",winkeys" "grp:alt_shift_toggle" -option "ctrl:nocaps" &
nitrogen --restore &
lxsession &
picom -b &
