#!/usr/bin/env sh

muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep yes > /dev/null
}

border() {
    if muted; then
        # red
        printf ff0000
    else
        # white
        printf ffffff
    fi
}

toggle_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}' 
}

set_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ "$1"%
}

COMMAND="$1"

if [ "$COMMAND" == "mute" ]; then
    toggle_mute
else
    set_volume "$COMMAND"
fi

printf "%s %s %s %s\n" "$(volume)" 000000 "$(border)" ffffff
