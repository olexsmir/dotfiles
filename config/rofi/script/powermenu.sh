#!/usr/bin/env bash
declare options=("ShutDown\nLogOut\nReboot")

choice=$(echo -e ${options[@]} | rofi -dmenu -p "Power" -theme nten-dmenu)
case $choice in
    "ShutDown")
        case "$(echo -e "Yes\nNo" | rofi -dmenu -p "ShutDown" -theme nten-dmenu)" in
            "Yes") exec systemctl poweroff ;;
            "no")  exec exit 0             ;;
        esac
    ;;
    "LogOut")
        case "$(echo -e "Yes\nNo" | rofi -dmenu -p "LogOut" -theme nten-dmenu)" in
            "Yes") exec loginctl terminate-session $XDG_SESSION_ID ;;
            "No")  exec exit 0                                     ;;
        esac
    ;;
    "Reboot")
        case "$(echo -e "Yes\nNo" | rofi -dmenu -p "Reboot" -theme nten-dmenu)" in
            "Yes") exec systemctl reboot ;;
            "No")  exec exit 0           ;;
        esac
    ;;
esac
