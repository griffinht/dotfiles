-- [nfnl] Compiled from lua/init2.fnl by https://github.com/Olical/nfnl, do not edit.
require("treesitter_config")
require("lsp_config")
require("lsp_config2")
local dapui = require("dapui")
dapui.setup()
require("dapui")
vim.keymap.set("n", "<Leader>du", dapui.toggle)
return print("hello from fennel2")
