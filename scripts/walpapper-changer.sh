#!/bin/bash
WALLPAPERS=/home/sasha/Изображения/Walpapper
SLEEP_TIME=60

while true; do
    feh --randomize --bg-scale $WALLPAPERS/*
    sleep $SLEEP_TIME;
done

