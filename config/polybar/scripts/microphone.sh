#!/bin/bash
MICSYMBOL=$1
MICMUTEDSYMBOL=$2

case "$1" in
    --click)
	amixer -D pulse sset Capture toggle
	;;
    *)
	;;
esac

STATUS=$(amixer -D pulse get Capture | grep -E "\[on\]|\[off\]" | cut -s -d ' ' -f 8 | uniq)

if [[ $STATUS = "[on]" ]]; then
    echo $MICSYMBOL
elif [[ $STATUS = "[off]" ]]; then
    echo $MICMUTEDSYMBOL
else
    echo "Not working, check script."
fi
