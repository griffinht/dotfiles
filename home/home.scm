;; This "home-environment" file can be passed to 'guix home reconfigure' to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;; todo figure this out
;; https://www.gnu.org/software/guile/manual/html_node/Load-Paths.html
;; this adds the current directory to the load paths
;; (add-to-load-path (string-append (dirname "home/home.scm") "/my-channel))
;; (add-to-load-path (string-append "home" "/my-channel))
(add-to-load-path (string-append (dirname (current-filename)) "/my-channel"))

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
	     (gnu home services)
             ;; my packages in the packages folder
             ;; ./mypackages/test.scm provides (mypackages test)
             ;; this works because i added the current directory of this file (home.scm) to the load path with the add-to-load path
             (packages misc)
             (packages my-hello))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.

  ;; specification->packages seems to dynamically load things
  ;; so we don't have to have a bunch of different use-modules declarations for each package
  ;; but for my-hello we still do it the regular way
  (packages (append (list mylf) (specifications->packages (list 
                                            ;; needed to make things work i think?
					    "glibc-locales"

                                            ;;
					    ;; window manager
                                            ;;

					    "sway"
                                            "swayidle"
                                            ;;"swaybg" not needed? make sure this is on the host or else weird bugs! todo arch thing
                                            ;; do not install swaylock to user (setuid needs root) "swaylock" ;; screen locker
                                            "fzf" ;; application launcher menu
					    "grim" "slurp" ;; screenshot and screen selection
					    "mako" ;; notification daemon
					    "wl-clipboard" ;; needed for neovim clipboard to work https://github.com/neovim/neovim/pull/9229

                                            ;;
                                            ;; terminal
                                            ;;

					    "foot" ;; terminal emulator
					    "ncurses" ;; makes foot work
                                            "fish" ;; shell
                                            "neovim" ;; editor
                                            ;; todo switch to emacs evil :) :) :0

                                            ;; file browsing
                                            ;; see my package mylf
                                            ;;"lf" ;; file browser
                                            ;; "ctpv" not packaged :( ;; previewer for lf
                                            "trash-cli" ;; for lf delete
                                            "ffmpeg" ;; used for vid previews
                                            "chafa" ;; image previews (sixels)
                                            "jq" ;; json parser thing used for json previews i think?
                                            "ffmpegthumbnailer" ;; video previews
                                            "bat" ;; text file syntax highlighting previews
                                            "lynx" ;; html file previews
                                            "poppler" ;; pdf previews
                                            "ripgrep" ;; used with fzf.sh
                                            ;; "mdcat" markdown previews todo

                                            ;; file browsing (graphical)
					    "mpv" ;; video player
                                            "imv" ;; image viewer
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

					    ;;"pulseaudio" ;; no more pulse!

                                            ;; pipewire/sound
                                            ;; todo guix pulse bluetooth https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#module-bluetooth-discover
                                            ;; todo figure out how to make a guix package!
                                            ;;"xdg-desktop-portal" ;; needed for pipewire and things i guess
					    ;;"xdg-desktop-portal-wlr" ;; screen sharing https://wiki.archlinux.org/title/PipeWire#xdg-desktop-portal-wlr 
                                            ;;"pipewire"
                                            ;;"wireplumber"
                                            ;; todo libcamera
                                            ;;https://www.collabora.com/news-and-blog/blog/2020/09/11/integrating-libcamera-into-pipewire/
                                            ;;"pipewire-pulse"
					    ;; https://mozilla.github.io/webrtc-landing/gum_test.html

                                            ;;
					    ;; dev utils
                                            ;;
					    "openssh"
					    "git"
					    "curl"
                                            "make"
                                            "python"
                                            ;; guile
                                            ;; note this requires GUILE_LOAD_PATH to be set or .guile to be modified
                                            ;; it works both ways!
                                            "guile"
                                            "guile-colorized"
                                            "guile-readline"
                                            ;; other utils
                                            "sshpass"
                                            "wireguard-tools" ;; wg-quick
                                            "bind:utils" ;; dig
                                            "whois"
                                            "units" ;; unit conversions! it kind of sucks but idk
                                            "pinfo" ;; good info reader
                                            "zbar" ;; provides zbarimg which is a barcode reader

					    ;; cool utils
                                            "ncdu" ;; disk usage
                                            "powertop" ;; power usage
                                            "btop" ;; cool system monitor, also see glances nmon
					    ;; other
					    "pandoc" ;; file converter (like html -> pdf)
					    ;;"texlive" ;; a real chonker with all the latex, just install this to the profile as needed!
                                            

                                            ;;
                                            ;; other software
                                            ;;

					    "firefox-wayland" ;; web browser

                                            "hledger" ;; plain text accounting software

                                            ;; heavyweights
                                            ;; heavyweights
                                            ;; heavyweights

                                            ;; should i leave some of these to be installed locally? as needed?
                                            "obs" ;; recording
                                            "audacity" ;; audacity
					    "xournalpp" ;; drawing gui
					    "libreoffice" ;; office
                                            ;; qt
                                            ;; instead i have to guix shell qtwayland@y
                                            ;;"qtwayland@5" ;; qt applications, seems to need 5?
                                            ;;"kdenlive" ;; qt video editor
                                            ;;qt apps dont work with guix home

                                            ;; development?
                                            ;; development?
                                            ;; development?

                                            ;;"openjdk:jdk" ;; jdk
                                            "podman" ;; todo slirp4netns does not work, current workaround is --network=none or --network=host
                                            "docker-cli" ;; docker cli for remote daemons so far
                                            ;;"docker" ;; todo start rootless daemon
					    ))))
  ;; note that on debian i had to install glibc-locales or something

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  ;; todo document this??
  ;; https://www.mail-archive.com/help-guix@gnu.org/msg12592.html
  ;; https://guix.gnu.org/manual/en/html_node/G_002dExpressions.html see local-file recursive
  (services
   (list 
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
		       ("fish"
			,(local-file "config/fish" #:recursive? #t))
		       ("emacs"
			,(local-file "config/emacs" #:recursive? #t))
                       ; todo remove and replace with system agnostic init
		       ("systemd"
			,(local-file "config/systemd" #:recursive? #t))
		       ("git"
			,(local-file "config/git" #:recursive? #t))))
     (service home-files-service-type
              `(
                ;; todo i hate how clunk this is but it seems to work
                ;; also its bad to install arkenfox in source code but it does beat manual installation?
                ;; todo this is probably the wrong way to do this
                (".mozilla/firefox/myprofile/user.js",
                 (local-file "firefox/user.js" #:recursive? #t))
                (".guile",
                 (local-file "guile"))
                (".docker/contexts/meta",
                 (local-file "docker/contexts/meta" #:recursive? #t))
                (".docker/cli-plugins/docker-compose",
                 (local-file "bin/docker-compose" #:recursive? #t))
                ))
    (service home-bash-service-type ;; provides default bash config
	     (home-bash-configuration
	       (bashrc (list (local-file "bashrc"))))) 
    )))
