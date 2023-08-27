install nothing not even system utils

network-manager
wget gpg xz-utils
apt install network-manager

guix
https://guix.gnu.org/manual/en/html_node/Binary-Installation.html


git clone https://griffinht.com/git/hot.git/

infrastructure/wireguard/ and generate keys
import with existing system
guix shell wireguard-tools
wg-quick up hot-desktop

mount drive, symlink griffin, git clone
guix home import ~?
guix home reconfigure ~/home....scm

GIT_SSL_NO_VERIFY=bruh git clone ...

sudo apt install nscd nfs-common

/etc/systemd/system/guix-daemon.service
add nonguix --substitue urls to execstart

`/etc/systemd/system/guix-daemon.serivce`
```
[Service]
# substituv urls added manually
ExecStart=/var/guix/profiles/per-user/root/current-guix/bin/guix-daemon \
    --build-users-group=guixbuild --discover=yes \
    --substitute-urls='https://substitutes.nonguix.org https://ci.guix.gnu.org https://bordeaux.guix.gnu.org'
```


# podman
sudo apt install uidmap

todo docker socket see systemd service
