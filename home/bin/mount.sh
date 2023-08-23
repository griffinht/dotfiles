#!/usr/bin/env sh

sudo wg-quick up hot-desktop
sudo mount -t nfs4 hot-desktop.wg.griffinht.com:/ public
sudo wg-quick up envy-laptop
