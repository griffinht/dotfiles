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

(define-public
  neovim-jdtls
  (package
    (name "neovim-jdtls")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mfussenegger/nvim-jdtls")
               (commit "66b5ace68a5d1c45fdfb1afa8d847e87af2aa1f8")))
        (sha256 "1cycasjvms1m58vcb3sk01dp4dzjjchds20yq0c6vq1s98wir0y6")))
    (build-system vim-build-system)
    (synopsis "Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls")
    (description "Extensions for the built-in Language Server Protocol support in Neovim (>= 0.6.0) for eclipse.jdt.ls.")
    (home-page "https://github.com/mfussenegger/nvim-jdtls")
    (license gpl3)))

(define-public
  neovim-lspconfig
  (package
    (name "neovim-lspconfig")
    (version "0.1.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/neovim/nvim-lspconfig")
               (commit (string-append "v" version))))
        (sha256 "1jm99x9lvgn9h6d5d974c3g52aj8kyhy1w8pr7w80biny2hwan58")))
    (build-system vim-build-system)
    (synopsis "Quickstart configs for Nvim LSP")
    (description "Configs for the Nvim LSP client (:help lsp).")
    (home-page "https://github.com/neovim/nvim-lspconfig")
    (license asl2.0)))

(define-public
  neovim-auto-save
  (package
    (name "neovim-auto-save")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/okuuva/auto-save.nvim")
               (commit "e98cafef75271ec83dc84c933f124ab1bb675ef8")))
        (sha256 "1sa9c3xziciylb1fj3yiy0xzdmls1h9wadmzh9m828ax8wca1pzy")))
    (build-system vim-build-system)
    (synopsis "🧶 Automatically save your changes in NeoVim")
    (description "auto-save.nvim is a lua plugin for automatically saving your changed buffers in Neovim
                 Forked from auto-save.nvim as active development has stopped")
    (home-page "https://github.com/okuuva/auto-save.nvim")
    (license gpl3)))

(define-public
  vim-ledger
  (package
    (name "vim-ledger")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/ledger/vim-ledger")
               (commit "281346a221434574dd7f8767a352b2bf0b218b74")))
        (sha256 "0fa5b41qlall8z2pziwgc43sj24kpavrhdz9amwwsiv2g9wl5cli")))
    (build-system vim-build-system)
    (synopsis "Vim plugin for Ledger")
    (description "Filetype detection, syntax highlighting, auto-formatting, auto-completion, and other tools for working with ledger files. Compatible with both ledger and hledger. See plaintextaccounting.org for background information and other useful links.")
    (home-page "https://github.com/ledger/vim-ledger")
    (license gpl2)))

(define-public
  neovim-treesitter
  (package
    (name "neovim-treesitter")
    (version "0.9.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/nvim-treesitter/nvim-treesitter")
               (commit (string-append "v" version))))
        (sha256 "0sq4q070104rcnssxm0icxn31ngcfjbjg9430prb4hsm92msz2yl")))
    (build-system vim-build-system)
    (synopsis "Nvim Treesitter configurations and abstraction layer")
    (description "The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it:")
    (home-page "https://github.com/nvim-treesitter/nvim-treesitter")
    (license asl2.0)))

; todo define multiple outputs for neovim and vim??
(define-public
  neovim-solarized8
  (package
    (name "neovim-solarized8")
    (version "1.5.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/lifepillar/vim-solarized8/")
               (commit (string-append "v" version "-neovim"))))
        (sha256 "0w1vdp105lcqal63ws0av33nn5ba9arh29idq72pfri54qfhqy0a")))
    (build-system vim-build-system)
    (synopsis "Optimized Solarized colorschemes. Best served with true-color terminals!")
    (description "This is yet another Solarized theme for Vim. It places itself half way between the original Solarized and the Flattened variant. It removes only some of the bullshit. The color palette is exactly the same as in Solarized, although some highlight groups are defined slightly differently (for instance, I have tried to avoid red on blue).")
    (home-page "https://github.com/lifepillar/vim-solarized8")
    (license expat))) ; todo im not sure if this is actually mit license

(define-public
  neovim-dap
  (package
    (name "neovim-dap")
    (version "0.7.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mfussenegger/nvim-dap")
               (commit version)))
        (sha256 "1pwn5c0hjm3wpzzybbakxgpq4bd7f6aygvslhivi4inzn48dla90")))
    (build-system vim-build-system)
    (synopsis "Debug Adapter Protocol client implementation for Neovim ")
    (description "nvim-dap is a Debug Adapter Protocol client implementation for Neovim. nvim-dap allows you to:
                  Launch an application to debug
                  Attach to running applications and debug them
                  Set breakpoints and step through code
                  Inspect the state of the application")
    (home-page "https://github.com/mfussenegger/nvim-dap")
    (license gpl3)))

; todo broken?
(define-public
  neovim-gitsigns
  (package
    (name "neovim-gitsigns")
    (version "0.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/lewis6991/gitsigns.nvim")
               (commit (string-append "v" version))))
        (sha256 "086jmhzgpavwjvp7ssd8ga0wxgnz480zzjiv84h4ivva2nv3lnvi")))
    (build-system vim-build-system)
    (synopsis "Git integration for buffers")
    (description "Super fast git decorations implemented purely in Lua.")
    (home-page "https://github.com/lewis6991/gitsigns.nvim")
    (license expat)))

