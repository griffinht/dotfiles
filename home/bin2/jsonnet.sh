#!/bin/sh

file="${1?please specify a file}"

case "$file" in
    *.json)
        jsonnet "$file"
        ;;
    *)
        cat "$file"
        ;;
esac
