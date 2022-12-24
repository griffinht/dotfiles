#!/usr/bin/env sh

toggle_path="$1"
toggle_on="$2"
toggle_off="$3"

toggle="$(cat $toggle_path)"

if [ $toggle == 1 ]; then
	$toggle_on
	toggle=0
else 
	$toggle_off
	toggle=1
fi

echo "$toggle" > "$toggle_path"
