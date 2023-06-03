vim.opt.runtimepath:append("~/.local/share/nvim-treesitter")

require'nvim-treesitter.configs'.setup {
    parser_install_dir = "~/.local/share/nvim-treesitter",
}
