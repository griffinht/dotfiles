#!/usr/bin/env sh

first="$1"
shift 1

exec guix "$first" -L . $@
