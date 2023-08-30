#!/usr/bin/env sh

# make sure there isn't already a dbus session on the host system
# the only dbus session must be the one from sway!
# check systemctl --user status dbus.service, it should be dead!
systemctl --user stop dbus.service

# now we can make our own dbus session
GTK_THEME=adw-gtk3-dark LF_LEVEL=0 exec dbus-run-session sway
# loginctl also only shows 1 seat i think
