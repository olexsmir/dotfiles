#!/bin/sh
declare options=("ShutDown
Lock
Logout
Reboot")

menucmd="rofi -dmenu"
choice=$(echo -e "${options[@]}"|${menucmd} -p "Power" $@)
case "$choice" in
    "ShutDown")
        case "$(echo -e "Yes\nNo"|${menucmd} -p "ShutDown" $@)" in
            "Yes") exec systemctl poweroff ;;
            "No")  exec exit 0             ;;
        esac ;;
    "Lock") exec betterlockscreen --off 300 -t "Computer is lockerd" -l ;;
    "Logout")
        case "$(echo -e "Yes\nNo"|${menucmd} -p "Logout" $@)" in
            "Yes") exec loginctl terminate-session $XDG_SESSION_ID ;;
            "No")  exec exit 0                                     ;;
        esac ;;
    "Reboot")
        case "$(echo -e "Yes\nNo"|${menucmd} -p "Reboot" $@)" in
            "Yes") exec systemctl reboot ;;
            "No")  exec exit 0           ;;
        esac ;;
esac
