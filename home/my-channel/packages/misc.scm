(define-module (packages misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix build-system copy)
               #:use-module (guix licenses)
               #:use-module (guix gexp))

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
