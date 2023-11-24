local path = "~/.local/share/nvim-treesitter"

vim.opt.runtimepath:append("," .. path)

require('nvim-treesitter.configs').setup {
    parser_install_dir = path;

    highlight = {
        enable = true;
    }
}
