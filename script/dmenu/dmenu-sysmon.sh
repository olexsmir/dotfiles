#!/bin/sh

declare options=("htop
bashtop
gtop")

choice=$(echo -e "${options[@]}" | dmenu -h 24 -p 'System monitor ')

case "$choice" in
    htop) choice="htop" ;;
    bashtop) choice="bashtop" ;;
    gtop) choice="gtop" ;;
    *) exit 1 ;;
esac
kitty -e "$choice"
