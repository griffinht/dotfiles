local function enter()
    vim.api.nvim_create_autocmd({"TermEnter"}, {
    --vim.api.nvim_create_autocmd({"ModeChanged"}, {
        --pattern = {"*:i"},
        callback = function()
            vim.api.nvim_command("setlocal nonumber norelativenumber")
            vim.api.nvim_create_autocmd({"ModeChanged"}, {
                pattern = {"*:n*"},
                callback = function()
                    vim.api.nvim_command("setlocal number relativenumber")
                    -- recursive lol!
                    enter()
                end,
            })
        end,
    })
    --})
end

--enter()
vim.api.nvim_create_autocmd({"TermOpen"}, {
    callback = function()
        enter()
        vim.api.nvim_command("startinsert")
    end,
})

-- todo this will probably break lsp
vim.api.nvim_create_autocmd({"TermClose"}, {
    callback = function()
        vim.fn.input("Process exited with " .. vim.v.event.status .. ", press enter to continue")
        vim.api.nvim_command("quit")
    end,
})
