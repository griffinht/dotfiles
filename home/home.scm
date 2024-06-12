;; This "home-environment" file can be passed to 'guix home reconfigure' to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;; todo figure this out
;; https://www.gnu.org/software/guile/manual/html_node/Load-Paths.html
;; this adds the current directory to the load paths
;; (add-to-load-path (string-append (dirname "home/home.scm") "/my-channel))
;; (add-to-load-path (string-append "home" "/my-channel))
; equivalent to -L/--load-path=my-channel i think
(add-to-load-path (string-append (dirname (current-filename)) "/my-channel"))
;todo?
;(add-to-load-path (string-append (dirname (current-filename)) "/binaries/scheme-lsp-server"))

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
	     (gnu home services)
             (gnu home services shells)
             (gnu home services pm)
             (gnu home services syncthing)
             ;; my packages in the packages folder
             ;; ./mypackages/test.scm provides (mypackages test)
             ;; this works because i added the current directory of this file (home.scm) to the load path with the add-to-load path
             (packages-bin misc)
             (packages my-hello)
             (packages neovim)
             (packages-built misc))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.

  ;; specification->packages seems to dynamically load things
  ;; so we don't have to have a bunch of different use-modules declarations for each package
  ;; but for my-hello we still do it the regular way
  (packages (append (list mylf
                          ; util
                          mitmproxy
                          theme.sh
                          lazygit gitui
                          android-studio
                          opentofu
                          ;mydocker-compose
                          ncspot
                          buildkit
                          ; lsp
                          vscode-langservers-extracted
                          typescript-language-server
                          bash-language-server
                          marksman
                          ; neovim
                          ; util
                          neovim-auto-save
                          neovim-gitsigns ; todo improve integration! toggle blame and stage hunks
                          ; theme
                          neovim-solarized8
                          ; syntax
                          neovim-treesitter
                          vim-ledger
                          ; lsp
                          neovim-lspconfig
                          ; dap
                          neovim-dap
                          neovim-dap-ui
                          neovim-dap-virtual-text
                          neovim-jdtls
                          vscode-java-test
                          java-debug
                          ; interactive (magic! amazing! incredible!)
                          neovim-conjure
                          neovim-nfnl
                          ; todo slimv, vlime, or vim-slime?????
                          ; autocomplete
                          neovim-cmp
                          ;neovim-cmp-buffer i don't like this one very much
                          neovim-cmp-lsp
                          neovim-cmp-conjure)
                    (specifications->packages (list 
                                                ; todo organize with other neovim packages idk
                                                "vim-slime" "screen" ; secretly requires vim-slime
                                                "rust-analyzer"
                                                "shellcheck"


                                            ;; needed to make things work i think?
                                            ;; also needs GUIX_LOCPATH=/home/griffin/.guix-profile/lib/locale
					    "glibc-locales"
                                            ;; needed for ssl
                                            ;; requires SSL_CERT_DIR SSL_CERT_FILE GIT_SSL_CAINFO or something like that see guix x509 setup
                                            "nss-certs"

                                            ;;
                                            ;; core utils
                                            ;;
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

                                            ;;
					    ;; window manager
                                            ;;

                                            "wdisplays" ;; gui display configurerer
                                            "wev" ;; wayland event viewer
					    ;;;;"sway"
                                            ;; todo idk if this needs to be installed on system host or can be guix home?
                                            ;; for now its just installed on arch host with xorg-xwayland or something
                                            ;"xorg-server-xwayland"
                                            "swayidle"
                                            ;;"swaybg" not needed? make sure this is on the host or else weird bugs! todo arch thing
                                            ;; do not install swaylock to user (setuid needs root) "swaylock" ;; screen locker
                                            "fzf" ;; application launcher menu
					    "grim" "slurp" ;; screenshot and screen selection
					    "mako" ;; notification daemon
					    "wl-clipboard" ;; needed for neovim clipboard to work https://github.com/neovim/neovim/pull/9229
                                            "libnotify" ;; provides notify-send to trigger notifications from cli - eg 'notify-send hello there!'

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
                                            "weechat" "irssi" ;; irc clients todo pick one and configure it

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
                                            "sshfs"
                                            "sshpass"
					    "git"
					    "curl"
                                            "make"
                                            "just" ;; like make but better???
                                            "strace"
                                            "gdb"
                                            "python" "python-pip"
                                            ;; todo don't install java system wide? idk or maybe do idk
                                            ; update to java 21?
                                            "openjdk@17:jdk"
                                            "openjdk@17:doc" ;; doesn't do anything
                                            "openjdk@17:out" ;; doesn't do anything
                                            "zip"
                                            "unzip" ; note this is here twice for organization i guess
                                            "inetutils" ;; telnet
                                            "netcat"
                                            "smartmontools" ;; smartctl
                                            "tree"
                                            "time"
                                            "lsof"
                                            "parallel" ;; gnu parallel
                                            "ansible"
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
					    "pandoc" ;; file converter (like html -> pdf)
					    "texlive" ;; a real chonker with all the latex, just install this to the profile as needed!
                                            
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
                                            "gajim" "gajim-omemo" ;; other xmpp client todo omemo doesn't work

                                            ;; heavyweights
                                            ;; heavyweights
                                            ;; heavyweights

                                            ;; should i leave some of these to be installed locally? as needed?
                                            ;;"obs" ;; recording
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
  ;; note that on debian i had to install glibc-locales or something

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  ;; todo document this??
  ;; https://www.mail-archive.com/help-guix@gnu.org/msg12592.html
  ;; https://guix.gnu.org/manual/en/html_node/G_002dExpressions.html see local-file recursive
  (services
   (list 
     (service home-batsignal-service-type) ; send notification when my battery is getting low
     (simple-service 'dotfiles
		     home-xdg-configuration-files-service-type
		     `(("nvim"
			,(local-file "config/nvim" #:recursive? #t))
		       ("guix/channels.scm"
			,(local-file "config/guix/channels.scm"))
		       ("sway"
			,(local-file "config/sway" #:recursive? #t))
		       ("swaylock"
			,(local-file "config/swaylock" #:recursive? #t))
		       ("lf"
			,(local-file "config/lf" #:recursive? #t))
		       ;; ncspot wants to write to its config directory
		       ("ncspot/config.toml"
			,(local-file "config/ncspot/config.toml"))
		       ("foot"
			,(local-file "config/foot" #:recursive? #t))
		       ("mako"
			,(local-file "config/mako" #:recursive? #t))
		       ("ctpv"
			,(local-file "config/ctpv" #:recursive? #t))
		       ("containers" ; for podman or probably docker
			,(local-file "config/containers" #:recursive? #t))
		       ("zathura"
			,(local-file "config/zathura" #:recursive? #t))
		       ("bat"
			,(local-file "config/bat" #:recursive? #t))
		       ("fish/config.fish"
			,(local-file "config/fish/config.fish" #:recursive? #t))
		       ("fish/conf.d"
			,(local-file "config/fish/conf.d" #:recursive? #t))
		       ("fish/completions"
			,(local-file "config/fish/completions" #:recursive? #t))
		       ("emacs"
			,(local-file "config/emacs" #:recursive? #t))
                       #|
		       ("gtk-3.0"
			,(local-file "config/gtk-x" #:recursive? #t))
		       ("gtk-4.0"
			,(local-file "config/gtk-x" #:recursive? #t))
                       |#
                       ; todo remove and replace with system agnostic init - shepherd :)
		       ("systemd"
			,(local-file "config/systemd" #:recursive? #t))
		       ("vdirsyncer"
			,(local-file "config/vdirsyncer" #:recursive? #t))
		       ("khal"
			,(local-file "config/khal" #:recursive? #t))
		       ("khard"
			,(local-file "config/khard" #:recursive? #t))
		       ("todoman"
			,(local-file "config/todoman" #:recursive? #t))
		       ("aerc"
			,(local-file "config/aerc" #:recursive? #t))
		       ("git"
			,(local-file "config/git" #:recursive? #t))
		       ("lazydocker"
			,(local-file "config/lazydocker" #:recursive? #t))
		       ("VSCodium/product.json"
			,(local-file "config/VSCodium/product.json" #:recursive? #t))
		       ("clangd"
			,(local-file "config/clangd" #:recursive? #t))))
     (service home-files-service-type
              `(
                (".guile",
                 (local-file "guile.scm"))
                (".docker/contexts/meta",
                 (local-file "docker/contexts/meta" #:recursive? #t))
                (".mozilla/firefox/guix-profile/user.js",
                 (local-file "firefox/user.js" #:recursive? #t))
                (".local/bin",
                 (local-file "bin" #:recursive? #t))
                (".local/share/themes",
                 (local-file "share/themes" #:recursive? #t))
                (".local/share/jdtls",
                 (local-file "binaries/jdtls" #:recursive? #t))
                (".local/share/bin",
                 (local-file "binaries/bin" #:recursive? #t))
                ;(".local/share/java-debug",
                ; (local-file "binaries/java-debug" #:recursive? #t))
                ;(".local/share/vscode-langservers-extracted",
                ; (local-file "binaries/vscode-langservers-extracted" #:recursive? #t))
                ;(".local/share/vscode-java-test",
                ; (local-file "binaries/vscode-java-test" #:recursive? #t))
                ;(".local/share/vscode",
                ; (local-file "binaries/vscode/VSCode-linux-x64" #:recursive? #t))
                (".local/share/fonts",
                 (local-file "binaries/fonts" #:recursive? #t))
                ("git/ncsu/.gitconfig",
                 (local-file "ncsu/gitconfig" #:recursive? #t))
                (".ssh/config",
                 (local-file "ssh/config" #:recursive? #t))
                ))
    (service home-bash-service-type ;; provides default bash config
	     (home-bash-configuration
	       (bashrc (list (local-file "bashrc"))))) 
    ; todo security!!!!!
    (service home-syncthing-service-type
             (for-home
               (syncthing-configuration)))
                 ;(arguments '("serve", "--logfile=/home/griffin/bruh")))))
    )))
