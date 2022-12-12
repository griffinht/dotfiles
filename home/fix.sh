#!/bin/sh

systemctl --user stop xdg-desktop-portal

XDG_CURRENT_DESKTOP=sway systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
hash dbus-update-activation-environment
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK

systemctl --user restart xdg-desktop-portal
