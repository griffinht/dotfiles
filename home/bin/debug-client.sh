#!/usr/bin/env sh

id="$5"
if true; then
    exec foot \
        --title="Debugging $id" \
        debug-server.sh "$@"
fi

# todo just escape the file path instead of b64 encoding (b64 is unreadable)
file="/home/griffin/$(echo "$id" | base64)"

if ! [ -p "$file" ]; then
    # spawn server asynchronously if it does not exist
    debug-server.sh "$file" "$@"
    # todo wait for file to be created????
    exit "$?"
fi

echo "connecting to debug terminal server instance at $file"

echo telling server to run "$@"
echo "$@" > "$file"
sleep 1
echo all done
exit 0
echo done, waiting for response
exitcode="$(cat < "$file")"
echo "got response: $exitcode"

exit 0

exec foot \
    --app-id=5 \
    --title="my custom debug console: $id" \
    /home/griffin/test2.sh "$@"
