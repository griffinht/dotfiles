-- IMPORTS
-- these are all downloaded with the nvim.mk makefile

-- toggle with :ASToggle
vim.opt.runtimepath:append(",~/git/auto-save.nvim")

-- hledger vim
vim.opt.runtimepath:append(",~/git/vim-ledger")

-- terrible hack to add guix vim package to neovim
-- this will probably break things frequently
vim.opt.runtimepath:append(",~/.guix-home/profile/share/vim/vimfiles")

-- language server stuff
vim.opt.runtimepath:append(",~/git/nvim-lspconfig")
vim.opt.runtimepath:append(",~/git/nvim-jdtls")






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

--todo https://github.com/mfussenegger/nvim-jdtls
--lspconfig.jdtls.setup ({})
--use nvim-jdtls instead of lspconfig's jdtls (has more features) -- https://github.com/mfussenegger/nvim-jdtls

lspconfig.clangd.setup ({})
lspconfig.pylsp.setup {}
lspconfig.gopls.setup {}
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







--vim.opt.runtimepath:append(",~/git/cmp-nvim-lsp")
--vim.opt.runtimepath:append(",~/git/nvim-lspconfig")

--require("mycmp")
-- disable tressitter for now, it doesn't really work well
--require("mytreesitter")
--require("mylsp")

--[[
-- LUASNIP
vim.opt.runtimepath:append(",~/git/luasnip")
vim.opt.runtimepath:append(",~/git/friendly-snippets")

--load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- luasnip keybinds
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
]]--

-- nvim-cmp
--[[
vim.opt.runtimepath:append(",~/git/nvim-cmp")
vim.opt.runtimepath:append(",~/git/cmp_luasnip")
vim.opt.runtimepath:append(",~/git/cmp-nvim-lsp")
vim.opt.runtimepath:append(",~/git/cmp-buffer")
]]--

--[[
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            print(args.body)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "luasnip" },
    }, {
    }),
})

]]--

--[[
-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')
--package.path = package.path .. ";../entity.lua"
--require("after/plugin/cmp_luasnip")
--https://github.com/neovim/neovim/issues/12670
--https://libreddit.hot.griffinht.com/r/neovim/comments/y58zh8/neovim_lua_setup_initlua_plugin_afterplugin/
--https://neovim.io/doc/user/lua.html#lua-require

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    luasnip.lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  -- { name = 'vsnip' }, -- For vsnip users.
  { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
  { name = 'buffer' },
--  { name = 'path' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})
]]--


