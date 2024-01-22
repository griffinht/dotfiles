(define-module (packages-built misc)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system copy)
               #:use-module (guix licenses)
               #:use-module (guix gexp)
               #:use-module (gnu packages node)
               #:use-module (gnu packages haskell-apps))

(define (hack2 name arguments inputs home-page license)
  (package
    (name name)
    (version "")
    (source (local-file (string-append "binaries/" name) #:recursive? #t))
    (build-system copy-build-system)
    (arguments arguments)
    (inputs inputs)
    (synopsis "hacky dumb npm install thing")
    (description "")
    (home-page home-page)
    (license license)))

(define (hack name inputs home-page license)
  (hack2 name '(#:install-plan '(("." ""))) inputs home-page license))

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

(define-public
  vscode-java-test
  (hack2
    "vscode-java-test"
    '(#:install-plan '(("server" "lib/vscode-java-test")))
    '()
    "https://github.com/microsoft/vscode-java-test"
    expat))

(define-public
  java-debug
  (hack2
    "java-debug"
    '(#:install-plan '(("com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.50.0.jar" "lib/java-debug")))
    '()
    "https://github.com/microsoft/vscode-java-test"
    expat))
