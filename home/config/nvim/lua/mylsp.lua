-- vim.lsp.buf_get_clients()

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.java"},
    callback = function(ev)
        vim.lsp.start({
            name = 'java',
            cmd = {'jdtls'},
        })
    end
})
