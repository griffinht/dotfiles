(require :treesitter_config)
(require :lsp_config)
(require "lsp_config2")
(require "conjure")

; requires codicons
(local dapui (require :dapui))
(dapui.setup)
(require :dapui)
(vim.keymap.set "n" "<Leader>du" dapui.toggle)
;(local rt (require :rust-tools))

; todo set up binds
((. (require :gitsigns) :setup) {})	



;/home/griffin/.config/nvim,
;/home/griffin/.config/nvim/pack/*/start/*,
;/home/griffin/.guix-home/profile/etc/xdg/nvim,
;/etc/xdg/nvim,
;/home/griffin/.local/share/nvim/site,
;/home/griffin/.guix-home/profile/share/nvim/site,
;/home/griffin/.guix-home/profile/share/nvim/site/pack/*/start/*,
;/home/griffin/.guix-home/profile/share/nvim/site/pack/*/start/*,
;/usr/local/share/nvim/site,
;/usr/share/nvim/site,
;/gnu/store/s8sz04k3k5ii9ssw3ccv05cmchvd5xl4-neovim-0.9.4/share/nvim/runtime,
;/gnu/store/s8sz04k3k5ii9ssw3ccv05cmchvd5xl4-neovim-0.9.4/share/nvim/runtime/pack/dist/opt/matchit,
;/gnu/store/s8sz04k3k5ii9ssw3ccv05cmchvd5xl4-neovim-0.9.4/lib/nvim,
;/usr/share/nvim/site/after,
;/usr/local/share/nvim/site/after,
;/home/griffin/.guix-home/profile/share/nvim/site/after,
;/home/griffin/.local/share/nvim/site/after,
;/etc/xdg/nvim/after,
;/home/griffin/.guix-home/profile/etc/xdg/nvim/after,
;/home/griffin/.config/nvim/after,
;,
;~/.local/share/nvim-treesitter,
;~/.guix-home/profile/share/vim/vimfiles/"}

;(vim.opt.runtimepath:append ",~/.guix-home/profile/share/vim/vimfiles/")
;(vim.opt.runtimepath:append ",/home/griffin/.guix-home/profile/share/vim/vimfiles/pack/guix/state/vim-slime")
;vim.opt.runtimepath
;(vim.cmd "scriptnames")
;(vim.cmd "load-plugins")
((. (require :auto-save) :setup) {})	

;todo debug vim hledger and load-plugins and scriptnames
; actually why not debug the other one?
