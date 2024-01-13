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


-- todo neovim stuff idk https://github.com/folke/neodev.nvim
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


