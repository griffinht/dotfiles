--todo refactor to other file
local dap = require("dap")


-- caused by not defining "program"
-- Error on launch: executable module does not exist


-- to find log location:
-- :lua print(vim.fn.stdpath('cache'))
dap.set_log_level("DEBUG")

-- todo build process
--https://github.com/mfussenegger/nvim-dap/issues/720

-- todo apply runInTerminal for everything c related including launch.json
do
    -- /path/to/program.c -> /path/to/
    local working_directory = vim.fs.dirname(vim.api.nvim_buf_get_name(0));
    -- /path/to/program.c -> /path/to/program
    local program_path = vim.fn.expand("%:r")
    -- /path/to/program.c -> program
    --local program = vim.fn.expand("%:t:r")
    local program = vim.fs.basename(program_path)

    -- dap.configurations
        -- keys are filetypes

    -- default c configuration
    -- assumes the current file example.c can be run as example
    -- todo add build???
    dap.configurations.c = {}

    -- local program
    do
        table.insert(dap.configurations.c, {
            -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
            -- https://llvm.googlesource.com/lldb/+/master/tools/lldb-vscode/
            -- see section "Launch Configuration Settings"

            -- friendly name, shown in certain menus
            name = "Launch C debugger for \"" .. program_path .. "\" (default)";
            -- which adapter to use
            -- note that type does not actually have to be "lldb-vscode" as states on the docs
            -- type is what nvim-dap uses to find the adapter to use
            type = "lldb-vscode";
            request = "launch";

            --initCommands = { "platform shell touch /tmp/aslidufh"};

            -- cwd of lldb-vscode i think?
            --debuggerRoot = working_directory;

            -- program to launch
            program = program_path;
            -- cwd of program
            --cwd = working_directory;

            -- super secret barely document feature that exposes the terminal
            -- todo find the documentation for this
            --https://github.com/llvm/llvm-project/blob/main/lldb/tools/lldb-dap/package.json
            runInTerminal = true;

            --stopOnEntry = true,
        })
    end

    -- make
    do
        table.insert(dap.configurations.c, {
            name = "Launch C debugger for \"" .. "make " .. program .. "\" (from Makefile kind of)";
            type = "lldb-vscode";
            request = "launch";
            program = function()
                local output = vim.fn.system("cd " .. working_directory .. " && make " .. program)
                if vim.v.shell_error ~= 0 then
                    error("error while building " .. program .. ": exited with code " .. vim.v.shell_error .. ", output:\n" .. output)
                    --todo improve error reporting to user (its ugly right now, maybe try a modal?)
                    --todo find a way to gracefully cancel the lsp launch
                    --return nil
                end

                return program_path
            end;
            runInTerminal = true;
        })
    end
end

local dap_current_file = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
local dap_project_root = vim.fs.dirname(vim.fs.find({'.vscode'}, {
    upward = true,
    path = dap_current_file,
})[1])

if dap_project_root ~= nil then
    local type_to_filetypes = {}
    type_to_filetypes["lldb-vscode"] = { "c", "cpp", "h", "hpp" }
    require("dap.ext.vscode").load_launchjs(dap_project_root .. "/.vscode/launch.json", type_to_filetypes)
else
    print("couldn't find dap project root for file " .. dap_current_file)
end


--[[
dap.defaults.fallback.external_terminal = {
    command = "touch";
    args = {"/tmp/bruhhhh"};
}]]--
--dap.defaults.fallback.force_external_terminal = true

-- ADAPTER CONFIG

-- lldb-vscode is included in the guix lldb package
-- it is simply a dap adapter for lldb, and will probably be renamed to lldb-dap soon
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
dap.adapters["lldb-vscode"] = {
    type = "executable";
    --must be an absolute path
    -- this is because lldb will try to reexecute itself to pipe the terminal in if runInTerminal is true
    -- putting a relative path here breaks this
    --command = "lldb-vscode"
    command = vim.fn.exepath("lldb-vscode")
}
-- set leader to space
-- todo centralize keymap config?
vim.g.mapleader = " "
--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
--dap.toggle_breakpoint()
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint)

vim.keymap.set('n', '<Leader>dp', dap.pause)
vim.keymap.set('n', '<Leader>dt', dap.terminate)

vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

local dap_widgets = require("dap.ui.widgets")
vim.keymap.set({'n', 'v'}, '<Leader>dh', dap_widgets.hover)
--vim.keymap.set({'n', 'v'}, '<Leader>dp', dap_widgets.preview)
vim.keymap.set('n', '<Leader>df', function() dap_widgets.centered_float(dap_widgets.frames) end)
vim.keymap.set('n', '<Leader>ds', function() dap_widgets.centered_float(dap_widgets.scopes) end)




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


