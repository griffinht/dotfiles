local path = "~/.local/share/nvim-treesitter"

vim.opt.runtimepath:append("," .. path)

require('nvim-treesitter.configs').setup {
    parser_install_dir = path;

    -- todo install all?
    ensure_installed = "all";

    --[[
    ensure_installed = {
        "query",

        "bash",
        "c",
        "cpp",
        "css",
        "comment",
        "diff",
        "dockerfile",
        "fish",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gpg",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        -- "http",
        "ini",
        "java",
        "javascript",
        "jsdoc",
        "json",
        -- "jq",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown_inline",
        "passwd",
        "pem",
        "python",
        "regex",
        "rust",
        "ssh_config",
        "vim",
        "vimdoc",
        "yaml",
    };]]--

    highlight = {
        enable = true;
    };

    --[[
    incremental_selection = {
        --todo
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },]]--

    -- todo what is this
    --[[
    indent = {
        enable = true
    }]]--
}

--todo folding
--[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]]--
