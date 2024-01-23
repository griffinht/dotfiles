#!/usr/bin/env sh

PROGRAM="$1"

case "$PROGRAM" in
    lf)
        #while true; do
        lf -config config/lf/lfrc
        #done
        ;;
    lf2)
        #while true; do
        echo "lf -config $PWD/config/lf/lfrc"
        #done
        ;;
    lf3)
        #while true; do
        XDG_CONFIG_HOME="$PWD/config" PATH="$PWD/bin:$PATH" lf
        #done
        ;;
    nvim)
        #while true; do
        #XDG_CONFIG_HOME=$PWD/config "$@"
        echo "XDG_CONFIG_HOME=$PWD/config nvim <>"
        #done
        ;;
    sway)
        rm ~/.config/sway || exit 1
        ln -s "$PWD/config/sway" ~/.config/sway || exit 1
        echo debug mode done, try swaymsg reload, next guix home reconfigure will revert this
        ;;
    bash)
        rm ~/.bashrc || exit 1
        ln -s "$PWD/bashrc" ~/.bashrc || exit 1
        echo 'done'
        ;;
    fish)
        #while true; do
        XDG_CONFIG_HOME=$PWD/config fish
        # fish always likes to create this file
        echo cleaning up...
        rm -f config/fish/fish_variables
        rmdir config/fish/completions
        rmdir config/fish/functions
        #done
        ;;
    gtk)
        rm ~/.config/gtk-3.0
        rm ~/.config/gtk-4.0
        ln -s "$PWD/config/gtk-x" ~/.config/gtk-3.0
        ln -s "$PWD/config/gtk-x" ~/.config/gtk-4.0
        ;;
    docker)
        shift
        docker --config "$PWD/docker" "$@"
        ;;
    *)
        XDG_CONFIG_HOME="$PWD/config" "$@"
        ;;
esac
