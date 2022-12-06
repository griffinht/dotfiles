;; This is an operating system configuration template
;; for a "bare bones" setup, with no X11 display server.

(use-modules (gnu)
	     (gnu services)
	     (guix transformations);; for transform
	     (nongnu packages nvidia);; proprietary nvidia drivers
	     (nongnu packages linux)
	     (nongnu system linux-initrd)
	     (srfi srfi-1)) ;;srfi is list processing, we use it for remove gdm
;;	     (gnu services desktop)) ;;
(use-service-modules networking 
		     desktop 
		     linux ;;kernel-module-loader-service-type
		     xorg) ;;defines gdm-service-type so we can remove it
(use-package-modules certs ;; for nss-certs so we have ssl certs for https
		     linux
		     wm) ;; sway

(define transform
  (options->transformation
    '((with-graft . "mesa=nvda"))))

(operating-system
  (host-name "cool_desktop_guix")
  (timezone "America/New_York")
  (locale "en_US.utf8")

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (target "/boot/efi")
		(menu-entries (list (menu-entry
				      (label "arch btw")
				      (linux "/boot/arch/vmlinuz-linux")
				      (linux-arguments '("root=/dev/nvme0n1p7"))
				      (initrd "/boot/arch/initramfs-linux.img"))))))

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

                (supplementary-groups '("wheel";; sudo
                                        "audio";; play sound
					"video")));; access webcam
               %base-user-accounts))

 (kernel-arguments (append
		      '("modprobe.blacklist=nouveau");; make sure we don't load nouvuea which would conflict with nvidia's proprietary drivers
	      %default-kernel-arguments))
;; (kernel linux)
 (kernel linux-lts)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (kernel-loadable-modules (list nvidia-driver))

  ;; Globally-installed packages.
  (packages (append (list nss-certs ;; so we have ssl certs for https
			  nvidia-driver
			  sway)
		    %base-packages))

;;  (services (append (list (service dhcp-client-service-type))
;;		    %base-services)))
  (services (remove (lambda (service) ;; remove usees srfi srfi-1
		     (eq? (service-kind service) gdm-service-type))
		    (cons* (simple-service
			     'custom-udev-rules udev-service-type
			     (list nvidia-driver))
			   (service kernel-module-loader-service-type '("nvidia_uvm"
									"nvidia"
									"nvidia_modeset"
									"ipmi_devintf"))
			   (modify-services %desktop-services
					    (guix-service-type config =>
					      (guix-configuration
						    (inherit config)
						    (substitute-urls
						      (append (list "https://substitutes.nonguix.org")
							      %default-substitute-urls))
						    (authorized-keys
						      (append (list (local-file "./nonguix-signing-key.pub"))
							      %default-authorized-guix-keys))))
			   )))))
