(define-module (packages misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix build-system copy)
               #:use-module (guix licenses)
               #:use-module (guix gexp)
               #:use-module (gnu packages tls)
               #:use-module (gnu packages commencement)
               #:use-module (gnu packages compression)
               #:use-module (gnu packages glib))

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
  (version "2.10")
  ;; todo use origin instead
  (source (origin


;;/gnu/store/nx7ih0mqg7hlppw194xzrvsgq5d1x29h-docker-compose-linux-x86_64
;;1nidh0ai9ljjq8gsa7zky4hlyzrjjn9yz63bkyp3wm1i4a0j0pl9
            (uri "https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64")
            (method url-fetch)
            (sha256 "1nidh0ai9ljjq8gsa7zky4hlyzrjjn9yz63bkyp3wm1i4a0j0pl9")
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
