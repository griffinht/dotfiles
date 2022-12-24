#!/usr/bin/env sh

# interpret each toggle command through the shell
exec_toggle() {
	sh -c "$1"
}

toggle_path="$1"
toggle_on="$2"
toggle_off="$3"

toggle="$(cat $toggle_path)"

if [ $toggle == 1 ]; then
	exec_toggle "$toggle_on"
	toggle=0
else 
	exec_toggle "$toggle_off"
	toggle=1
fi

echo "$toggle" > "$toggle_path"
