#!/bin/sh

set -xe

# todo what a neat trick!
SOCKET=$(git rev-parse --show-toplevel)/.guile-repl.socket
if [ -f $SOCKET ]; then rm $SOCKET; fi
guile --listen=$SOCKET
rm $SOCKET
