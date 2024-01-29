local lspconfig = require "lspconfig"
lspconfig.clangd.setup {}
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E501'},
        }
      }
    }
  }
}
lspconfig.gopls.setup {}
lspconfig.marksman.setup {}
lspconfig.bashls.setup {}

-- see :help lspconfig-all guile_ls
-- fennel block comment lol?
--lspconfig.guile_ls.setup {
--    -- default is scheme.guile which is not recognized
--    filetypes = { "scheme" }
--}
--://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- todo add snippet plugin and override capabilities
--capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--lspconfig.jsonls.setup { capabilities = capabilities }

-- vscode
-- todo formatter
lspconfig.eslint.setup {}
lspconfig.tsserver.setup {}
-- todo add snippets, formatter
lspconfig.html.setup {}
-- todo snippets
lspconfig.cssls.setup {}
-- todo snippets
lspconfig.jsonls.setup {}
lspconfig.rust_analyzer.setup {}
-- sql lsp
-- one or joes?
--lspconfig.sqlls.setup{}
-- yaml/yml WITH SCHEME https://github.com/jesseduffield/lazydocker/blob/master/docs/Config.md

-- jump around C-], C-O back C-I forward
-- :noh clear search
-- todo use space leader key?
-- <space>f for example
--vim.keymap.del("n", "k")
--;(local bruh ["n" "[d" "asd"]
--;       (vim.keymap.set (. bruh 0) (. bruh 1) (.bruh 2)))


local function fold(tbl, func, accumulator)
    for _, value in ipairs(tbl) do
        accumulator = func(accumulator, value)
    end
end

local function reduce(tbl, func)
    return fold(tbl, func, tbl[1])
end

local function forEach(tbl, func)
    reduce(tbl, function(_, value)
        func(value)
        return nil
    end)
end

forEach({
   { "n", "<Tab>", function()
       --[[
       local buffer = vim.diagnostic.open_float()
       forEach(
           { "<Enter>", "<Esc>" },
           function(value)
               vim.keymap.set("n", value, ":q<CR>", {buffer = buffer})
           end)
           ]]--
        fold({"<Enter>", "<Esc>"}, function(buffer, value)
               vim.keymap.set("n", value, ":q<CR>", {buffer = buffer})
               return buffer;
           end, vim.diagnostic.open_float())
   end },
   { "n", "[d", vim.diagnostic.goto_prev },
   { "n", "]d", vim.diagnostic.goto_next },
   { "n", "<space>q", vim.diagnostic.setloclist },
   },
   function(value)
       vim.keymap.set(unpack(value))
   end)

--;(vim.keymap.set "i" "<C-Space>" "<C-X><C-O>")
