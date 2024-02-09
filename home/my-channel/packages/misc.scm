(define-module (packages misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system gnu)
               #:use-module (guix licenses)
               ;#:use-module (guix gexp)
               #:use-module (gnu packages autotools))

; todo doesn't work lol
#|
(define-public
  catatonit
  (package
    (name "catatonit")
    (version "0.2.0")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/openSUSE/catatonit")
            (commit (string-append "v" version))))
        (sha256 "02f2w9w1gh1mphp4m4rmq4qzhw9xx06s0qvf9vgz3b0fzr2m98h2")))
    (build-system gnu-build-system)
    (inputs
      (list autoconf automake))
    (synopsis "")
    (description "")
    (home-page "https://github.com/openSUSE/catatonit")
    (license gpl2)))
|#
