#!/usr/bin/env sh

PROGRAM="$1"

case "$PROGRAM" in
    lf)
        while true; do
            lf -config config/lf/lfrc
        done
        ;;
    nvim)
        while true; do
            nvim -u config/nvim/init.vim
        done
        ;;
    *)
        echo unknown program
        exit 1
        ;;
esac