(define-public
  neovim-cmp
  (package
    (name "neovim-cmp")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/hrsh7th/nvim-cmp")
               (commit "538e37ba87284942c1d76ed38dd497e54e65b891")))
        (sha256 "1mxigpm4h8ad8hjd8zy6ajkk2c03vgcrigqarhybz6zsi52iil06")))
    (build-system vim-build-system)
    (synopsis "A completion plugin for neovim coded in Lua.")
    (description "A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and \"sourced\".")
    (home-page "https://github.com/hrsh7th/nvim-cmp")
    (license expat)))

(define-public
  neovim-cmp-conjure
  (package
    (name "neovim-cmp-conjure")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/PaterJason/cmp-conjure")
               (commit "8c9a88efedc0e5bf3165baa6af8a407afe29daf6")))
        (sha256 "1izh45qn90d5ramhnzwvdalg8as9273r4p4flcwaf2klr8drff5r")))
    (build-system vim-build-system)
    (synopsis "nvim-cmp source for conjure.")
    (description "")
    (home-page "https://github.com/PaterJason/cmp-conjure")
    (license expat)))

(define-public
  neovim-cmp-lsp
  (package
    (name "neovim-cmp-lsp")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/hrsh7th/cmp-nvim-lsp")
               (commit "5af77f54de1b16c34b23cba810150689a3a90312")))
        (sha256 "03q0v6wgi1lphcfjjdsc26zhnmj3ab9xxsiyp1adl3s1ybv22jzz")))
    (build-system vim-build-system)
    (synopsis "nvim-cmp source for neovim builtin LSP client")
    (description "")
    (home-page "https://github.com/hrsh7th/cmp-nvim-lsp")
    (license expat)))

(define-public
  neovim-dap-ui
  (package
    (name "neovim-dap-ui")
    (version "3.9.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rcarriga/nvim-dap-ui")
               (commit (string-append "v" version))))
        (sha256 "0xa8bk272rxh95m9iiiipc1v12j0ln37pshg12dxmqb0bq678d43")))
    (build-system vim-build-system)
    (synopsis "A UI for nvim-dap")
    (description "A UI for nvim-dap which provides a good out of the box configuration.")
    (home-page "https://github.com/rcarriga/nvim-dap-ui")
    (license expat)))


#|
(define-public
  neovim-plenary
  (package
    (name "neovim-plenary")
    (version "0.1.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/nvim-lua/plenary.nvim")
               (commit (string-append "v" version))))
        (sha256 "b3q0v6wgi1lphcfjjdsc26zhnmj3ab9xxsiyp1adl3s1ybv22jzz")))
    (build-system vim-build-system)
    (synopsis "All the lua functions I don't want to write twice.")
    (description "")
    (home-page "https://github.com/nvim-lua/plenary.nvim")
    (license expat)))|#

; todo depend on treesitter
(define-public
  neovim-dap-virtual-text
  (package
    (name "neovim-dap-virtual-text")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/theHamsta/nvim-dap-virtual-text")
               (commit "d4542ac257d3c7ee4131350db6179ae6340ce40b")))
        (sha256 "1xgj7m5b89ndy5asg6zknhpqbgflhd82vvwafzqxgc6zr86iv4r0")))
    (build-system vim-build-system)
    ;(propagated-inputs
    ;  (list neovim-treesitter))
    (synopsis "")
    (description "This plugin adds virtual text support to nvim-dap")
    (home-page "https://github.com/theHamsta/nvim-dap-virtual-text")
    (license gpl3)))

(define-public
  neovim-treesitter
  (package
    (name "neovim-treesitter")
    (version "0.9.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/nvim-treesitter/nvim-treesitter")
               (commit (string-append "v" version))))
        (sha256 "0sq4q070104rcnssxm0icxn31ngcfjbjg9430prb4hsm92msz2yl")))
    (build-system vim-build-system)
    (synopsis "Nvim Treesitter configurations and abstraction layer")
    (description "The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it")
    (home-page "https://github.com/nvim-treesitter/nvim-treesitter")
    (license asl2.0)))

#|
broken
(define-public
  vscode-js-debug
  (package
    (name "vscode-js-debug")
    (version "main")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mxsdev/nvim-dap-vscode-js")
               (commit (string-append version))))
        (sha256 "1nj299by3qs0dbsv1lxb19ia9pbpspw22kdlrilwl8vqixl77ngi")))
    (build-system vim-build-system)
    (synopsis "nvim-dap adapter for vscode-js-debug")
    (description "nvim-dap adapter for vscode-js-debug.")
    (home-page "https://github.com/mxsdev/nvim-dap-vscode-js")
    (license #f)))
|#


; guix already packaged this lol
#|
(define-public
  vim-slime
  (package
    (name "vim-slime")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/jpalardy/vim-slime")
               (commit "a532203bcd7af7f5e571c07b60bba7287076dc19")))
        (sha256 "0jfzah18mzh0iszi6k86k4y571j6jjhg3cyy9ivxcybacppaf2id")))
    (build-system vim-build-system)
    (synopsis "A vim plugin to give you some slime. (Emacs)")
    (description "vim-slime is a humble attempt at getting _some_ of the SLIME features into Vim.
It works with any REPL and isn't tied to Lisp.")
    (home-page "https://github.com/jpalardy/vim-slime")
    (license expat)))|#
