;; This "home-environment" file can be passed to 'guix home reconfigure' to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
	     (gnu home services))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list 
					    "glibc-locales"
					    ;; window manager
					    "sway"
					    "foot" ;; terminal emulator
					    "ncurses" ;; makes foot work
                                            "fzf" ;; fuzzy search for application launcher menu
					    "grim" "slurp" ;; screenshot and screen selection

					    ;; system controls
					    "brightnessctl" ;; brightness, might require root setup
					    "playerctl" ;; mpris controller for media players (play/pause)					    
					    "wob" ;; graphical slider display 
					    "pulseaudio" ;; required for pactl version with get-sink-volume for, and for sound in general

					    ;;todo nvim tabs -> spaces
					    ;; todo doesnt work
					    ;;"xdg-desktop-portal-wlr" ;; screen sharing https://wiki.archlinux.org/title/PipeWire#xdg-desktop-portal-wlr 
					    ;; https://mozilla.github.io/webrtc-landing/gum_test.html
					    ;; https://wiki.archlinux.org/title/PulseAudio#Keyboard_volume_control
					    ;; https://github.com/misterdanb/avizo
					    ;; https://libreddit.griffinht.com/r/swaywm/comments/oms1jf/help_with_volume_up_and_down_keys/
					    ;; pavucontrol
					    ;; dev utils
					    "openssh"
					    "git"
					    "curl"
                                            ;; file browsing
                                            "lf" ;; terminal file browser
					    "mpv" ;; video player
                                            "imv" ;; image viewer
                                            "zathura" ;; document viewer
                                            "zathura-pdf-mupdf" ;; allows zathura to render pdfs
					    ;; neovim
					    "neovim"
					    "wl-clipboard" ;; needed for neovim clipboard to work https://github.com/neovim/neovim/pull/9229
					    ;; cool utils
                                            "ncdu" ;; disk usage
					    ;; other
					    "xournalpp" ;; drawing gui
					    "firefox-wayland" ;; web browser
					    ;;"pandoc" ;; file converter (like html -> pdf)
					    ;;"texlive" ;; a real chonker with all the latex
					    )))
  ;; note that on debian i had to install glibc-locales or something

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list 
     (simple-service 'dotfiles
		     home-xdg-configuration-files-service-type
		     `(("nvim/init.vim"
			,(local-file "config/nvim/init.vim"))
		       ("sway/config"
			,(local-file "config/sway/config"))
		       ("sway/wacom"
			,(local-file "config/sway/wacom"))
		       ("sway/screenshot"
			,(local-file "config/sway/screenshot"))
		       ("sway/brightness"
			,(local-file "config/sway/brightness"))
		       ("sway/wob"
			,(local-file "config/sway/wob"))
		       ("sway/volume"
			,(local-file "config/sway/volume"))
		       ("sway/playerctl"
			,(local-file "config/sway/playerctl"))
		       ("sway/workspaces"
			,(local-file "config/sway/workspaces"))
		       ("sway/toggle.sh"
			,(local-file "config/sway/toggle.sh"))
		       ("lf/lfrc"
			,(local-file "config/lf/lfrc"))
		       ("ncspot/config.toml"
			,(local-file "config/ncspot/config.toml"))
		       ("foot/foot.ini"
			,(local-file "config/foot/foot.ini"))
		       ("git/config"
			,(local-file "config/git/config"))))
    (service home-bash-service-type ;; provides default bash config
	     (home-bash-configuration
	       (bashrc (list (local-file
			       ".bashrc"
			       "bashrc"))))) 
    )))
