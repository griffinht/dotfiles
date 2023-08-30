#!/usr/bin/env sh

set -e

wg-quick up hot_desktop
mount -t nfs4 hot-desktop.wg.griffinht.com:/ /home/griffin/public
wg-quick up envy_laptop
