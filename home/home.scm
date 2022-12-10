;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
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
  (packages (specifications->packages (list ;;"icecat"
					    ;; sway
					    "sway"
					    "foot" ;; wayland terminal emulator
					    "ncurses" ;; makes foot work
                                            "fzf" ;; fuzzy search for menu
					    ;; dev utils
					    "openssh"
					    "git"
					    "curl"
					    ;; cool utils
					    "lf"
					    "mpv"
					    "neovim"
                                            "ncdu" ;; disk usage
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
		       ("git/config"
			,(local-file "config/git/config"))))
    (service home-bash-service-type) ;; provides default bash config
    )))
