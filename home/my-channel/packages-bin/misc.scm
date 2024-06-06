(define-module (packages-bin misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system copy)
               #:use-module (guix build-system gnu)
               #:use-module (guix build-system cmake)
               #:use-module (guix licenses)
               #:use-module (guix gexp)
               #:use-module (gnu packages version-control)
               #:use-module (gnu packages ncurses)
               #:use-module (gnu packages tls)
               #:use-module (gnu packages kde-frameworks)
               #:use-module (gnu packages commencement)
               #:use-module (gnu packages compression)
               #:use-module (gnu packages glib)
               #:use-module (gnu packages cpp)
               #:use-module (gnu packages java)
               #:use-module (gnu packages ninja)
               #:use-module (gnu packages xdisorg)
               #:use-module (gnu packages markup)
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages qt)
               #:use-module (gnu packages vulkan)
               #:use-module (gnu packages base)
               #:use-module (gnu packages gawk)
               #:use-module (gnu packages terminals)
               #:use-module (gnu packages compression)
               #:use-module (gnu packages bash)
               #:use-module (gnu packages llvm))

; todo use modified guix lf package with --from-source or whatever
; todo actually looks like its been merged in
(define-public mylf
               (package
  (name "mylf")
  (version "2.10")
  ;; todo use origin instead
  (source (origin
            (uri "https://github.com/horriblename/lf/releases/download/r28-1/lf-linux-amd64.tar.gz")
            ;; todo where is url-fetch documented
            ;; and why are all the errors so incredibly unreadable
            ;; i feel like this is punishment for not using emacs "the perfect setup" todo
            (method url-fetch)
            (sha256 "1vwamgjv7zsr2i1y0j7vbn5j2shb64zh3nq5amxk2rv60dwh2rmy")
            ))
  (build-system copy-build-system)
  (arguments
;;| tar -xz -C bin/local
;; todo why does list not work here instead fo '
    '(#:install-plan '(("lf" "bin/"))))
  (synopsis "Hello, Guix world: An example custom Guix package")
  (description
   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
  (home-page "https://www.gnu.org/software/hello/")
  ;; todo this doesnt have a license i just copied this field from the example
  (license gpl3+)))
;;https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 

(define-public mydocker-compose
               (package
  (name "mydocker-compose")
  (version "2.27.1")
  ;; todo use origin instead
  (source (origin


;;/gnu/store/nx7ih0mqg7hlppw194xzrvsgq5d1x29h-docker-compose-linux-x86_64
;;1nidh0ai9ljjq8gsa7zky4hlyzrjjn9yz63bkyp3wm1i4a0j0pl9
            (uri (string-append "https://github.com/docker/compose/releases/download/v" version "/docker-compose-linux-x86_64"))
            ; this has zero documentation anywhere... thanks chatgpt and ripgrep on guix source code!
            ; basically makes the downloaded file executable
            (method url-fetch/executable)
            (sha256 "19ykdfl3ihjkfm95sh8l036lbb9lq3bqlqmm2irwn442ksarjwhw")
            ))
  (build-system copy-build-system)
  (arguments
;; todo i guess . works?
;; also need to make sure chmod
;; Docker Compose for all users on your system, replace ~/.docker/cli-plugins with /usr/local/lib/docker/cli-plugins.
;; i think this belonds in libexec and not lib? because its executable?
;; todo this needs to chmod executable
;; https://github.com/docker/compose
    '(#:install-plan '(("docker-compose-linux-x86_64" "libexec/docker/cli-plugins/docker-compose"))))
  (synopsis "Hello, Guix world: An example custom Guix package")
  (description
   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
  (home-page "https://www.gnu.org/software/hello/")
  ;; todo this doesnt have a license i just copied this field from the example
  (license gpl3+)))

