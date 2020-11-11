#!/bin/sh
setxkbmap "us,ru" ",winkeys" "grp:alt_shift_toggle" -option "ctrl:nocaps"
picom -b &
nitrogen --restore &
kitty &
