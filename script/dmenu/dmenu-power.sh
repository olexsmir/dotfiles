#!/bin/sh

declare options=("Shut Down
Reboot
Logout
Suspend
Lock Screen")

choice=$(echo -e "${options[@]}" | dmenu -p 'Power' $@)

case "$choice" in
    "Shut Down")
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Power' $@)
        case "$yesno" in
            "Yes") exec systemctl poweroff ;;
            "No") exec exit 0 ;;
        esac
    ;;
    "Reboot")
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Power' $@)
        case "$yesno" in
            "Yes") exec systemctl reboot ;;
            "No") exec exit 0 ;;
        esac
    ;;
    "Logout")
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Power' $@)
        case "$yesno" in
            "Yes") exec loginctl terminate-session $XDG_SESSION_ID ;;
            "No") exec exit 0 ;;
        esac
    ;;
    "Lock Screen") 
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Power' $@)
        case "$yesno" in
            "Yes") exec loginctl lock-session $XDG_SESSION_ID ;;
            "No") exec exit 0 ;;
        esac
    ;;
    *) exit 1 ;;
esac
