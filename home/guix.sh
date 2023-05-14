#!/usr/bin/env sh


# currently gives a ton of errors because guix tries to look at everthing in here

first="$1"
shift 1

exec guix "$first" -L my-channel $@
