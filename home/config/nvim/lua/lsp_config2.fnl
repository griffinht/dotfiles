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
