#!/usr/bin/env sh

set -e

sudo $(which wg-quick) up hot_desktop
sudo $(which mount.nfs) hot-desktop.wg.griffinht.com:/ /home/griffin/public
sudo $(which wg-quick) up envy_laptop
