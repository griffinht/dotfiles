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
require("dap_config")
