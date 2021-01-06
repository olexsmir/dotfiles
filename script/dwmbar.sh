#!/bin/sh
getDate() {
    local date="$(date +%d.%m.%Y)"
    echo " ${date}"
}
getTime() {
    local time="$(date +%H:%M)"
    echo " ${time}"
}
getVolume() {
    local volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
    echo " ${volume}"
}
getKeyLayout() {
    case "$(xkblayout)" in
        "Eng") echo " us" ;;
        "Rus") echo " ru" ;;
        "Ukr") echo " ua" ;;
    esac
}

while true; do
    xsetroot -name " $(getVolume) | $(getKeyLayout) | $(getTime) | $(getDate)"
    sleep 0
done
