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
--https://github.com/emacs-lsp/dap-mode/blob/master/dap-firefox.el
--vim.cmd("scriptnames")
--[[
require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    --... -- see below
  }
end
]]--
