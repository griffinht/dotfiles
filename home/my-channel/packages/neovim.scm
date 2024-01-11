(define-module (packages neovim)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (guix build-system vim)
               #:use-module (guix licenses)
               #:use-module (guix gexp)
               #:use-module (gnu packages tls)
               #:use-module (gnu packages commencement)
               #:use-module (gnu packages compression)
               #:use-module (gnu packages glib)
               #:use-module (gnu packages base)
               #:use-module (gnu packages gawk)
               #:use-module (gnu packages terminals)
               #:use-module (gnu packages bash)
               #:use-module (gnu packages llvm))
; https://github.com/abcdw/guile-ares-rs
; https://github.com/Olical/conjure
(define-public
  neovim-conjure
  (package
    (name "neovim-conjure")
    (version "4.49.0")
    (source ; todo try version git-version ?? seems neat! see guix edit neovim-packer
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/Olical/conjure")
               (commit (string-append "v" version))))
        (sha256 "1ylqsj6fk2nwmpy0hcjd3rspwah2hsjkay3qmlp8w296j68i6xia")))
    (build-system vim-build-system)
    (arguments
      (list #:plugin-name "clojure.nvim"))
    (synopsis "Interactive evaluation for Neovim (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile, Python and more!) ")
    (description "Conjure is an interactive environment for evaluating code within your running program.")
    (home-page "https://github.com/Olical/conjure")
    (license unlicense)))

(define-public
  neovim-nfnl
  (package
    (name "neovim-nfnl")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/Olical/nfnl")
               (commit "ad6cc1c50cff1ed9911929b1cb139ace4e81ec61")))
        (sha256 "1y20ksi5wdvcmmk87180x6wg7z9sx4641m7q7y9i63dpyr1vzkfl")))
    (build-system vim-build-system)
    (synopsis "Enhance your Neovim with Fennel")
    (description "Write Fennel, run Lua, nfnl will not load unless you're actively modifying your Neovim configuration or plugin source code.")
    (home-page "https://github.com/Olical/nfnl")
    (license unlicense)))
