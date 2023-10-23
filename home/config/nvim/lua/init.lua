--vim.opt.runtimepath:append(",~/git/cmp-nvim-lsp")
--vim.opt.runtimepath:append(",~/git/nvim-lspconfig")

--require("mycmp")
-- disable tressitter for now, it doesn't really work well
--require("mytreesitter")
--require("mylsp")

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

-- nvim-cmp
vim.opt.runtimepath:append(",~/git/nvim-cmp")
vim.opt.runtimepath:append(",~/git/cmp_luasnip")
vim.opt.runtimepath:append(",~/git/cmp-nvim-lsp")
vim.opt.runtimepath:append(",~/git/cmp-buffer")
vim.opt.runtimepath:append(",~/git/nvim-lspconfig")

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

-- Set up lspconfig.
-- https://github.com/hrsh7th/cmp-nvim-lsp
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.jdtls.setup ({})
lspconfig.clangd.setup ({})
lspconfig.pylsp.setup {}
lspconfig.gopls.setup {}
