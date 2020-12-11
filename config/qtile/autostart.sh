#!/bin/sh
setxkbmap "us,ru,ua" ",winkeys" "grp:alt_shift_toggle" -option "ctrl:nocaps"
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
picom -b &
