;; This is an operating system configuration template
;; for a "bare bones" setup, with no X11 display server.

(use-modules (gnu)
	     (srfi srfi-1)) ;;srfi is list processing, we use it for remove gdm
;;	     (gnu services desktop)) ;;
(use-service-modules networking 
		     desktop 
		     xorg) ;;defines gdm-service-type so we can remove it
(use-package-modules certs ;; for nss-certs so we have ssl certs for https
		     wm) ;; sway

(operating-system
  (host-name "cool_desktop_guix")
  (timezone "America/New_York")
  (locale "en_US.utf8")

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (target "/boot/efi")))

  (file-systems (append
                 (list (file-system
                         (device (file-system-label "my-root"))
                         (mount-point "/")
                         (type "ext4"))
                       (file-system
                         (device (uuid "B01A-3DF4" 'fat))
                         (mount-point "/boot/efi")
                         (type "vfat")))
                 %base-file-systems))

  ;; This is where user accounts are specified.  The "root"
  ;; account is implicit, and is initially created with the
  ;; empty password.
  (users (cons (user-account
                (name "griffin")
                (group "users")

                ;; Adding the account to the "wheel" group
                ;; makes it a sudoer.  Adding it to "audio"
                ;; and "video" allows the user to play sound
                ;; and access the webcam.
                (supplementary-groups '("wheel"
                                        "audio" "video")))
               %base-user-accounts))

  ;; Globally-installed packages.
  (packages (append (list nss-certs ;; so we have ssl certs for https
			  sway)
		    %base-packages))

;;  (services (append (list (service dhcp-client-service-type))
;;		    %base-services)))
  (services (remove (lambda (service) ;; remove usees srfi srfi-1
		     (eq? (service-kind service) gdm-service-type)) %desktop-services)))
