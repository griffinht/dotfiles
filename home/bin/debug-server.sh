#!/usr/bin/env sh

set -e

echo
echo working directory:
pwd
echo

run() {
    echo running "$@"
    echo

    exitcode=0
    # prevent the script from exiting from set -e
    "$@" || exitcode="$?"

    echo
    echo "Process exited with code $exitcode"
    #echo "$exitcode" > "$file"
}

if true; then
    run "$@"
    echo "Press enter key to exit..."
    read -r
    exit 0
fi

file="$1"
initial_command="$2"

echo "creating debug terminal server instance at $file"
mkfifo "$file"
trap 'echo caught exit, cleaning up...; rm $file' EXIT

run "$initial_command"

while true; do
    run "$(cat "$file")"
done
