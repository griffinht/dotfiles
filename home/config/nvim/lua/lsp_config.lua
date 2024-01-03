-- Set up lspconfig.
-- https://github.com/hrsh7th/cmp-nvim-lsp
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

local lspconfig = require("lspconfig")
--local lsp_defaults = lspconfig.util.default_config

--[[
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)]]--

--moved to ftplugin
--lspconfig.jdtls.setup {}
lspconfig.clangd.setup {}
lspconfig.pylsp.setup {}
lspconfig.gopls.setup {}
lspconfig.marksman.setup {}
lspconfig.bashls.setup {}
-- see :help lspconfig-all guile_ls
lspconfig.guile_ls.setup {
    -- default is scheme.guile which is not recognized
    filetypes = { "scheme" }
}
--https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- todo add snippet plugin and override capabilities
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--lspconfig.jsonls.setup { capabilities = capabilities }

-- vscode
-- todo formatter
lspconfig.eslint.setup({})
-- todo add snippets, formatter
lspconfig.html.setup({})
-- todo snippets
lspconfig.cssls.setup({})
-- todo snippets
lspconfig.jsonls.setup({})
lspconfig.rust_analyzer.setup({})
--todo sql lsp
--this one or joes?
--lspconfig.sqlls.setup{}
--todo yaml/yml WITH SCHEME https://github.com/jesseduffield/lazydocker/blob/master/docs/Config.md

lspconfig.lua_ls.setup {
    on_init = function(client)
        client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT"
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    --[[
                    library = {
                        vim.env.VIMRUNTIME
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }]]--
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                     library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        })

        --client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        return true
    end,
}


-- jump around C-], C-O back C-I forward
-- :noh clear search
-- todo use space leader key?
-- <space>f for example
--vim.keymap.del("n", "k")
vim.keymap.set("n", "<Tab>", function()
    local buffer = vim.diagnostic.open_float()
    print(buffer)
    vim.keymap.set("n", "<Enter>", ":q<CR>", {buffer = buffer})
    vim.keymap.set("n", "<Esc>", ":q<CR>", {buffer = buffer})
end)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)


vim.keymap.set("i", "<C-Space>", "<C-X><C-O>")

--pretty great example of auto closeable and stuff
--https://neovim.discourse.group/t/how-to-show-diagnostics-on-hover/3830/3

-- TODO TODO TODO
--https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion

-- great defaults https://github.com/neovim/nvim-lspconfig#suggested-configuration
vim.api.nvim_create_autocmd("LspAttach", {
    -- i think this prevents the group from being created multiple times maybe
    -- idk why its necessary
    -- todo see :help nvim_create_augroup
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
        -- lsp buffer

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- local mappings
        local options = { buffer = event.buf }

        --todo control-i is mapped??
        -- hover
        --todo this is set by man.lua??? huh?
        vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, options)
        vim.keymap.set("n", "<C-S-K>", vim.lsp.buf.document_symbol)

        -- go to
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, options)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)

        -- actions
        vim.keymap.set("n", "<C-Tab>", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<S-R>", vim.lsp.buf.rename)
        --vim.keymap.set("i", "<S-Space>", vim.lsp.buf.completion)
        --todo buf format?
        -- todo clangd implementation with compile_commands json
        --https://neovim.discourse.group/t/clangd-lsp-jump-to-definition-takes-me-to-h-file/2153
        --todo workspace folders
    end,
})


