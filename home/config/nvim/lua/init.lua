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
require("init2")

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
require("gp_config")




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

--[[
--doesn't work :(
vim.api.nvim_create_autocmd({"TermLeave"}, {
    command = "echo 'leave fake'",
})
]]--
