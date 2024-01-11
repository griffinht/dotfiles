(require :treesitter_config)
(require :lsp_config)
(require "lsp_config2")

; requires codicons
(local dapui (require :dapui))
(dapui.setup)
(require :dapui)
(vim.keymap.set "n" "<Leader>du" dapui.toggle)
;(local rt (require :rust-tools))
(print "hello from fennel2")
