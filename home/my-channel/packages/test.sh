#!/bin/sh

set -x
set -e

SOCKET=$(git rev-parse --show-toplevel)/.guile-repl.socket
if [ -f "$SOCKET" ]; then rm "$SOCKET"; fi
# https://guix.gnu.org/manual/en/html_node/Invoking-guix-repl.html
guix repl --listen="unix:$SOCKET"
rm "$SOCKET"
