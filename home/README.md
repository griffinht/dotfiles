npm packages!
https://github.com/minikN/dots/tree/main

https://discourse.nixos.org/t/oci-images-is-there-something-similar-to-distroless-images-built-with-nix/35957/2



# INSTALLATION
#~/git
git clone https://github.com/Pocco81/auto-save.nvim
git clone https://github.com/lassekongo83/adw-gtk3
git clone https://github.com/ledger/vim-ledger

#~/git/guix/home (this directory)
make

# THEME

NEXT STEPS
try migratint to guix xdg-desktop-portal
https://wiki.archlinux.org/title/XDG_Desktop_Portal

## gtk
https://wiki.archlinux.org/title/Dark_mode_switching
https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
https://wiki.archlinux.org/title/GTK#Themes
#https://wiki.archlinux.org/title/Firefox#Dark_themes
    https://github.com/lassekongo83/adw-gtk3?tab=readme-ov-file
        https://github.com/lassekongo83/adw-colors
    https://github.com/catppuccin/gtk?tab=readme-ov-file
    https://github.com/TheGreatMcPain/gruvbox-material-gtk
    gsettings monitor org.gnome.desktop.interface
    dconf watch /
    dbus-monitor
    guix shell glib:bin dconf dconf-editor
    dconf-editor

https://www.josherv.in/2018/06/22/unix/

SOLARIZED DARK
it was foots default suddenly so i started using

gtk TODO PACKAGE
inspiration: https://github.com/Ferdi265/numix-solarized-gtk-theme
https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
https://github.com/lassekongo83/adw-gtk3
currently half broken, needs GTK_THEME=adw-gtk3-dark to be set :(

bat config

sway theme.config

foot default solarized

nvim TODO PACKAGE
currently used hacked together hardcoded guix vim-solarized

# theme todo
aerc
sway

# WORKFLOW
starting stuff
mod+d gui launcher
mod+shift+d terminal launcher (for btop, ncspot...)

in the terminal
ctrl+shift+n - open new terminal in current working directory

in the file browser
standard vim stuff
    hjkl 5j
    gg G
    f
F fuzzy file name search (fzf)
<c-f> exact file content search (rg)


ctpv client/server bruh!
maybe foot?
maybe lf?



https://libreddit.hot.griffinht.com/r/swaywm/comments/gfex9o/how_to_setup_ssh_agent/

make color scheme easily configurable!




DX
rocky remake

