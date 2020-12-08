#!/bin/bash

## WIFI SIGNAL
wifi() {
  wifis=$(cat /proc/net/wireless | grep "wlp3s0" | awk '{print $4}' | grep -o '[0-9]*')
  echo -e " $wifis%"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
    echo -e " $vol"
}


## KEYBOARD
keyl() {
    case "$(xkblayout)" in
        Eng) date="us";;
        Rus) date="ru";;
        Ukr) date="ua";;
    esac
    echo -e " $date"
}


SLEEP_SEC=0
while :; do
    echo "+@fg=2;$(keyl) +@fg=0; +@fg=3;$(vol) +@fg=0; +@fg=4;$(wifi) +@fg=0;"
	sleep $SLEEP_SEC
done

