(define-module (packages misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system meson)
               #:use-module (guix licenses)
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages xdisorg)
               #:use-module (gnu packages web)
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
(define-public
  drm_info
  (package
    (name "drm_info")
    (version "2.6.0")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://gitlab.freedesktop.org/emersion/drm_info")
            (commit (string-append "v" version))))
        (sha256 "0fc1rd3c16ddzbdpcj473ykszipzblj98lk376slk63v7mqvc1qm")))
      (build-system meson-build-system)
      (inputs
        (list pkg-config libdrm json-c))
      (synopsis "")
      (description "")
      (home-page "https://gitlab.freedesktop.org/emersion/drm_info")
      (license expat)))
