{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "griffin";
  home.homeDirectory = "/home/griffin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    /*
                          lazygit gitui
                          ; util
                          mitmproxy
                          theme.sh
                          buildkit
			  neovim todo
		          "vim-slime" "screen" ; secretly requires vim-slime
			  - vscode slime?
                                            "coreutils"
                                            "findutils" ;; xargs
                                            "util-linux" ;; provides col among other things
                                            "man-db" ;; man!
                                            "man-pages" ;; c and kernel manpages
                                            "man-pages-posix" ;; posix man pages
                                            "procps" ;; provides tools like top, and i like the procps top
                                            "nfs-utils" ;; for mounting nfs drives
                                            "iproute2" ;; ip command
                                            "grep" ;; grep!
                                            "gettext-minimal" ;; envsubst
                                            "mawk" ;; awk! note im not using gnu gawk
                                            "sed" ;; sed!

                                                                                        ;; theming
                                            ;"libadwaita" ;; xournalpp crashes otherwise
                                            ;"adwaita-icon-theme" ;; xournalpp crashes otherwise, still gives a bunch of errors but whatever
                                            ;"glib:bin" ;; provides gsettings
                                            ;"gsettings-desktop-schemas" ;; idk lol
                                            ;"glib:bin" "gsettings-desktop-schemas" "dconf" "dconf-editor"
                                            ;; see more here: https://askubuntu.com/questions/1054001/gtk-warnings-during-geany-running

                                            ;;
                                            ;; terminal
                                            ;;

					    "foot" ;; terminal emulator
                                            "fontconfig" ;; from somewhere else??
                                            ;; don't forget nerd fonts! installed manually in Makefile
                                            "font-apple-color-emoji" ;; alternative is google noto
					    "ncurses" ;; makes foot work
                                            ;; editor
                                            "neovim" ;; the best text editor
                                            "vscodium" ;; the text editor which always works :(
                                            ;; "nvim-dap" todo not packaged
                                            ;;"vim-solarized" ;; this is technically for vim, but using a terrible hack it can work with nvim
                                            ;; "jdtls" todo not packaged
                                            "go" "gopls"
                                            "python-lsp-server"
                                            ;; can't really be installed with glibc at the same time kind of idk
                                            ;;"clang" "linux-libre-headers" ;; clang still a little wonky todo
                                            
                                            "vdirsyncer" ;; sync calendar/contacts via caldav/carddav
                                            "khard" "khal" "todoman" ;; calendar/contacts/caldav todo via vdirsyncer ;todo also check out calcurse?
                                            "aerc" ;; email client
                                            "icedove-wayland" ;; email client that actually works
                                            ;"weechat" "irssi" ;; irc clients todo pick one and configure it

                                            ;; shell
                                            "fish" ;; amazing interactive shell
                                            "grc" ;; magical colorizer
                                            "lolcat" ;; cat but colorful
                                            "cowsay" ;; cat but meat-based
                                            "figlet" ;; cat but bannerized
                                            "cbonsai" "sl" "cmatrix" ;; animation
                                            ;; doesn't work with guix home :(
                                            ;;"daikichi" "fortunes-jkirchartz" ;; provides fortune for daikichi
                                            

                                            ;; todo switch to emacs evil :) :) :0
                                            ;; todo emacs solarized emacs lsp guix makes it sooooo easy

                                            ;; file browsing
                                            ;; see my package mylf
                                            ;;"lf" ;; file browser - todo use nnn! seems neat! git integration!
                                            ;; "ctpv" not packaged :( ;; previewer for lf
                                            "file" ;; for file command, needed by lf
                                            "trash-cli" ;; for lf delete
                                            "ffmpeg" ;; used for vid previews
                                            "chafa" ;; image previews (sixels)
                                            "jq" ;; json parser thing used for json previews i think?
                                            "yq" ;; like jq but for yaml!
                                            "ffmpegthumbnailer" ;; video previews
                                            "bat" ;; text file syntax highlighting previews
                                            "lynx" ;; html file previews
                                            "poppler" ;; pdf previews
                                            "ripgrep" ;; used with fzf.sh
                                            "unzip" ;; zip previews
                                            ;; "mdcat" markdown previews todo

                                            ;; file browsing (graphical)
					    "mpv" ;; video player
                                            "imv" ;; image viewer
                                            ; todo use okular?
                                            "zathura" ;; document viewer
                                            "zathura-pdf-mupdf" ;; allows zathura to render pdfs

                                            ;;
					    ;; system controls
                                            ;;
					    "brightnessctl" ;; brightness, might require root setup
					    "playerctl" ;; mpris controller for media players (play/pause)					    
					    "wob" ;; graphical slider display 
                                            "ddcutil" ;; external monitor controls (brightness for example)
                                            "pavucontrol" ;; gui audio control
                                            ;;; seems to work well on debian probably

                                            ;; pipewire/sound
                                            ;;;;"dbus" ;; why not make my own dbus??
                                            ;;;;"bluez" ;; bluetoothctl
                                            ;; todo guix pulse bluetooth https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#module-bluetooth-discover
                                            ;;;;"xdg-desktop-portal" ;; needed for pipewire and things i guess
					    ;;;;"xdg-desktop-portal-wlr" ;; screen sharing https://wiki.archlinux.org/title/PipeWire#xdg-desktop-portal-wlr 
                                            ;;;;"pipewire"
                                            ;;;;"wireplumber"
                                            ;; todo libcamera
                                            ;; todo https://lists.gnu.org/archive/html/guix-commits/2023-08/msg01450.html
                                            ;;"libcamera"
                                            ;;https://www.collabora.com/news-and-blog/blog/2020/09/11/integrating-libcamera-into-pipewire/
                                            ;;pipewire-pulse
					    ;; https://mozilla.github.io/webrtc-landing/gum_test.html
                                            "qpwgraph"

                                            ;;
					    ;; dev utils
                                            ;;
					    "openssh"
                                            "sshpass"
					    "git"
					    "curl"
                                            "make"
                                            "just" ;; like make but better???
                                            "strace"
                                            "gdb"
                                            ;"python" "python-pip"
                                            ;; todo don't install java system wide? idk or maybe do idk
                                            ; update to java 21?
                                            ;"openjdk@17:jdk"
                                            ;"openjdk@17:doc" ;; doesn't do anything
                                            ;"openjdk@17:out" ;; doesn't do anything
                                            "zip"
                                            "unzip" ; note this is here twice for organization i guess
                                            "inetutils" ;; telnet
                                            "netcat"
                                            "smartmontools" ;; smartctl
                                            "tree"
                                            "time"
                                            "lsof"
                                            "parallel" ;; gnu parallel
                                            "asciinema" ; epic terminal recorder
                                            ;"ansible"
                                            ;"java-swt" so broken lmao
                                            ;;"openjdk@11:jdk"
                                            ;;
                                            ;; guile
                                            ;;
                                            ;; note this requires GUILE_LOAD_PATH to be set or .guile to be modified
                                            ;; it works both ways!
                                            "guile"
                                            "guile-colorized"
                                            "guile-readline"
                                            ;;
                                            ;; docker
                                            ;;
                                            "podman" ;; todo slirp4netns does not work (or does it??), current workaround is --network=none or --network=host
                                            "skopeo"
                                            ;"docker-cli" ;; docker cli for remote daemons so far
                                            ;"docker" ;; todo start rootless daemon
                                            ;;
                                            ;; virtualization
                                            ;;
                                            "qemu"
                                            "libvirt" ; for virsh command and stuff
                                            "virt-manager" ; awesome qemu/libvirt gui frontend!
                                            ;;
                                            ;; other utils
                                            ;;
                                            "inotify-tools"
                                            "entr" ;; friendly inotify!
                                            "iperf" ;; iperf3 -c hot.griffinht.com - speedtest
                                            "wireguard-tools" ;; wg-quick
                                            "bind:utils" ;; dig
                                            "whois" ;; whois domain registrar lookups
                                            "arp-scan" ;; sudo arp-scan --localnet
                                            "units" ;; unit conversions! it kind of sucks but idk
                                            "pinfo" ;; good? info reader - seems like they all suck except for emacs users
                                            "zbar" ;; zbarimg - barcode reader
                                            "qrencode" ;; qr code encoder
                                            "oath-toolkit" ;; totp generator
                                            "graphviz" ;; dot

					    ;; cool utils
                                            "ncdu" ;; disk usage
                                            "powertop" ;; power usage
                                            "btop" ;; cool system monitor, also see glances nmon
					    ;; other
					    ;"pandoc" ;; file converter (like html -> pdf)
					    ;"texlive" ;; a real chonker with all the latex, just install this to the profile as needed!
                                            
                                            "flatpak" ; it always works!
                                            ; todo set xdg application dir

                                            ;;
                                            ;; graphical software
                                            ;;

                                            "firefox" ;; web browser
                                            ;; overrides firefox in xdg-open which is annoying and idk how to configure xdg-open yet
                                            ;;"ungoogled-chromium-wayland" ;; backup web browser when firefox doesn't work on cringe websites :(
                                            ;;"ublock-origin-chromium" ;; guix will install extensions for me? cool!

                                            ;"hledger" ;; plain text accounting software
                                            "dino" ;; xmpp client - works with snikket! :) :) :) thanks devs! <3
                                            ;"gajim" "gajim-omemo" ;; other xmpp client todo omemo doesn't work

                                            ;; heavyweights
                                            ;; heavyweights
                                            ;; heavyweights

                                            ;; should i leave some of these to be installed locally? as needed?
                                            ;"obs" ;; recording
                                            "audacity" ;; audacity
					    "xournalpp" ;; drawing gui
					    "libreoffice" "hunspell-dict-en" ;; office todo spellcheck doesnt work :(
                                            ;"ncspot" ;; todo package this for real
                                            ;; these packages are required as part of a stupid hack to get ncspot to work without compiling it or installing system deps
                                            ;; basically launch ncspot with LD_LIBRARY_PATH=$HOME/.guix-home/profile/lib ncspot
                                            ;; todo remove
                                            ;; causes issue when pipewire-pulse is not started and pavucontrol sees pulseaudio and decides to start it itself!
                                            ;;;;"pulseaudio"
                                            "openssl@1.1.1q"
                                            "libxcb"

                                            ;; qt
                                            ;; instead i have to guix shell qtwayland@y
                                            ;;"qtwayland@5" ;; qt applications, seems to need 5?
                                            ;;"kdenlive" ;; qt video editor
                                            ;;qt apps dont work with guix home
					    ))))
 
    */

    # dev utils
    pkgs.gnumake
    pkgs.sshfs
    pkgs.jq
    pkgs.yq
    pkgs.jsonnet
    # todo pick one json viewer
    pkgs.fx
    pkgs.jless

    # dev programs
    pkgs.opentofu

    # shell
    pkgs.lf
    pkgs.git
    pkgs.fzf
    pkgs.fish
    pkgs.trash-cli

    # shell apps
    pkgs.btop
    pkgs.docker
    pkgs.aichat
    pkgs.neovim
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.vimPlugins.auto-save-nvim
    #pkgs.ncspot

    # apps
    pkgs.vscode
    pkgs.obs-studio
    pkgs.mailspring
    pkgs.thunderbird
    pkgs.obsidian

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/griffin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
