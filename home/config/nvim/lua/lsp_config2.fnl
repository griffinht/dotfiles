(local lspconfig (require "lspconfig"))
(lspconfig.clangd.setup {})
(lspconfig.pylsp.setup {})
(lspconfig.gopls.setup {})
(lspconfig.marksman.setup {})
(lspconfig.bashls.setup {})

; see :help lspconfig-all guile_ls
; fennel block comment lol?
;lspconfig.guile_ls.setup {
;    ; default is scheme.guile which is not recognized
;    filetypes = { "scheme" }
;}
;://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
; todo add snippet plugin and override capabilities
;capabilities = vim.lsp.protocol.make_client_capabilities()
;capabilities.textDocument.completion.completionItem.snippetSupport = true
;lspconfig.jsonls.setup { capabilities = capabilities }

; vscode
; todo formatter
(lspconfig.eslint.setup {})
; todo add snippets, formatter
(lspconfig.html.setup {})
; todo snippets
(lspconfig.cssls.setup {})
; todo snippets
(lspconfig.jsonls.setup {})
(lspconfig.rust_analyzer.setup {})
; sql lsp
; one or joes?
;lspconfig.sqlls.setup{}
; yaml/yml WITH SCHEME https://github.com/jesseduffield/lazydocker/blob/master/docs/Config.md

; jump around C-], C-O back C-I forward
; :noh clear search
; todo use space leader key?
; <space>f for example
;vim.keymap.del("n", "k")
;(vim.keymap.set
; todo todo todo
;  "n"
;  "<Tab>"
;  (lambda [] 
;    (let buffer (vim.diagnostic.open_float))
;    (print buffer)
;    (vim.keymap.set "n" "<Enter>" ":q<CR>" {"buffer" buffer})
;    (vim.keymap.set "n" "<Esc>" ":q<CR>" {"buffer" buffer})))

;(local bruh ["n" "[d" "asd"]
;       (vim.keymap.set (. bruh 0) (. bruh 1) (.bruh 2)))



;  [
;   [ "n" "[d" vim.diagnostic.goto_prev ]
;   [ "n" "]d" vim.diagnostic.goto_next ]
;   [ "n" "<space>q" vim.diagnostics.setloclist ]])
;(vim.keymap.set "n" "[d" vim.diagnostic.goto_prev)
;(vim.keymap.set "n" "]d" vim.diagnostic.goto_next)
;(vim.keymap.set "n" "<space>q" vim.diagnostic.setloclist)


;(vim.keymap.set "i" "<C-Space>" "<C-X><C-O>")
