#!/bin/sh
cat /proc/net/wireless \
  | grep "wlp3s0"      \
  | awk '{print $4}'   \
  | grep -o '[0-9]*'
