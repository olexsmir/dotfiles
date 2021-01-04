#!/bin/sh
declare options=("ShutDown
Lock
Logout
Reboot")

choice=$(echo -e "${options[@]}"|dmenu -p "Power" $@)
case "$choice" in
    "ShutDown")
        case "$(echo -e "Yes\nNo"|dmenu -p "ShutDown" $@)" in
            "Yes") exec systemctl poweroff ;;
            "No")  exec exit 0             ;;
        esac
    ;;
    "Lock") exec betterlockscreen --off 300 -t "Computer is lockerd" -l ;;
    "Logout")
        case "$(echo -e "Yes\nNo"|dmenu -p "ShutDown" $@)" in
            "Yes") exec loginctl terminate-session $XDG_SESSION_ID ;;
            "No")  exec exit 0                                     ;;
        esac
    ;;
    "Reboot")
        case "$(echo -e "Yes\nNo"|dmenu -p "Reboot" $@)" in
            "Yes") exec systemctl reboot ;;
            "No")  exec exit 0           ;;
        esac
    ;;
esac
