(define-module (packages-bin language-server)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system copy)
               #:use-module (guix licenses)
               #:use-module (guix gexp)
               #:use-module (gnu packages node)
               #:use-module (gnu packages haskell-apps))

(define (hack name inputs home-page license)
  (package
    (name name)
    (version "")
    (source (local-file (string-append "binaries/" name) #:recursive? #t))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("." ""))))
    (inputs inputs)
    (synopsis "hacky dumb npm install thing")
    (description "")
    (home-page home-page)
    (license license)))

(define-public
  vscode-langservers-extracted
  (hack
    "vscode-langservers-extracted"
    (list node-lts)
    "https://github.com/hrsh7th/vscode-langservers-extracted"
    expat))

(define-public
  typescript-language-server
  (hack
    "typescript-language-server"
    (list node-lts)
    "https://github.com/typescript-language-server/typescript-language-server"
    expat))

(define-public
  bash-language-server
  (hack
    "bash-language-server"
    (list node-lts shellcheck)
    "https://github.com/bash-lsp/bash-language-server"
    expat))

#| needs server/*.jar
(define-public
  bash-language-server
  (package
    (name "vscode-langservers-extracted")
    (version "")
    (source (local-file "binaries/vscode-langservers-extracted" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan '(("node_modules" "node_modules"))))
    (inputs (list node-lts))
    (synopsis "bruh")
    (description "bruh")
    (home-page "")
    (license expat)))
|#
