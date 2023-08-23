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
