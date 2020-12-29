#!/bin/sh
declare options=("Poweroff
Lock
Logout
Reboot")

choice=$(echo -e "${options[@]}" | dmenu -p 'Power' $@)
case "$choice" in
    "Poweroff")
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Power' $@)
        case "$yesno" in
            "Yes") exec systemctl poweroff ;;
            "No") exec exit 0 ;;
        esac
    ;;
    "Lock") 
        exec betterlockscreen --off 300 -t "Computer is lockerd" -l ;;
    "Logout")
        declare opt=("Yes\nNo")
        yesno=$(echo -e "${opt[@]}" | dmenu -p 'Logout' $@)
        case "$yesno" in
            "Yes") 
                if [[ "$(pgrep spectrwm)" ]]; then
                    exec pkill spectrwm
                else
                    exec loginctl terminate-session $XDG_SESSION_ID
                fi
            ;;
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
    *) exit 1 ;;
esac
