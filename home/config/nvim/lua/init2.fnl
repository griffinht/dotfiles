(require :treesitter_config)
(require :lsp_config)
(require "lsp_config2")
(require "conjure")

; requires codicons
(let [dapui (require :dapui)]
  (dapui.setup)
  (vim.keymap.set "n" "<Leader>du" dapui.toggle))

; todo set up binds
((. (require :gitsigns) :setup) {})	
; auto save every x milliseconds
((. (require :auto-save) :setup) {"debounce_delay" 100})

;(local rt (require :rust-tools))
;(vim.opt.runtimepath:append ",~/.guix-home/profile/share/vim/vimfiles/")
;(vim.opt.runtimepath:append ",/home/griffin/.guix-home/profile/share/vim/vimfiles/pack/guix/state/vim-slime")
;vim.opt.runtimepath
;(vim.cmd "scriptnames")
;(vim.cmd "load-plugins")

;todo debug vim hledger and load-plugins and scriptnames
; actually why not debug the other one?
