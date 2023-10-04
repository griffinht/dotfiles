--"https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim/
-- vim.lsp.buf_get_clients()
--https://langserver.org/
--https://microsoft.github.io/language-server-protocol/implementors/servers/
-- todo workspaces!
--todo dap
--https://davelage.com/posts/nvim-dap-getting-started/

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.java"},
    callback = function(ev)
        --todo only kind of works? issue when its not found
        local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', 'mvnw'}, { upward = true })[1])
        --local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        --local workspace_dir = '/path/to/workspace-root/' .. project_name
        vim.lsp.start({
            --name = 'java',
            cmd = {'jdtls', 
            '-data', vim.env.HOME .. '/.cache/jdtls' .. vim.api.nvim_buf_get_name(0)},
            root_dir = root_dir
            --workspace_folders = {{uri = vim.uri_from_fname('file:///home/griffin/'), name = 'bruh',},},
        })
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.cpp", "*.h", "*.hpp"},
    callback = function(ev)
        vim.lsp.start({
            cmd = {'clangd'},
            root_dir = vim.fs.dirname(vim.fs.find({'Makefile', '*.mk'}, { upward = true })[1])
        })
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.py"},
    callback = function(ev)
        vim.lsp.start({
            cmd = {'pylsp'},
            --root_dir = vim.fs.dirname(vim.fs.find({'Makefile', '*.mk'}, { upward = true })[1])
        })
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.go"},
    callback = function(ev)
        vim.lsp.start({
            cmd = {'gopls'},
            root_dir = vim.fs.dirname(vim.fs.find({'go.mod'}, { upward = true })[1])
        })
    end
})
