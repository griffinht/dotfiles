-- IMPORTS
-- these are all downloaded with the nvim.mk makefile

-- toggle with :ASToggle
vim.opt.runtimepath:append(",~/git/auto-save.nvim")

-- hledger vim
vim.opt.runtimepath:append(",~/git/vim-ledger")

-- terrible hack to add guix vim package to neovim
-- this will probably break things frequently
vim.opt.runtimepath:append(",~/.guix-home/profile/share/vim/vimfiles/pack/guix/start/solarized")

-- language server stuff
vim.opt.runtimepath:append(",~/git/nvim-lspconfig")
vim.opt.runtimepath:append(",~/git/nvim-jdtls")

require("treesitter_config")
require("lsp_config")

-- requires codicons
local dapui = require("dapui")
dapui.setup()
require("dap_config")
vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)

-- requires plenary for debugging
local rt = require("rust-tools")


rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<C-Tab>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})



require("copilot_config")
