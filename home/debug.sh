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
            XDG_CONFIG_HOME=$PWD/config nvim
        done
        ;;
    sway)
        rm ~/.config/sway || exit 1
        ln -s $PWD/config/sway ~/.config/sway || exit 1
        echo done
        ;;
    bash)
        rm ~/.bashrc || exit 1
        ln -s $PWD/bashrc ~/.bashrc || exit 1
        echo done
        ;;
    fish)
        while true; do
            XDG_CONFIG_HOME=$PWD/config fish
        done
        ;;
    *)
        echo unknown program
        exit 1
        ;;
esac