#|(define-public myrescrobbled
               (package
  (name "myrescrobbled")
  (version "2.10")
  ;; todo use origin instead
  (source (origin
            (uri "https://github.com/InputUsername/rescrobbled/releases/download/v0.7.0/rescrobbled")
            (method url-fetch)
            (sha256 "003wmxp1va17f10gwvprdjyslkazmihf0p9z0dpf16vmpg7laahi")
            ))
  (build-system copy-build-system)
  (propogated-inputs 
    (list dbus
          `(,openssl "static")
          gcc-toolchain
          ))
  (arguments
    '(#:install-plan '(("rescrobbled" "bin/"))))
  (synopsis "Hello, Guix world: An example custom Guix package")
  (description
   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
  (home-page "https://www.gnu.org/software/hello/")
  ;; todo this doesnt have a license i just copied this field from the example
  (license gpl3+)))|#
(define-public mitmproxy
               (package
                 (name "mitmproxy")
                 (version "10.20.0")
                 (source (origin
                           (uri "https://downloads.mitmproxy.org/10.2.0/mitmproxy-10.2.0-linux-x86_64.tar.gz")
                           (method url-fetch)
                           (sha256 "04vr51wna946ljydmsm0qhj3ss0rifb18lqmpd38p86y60pbmh4m")))
                 (build-system copy-build-system)
                 (arguments
                   '(#:install-plan '(("." "bin/")) ; todo this includes environment-variables which we dont want
                     #:phases (modify-phases %standard-phases
                                             (delete 'validate-runpath))))
                 ;(propagated-inputs (list glib zlib))
                 (synopsis "An interactive TLS-capable intercepting HTTP proxy for penetration testers and software developers.")
                 (description "mitmproxy is an interactive, SSL/TLS-capable intercepting proxy with a console interface for HTTP/1, HTTP/2, and WebSockets. mitmdump is the command-line version of mitmproxy. Think tcpdump for HTTP. mitmweb is a web-based interface for mitmproxy.")
                 (home-page "https://mitmproxy.org/")
                 (license expat)))

(define-public theme.sh
               (package
                 (name "theme.sh")
                 (version "1.1.5")
                 (source (origin
                           (method git-fetch)
                           (uri
                             (git-reference
                               (url "https://github.com/lemnos/theme.sh.git")
                               (commit (string-append "v" version))))
                           (sha256 "0wnnwl30bacmdc8hkygknj4ksgn52hmfy3988k3qyfvkc1c3qg6c")))
                            ;(file-name (git-file-name name version)) what is this
                 (build-system copy-build-system)
                 (arguments
                   '(#:install-plan '(("bin" "bin"))))
                 (propagated-inputs (list coreutils gawk fzf bash)) ; --interactive requires fzf and sh
                 (synopsis "A script which lets you set your $terminal theme")
                 (description "One theme script to rule them all.")
                 (home-page "https://github.com/lemnos/theme.sh")
                 (license expat)))

(define-public ctpv
               (package
                 (name "ctpv")
                 (version "1.1")
                 (source (origin
                           (method git-fetch)
                           (uri
                             (git-reference
                               (url "https://github.com/NikitaIvanovV/ctpv")
                               (commit (string-append "v" version))))
                           (sha256 "1zj0jcsk9zqnrifvrh6rn12hmmkp78l38ichj27ik11qdvi2456w")))
                            ;(file-name (git-file-name name version)) what is this
                 (build-system gnu-build-system)
                 (arguments
                   '(#:phases (modify-phases %standard-phases
                                             (delete 'configure)
                                             (delete 'check))
                     #:make-flags (list
                                    "CC=gcc" ; uses cc by default, i wonder if this breaks clang-toolchain
                                    "DESTDIR=/usr/$out"
                                    "PREFIX=./")))
                 (inputs (list openssl))
                 ;(propagated-inputs (list coreutils gawk fzf bash)) ; --interactive requires fzf and sh
                 (synopsis "Image previews for lf file manager")
                 (description "ctpv is a file previewer utility for a terminal. 
                              It was made with integration into lf file manager in mind, but I believe that it can be easily integrated into other programs as well.
                              It supports previews for source code, archives, PDF files, images, videos, etc. See Previews for more info.")
                 (home-page "https://github.com/NikitaIvanovV/ctpv")
                 (license expat)))

(define-public
  lazygit
  (package
    (name "lazygit")
    (version "0.40.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/jesseduffield/lazygit/releases/download/v" version "/lazygit_" version "_Linux_x86_64.tar.gz"))
        (sha256 "1wbzvcl3ifqb3sl7ywjqk96l40629cwwvrbm14icx187pn7cn1gz")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("lazygit" "bin/"))))
    (propagated-inputs
      (list git ncurses))
    (synopsis "simple terminal UI for git commands")
    (description "")
    (home-page "https://github.com/jesseduffield/lazygit")
    (license expat)))

(define-public
  gitui
  (package
    (name "gitui")
    (version "0.24.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/extrawurst/gitui/releases/download/v" version "/gitui-linux-musl.tar.gz"))
        (sha256 "1b91r2cd67q9j65lx3cw3d72jz7cb5sk069a6n2pfy1bskfzr53f")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("gitui" "bin/"))))
    (synopsis "Blazing 💥 fast terminal-ui for git written in rust 🦀")
    (description "")
    (home-page "https://github.com/extrawurst/gitui")
    (license expat)))

(define-public
  android-studio
  (package
    (name "android-studio")
    (version "2023.1.1.28")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/" version "/android-studio-" version "-linux.tar.gz"))
        (sha256 "1y98l76aragiw0ng1m598hh52d0ssfv0jp7mzdl3nd8996xhv78k")))
    (build-system copy-build-system)
    (arguments
      '(#:phases
        (modify-phases
          %standard-phases
          (delete 'validate-runpath))))
    (synopsis "")
    (description "")
    (home-page "https://developer.android.com/studio")
    (license asl2.0)))

(define-public
  opentofu
  (package
    (name "opentofu")
    (version "1.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/opentofu/opentofu/releases/download/v" version "/tofu_" version "_linux_amd64.zip"))
        (sha256 "00vlsgy22pvzz9wv579yn5y58xgdz7xhxch5wqq7wvgbkdqqiz9g")))
    (build-system copy-build-system)
    (inputs
      (list unzip))
    (arguments
      '(#:install-plan '(("tofu" "bin/"))))
    (synopsis "")
    (description "")
    (home-page "https://opentofu.org/")
    (license mpl2.0)))

(define-public
  aichat
  (package
    (name "aichat")
    (version "0.17.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/sigoden/aichat/releases/download/v" version "/aichat-v" version "-x86_64-unknown-linux-musl.tar.gz"))
        (sha256 "07k30xb333124ip6rfqsixyw4ssf0sb5vyik4nc5w455591jz2hm")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("aichat" "bin/"))))
    (synopsis "")
    (description "")
    (home-page #f)
    (license #f)))

; todo package non appimage qt6 - see nix!
(define-public
  prismlauncher
  (package
    (name "prismlauncher")
    (version "8.2")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/PrismLauncher/PrismLauncher")
            (commit version)))
        (sha256 "1qf18f8w1am4pph4vyj17vp6666vw06bzvvhnb24gz72kk2jhnz1")))
    (build-system cmake-build-system)
    (native-inputs
      (list
        extra-cmake-modules openjdk17 openjdk11 javacc ninja pkgconf vulkan-headers))
    (inputs
      (list
        qtbase
        qt5compat
        qtwayland
        libxkbcommon
        quazip
        gulrak-filesystem
        cmark
        ; tomlplusplus
        zlib))
    (synopsis "")
    (description "")
    (home-page "https://github.com/PrismLauncher/PrismLauncher/")
    (license gpl3+)))

(define-public
  marksman
  (package
    (name "marksman")
    (version "2023-12-09")
    (source
      (origin
        (method url-fetch/executable)
        (uri (string-append "https://github.com/artempyanykh/marksman/releases/download/" version "/marksman-linux-x64"))
        (sha256 "0cc6hp4p299sclziwb1n9sncvl5rcbm7zlpj5xdgnbsh4knfn669")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("marksman-linux-x64" "share/marksman")) ; if i copy to bin then guix mangles the executable for some reason
        #:phases (modify-phases %standard-phases
                                (delete 'validate-runpath))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))

(define-public
  ncspot
  (package
    (name "ncspot")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/hrkfdn/ncspot/releases/download/v" version "/ncspot-v" version "-linux-x86_64.tar.gz"))
        (sha256 "0m8ihcd49gk0jvfpgzgri67in6j8zkznavgrs0h03v0zvv8zimqh")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("ncspot" "bin/"))
        #:phases (modify-phases %standard-phases
                                (delete 'validate-runpath))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))

(define-public
  buildkit
  (package
    (name "buildkit")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/moby/buildkit/releases/download/v" version "/buildkit-v" version ".linux-amd64.tar.gz"))
        (sha256 "1v37y62clzqi0a6azmnxh84lrhjics07wz6i485pl7c573s6wjjx")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("." "bin/"))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))


#|
; hledger has a zip which gives us a tarball which we have to extract
; too much work lol!
(define-public
  hledger
  (package
    (name "hledger")
    (version "1.33")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/simonmichael/hledger/releases/download/" version "/hledger-linux-x64.zip"))
        (sha256 "16031ixn1qf8n993m3wa0q4yy8ymcld4w5bvc0wan7gyqhdl1bqp")))
    (build-system copy-build-system)
    (native-inputs
      (list unzip))
    (arguments
      '(#:install-plan '(("ncspot" "bin/"))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))
|#

#|
; requires executable to launch bin
(define-public
  lua-lanugage-server
  (package
    (name "lua-language-server")
    (version "3.7.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/LuaLS/lua-language-server/releases/download/" version "/lua-language-server-" version "-linux-x64.tar.gz"))
        (sha256 "19cnyn1p20pnhgfvhlsnc8qsr5l1zrrwmm252ajszfcl7gxapap8")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("bruh" "bruh"))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))
|#

#|
eclipse download website is annoying :(
(define-public
  jdtls
  (package
    (name "jdtls")
    (version "1.34.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/" version "/jdt-language-server-" version "-202404031240.tar.gz"))
        (sha256 "0nbdk322haw52hv9m2np9aw0zf8045m8al18n9h0il64p6ibsn1d")))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("aichat" "bin/"))))
    (synopsis #f)
    (description #f)
    (home-page #f)
    (license #f)))
|#
