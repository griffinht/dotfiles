(define-module (packages inline-website)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix build-system copy)
               #:use-module (guix licenses)
               #:use-module (guix gexp))

(define-public inline-website
               (package
  (name "inline-website")
  (version "2.10")
  ;; todo use origin instead
  (source (local-file "/home/griffin/git/inline-website" #:recursive? #t))
  (build-system copy-build-system)
  (arguments
    '(#:install-plan '(("src/inline-website.py" "bin/"))))
  (synopsis "Hello, Guix world: An example custom Guix package")
  (description
   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
  (home-page "https://www.gnu.org/software/hello/")
  ;; todo this doesnt have a license i just copied this field from the example
  (license gpl3+)))
