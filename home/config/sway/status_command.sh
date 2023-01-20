#!/usr/bin/env sh

# kind of laggy and a little broken
printf "%s%% %s\n" "$(cat /sys/class/power_supply/BAT0/capacity)" "$(date +'%Y-%m-%d %I:%M:%S %p')";
