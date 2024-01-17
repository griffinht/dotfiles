require("treesitter_config")
require("lsp_config")
require("lsp_config2")
require("conjure")
require("gitsigns").setup({})
require("auto-save").setup({debounce_delay = 100})



require("rust_tools_config")
require("copilot_config")
require("gp_config")
require("term_config")
require("cmp_config") -- todo improve lsp config - see :help cmp
require("vim_plugins")
require("dap_config")




--[[
--doesn't work :(
vim.api.nvim_create_autocmd({"TermLeave"}, {
    command = "echo 'leave fake'",
})
]]--

--[[
vim.g.slime_target = "neovim"
vim.g.slime_get_jobid = function()
    print("asd")
    return 3
end
print(vim.g.slime_get_jobid())
]]--



--;(vim.opt.runtimepath:append ",~/.guix-home/profile/share/vim/vimfiles/")
--;(vim.opt.runtimepath:append ",/home/griffin/.guix-home/profile/share/vim/vimfiles/pack/guix/state/vim-slime")
--;vim.opt.runtimepath
--;(vim.cmd "scriptnames")
--vim.cmd("loadplugins")


--vim.cmd("source $MYVIMRC")


--;(vim.cmd "load-plugins")
--
--vim.cmd("scriptnames")
