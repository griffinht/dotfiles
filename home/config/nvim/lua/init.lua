require("init2")




require("rust_tools_config")
require("copilot_config")
require("gp_config")
require("term_config")
require("cmp_config") -- todo improve lsp config - see :help cmp




--[[
--doesn't work :(
vim.api.nvim_create_autocmd({"TermLeave"}, {
    command = "echo 'leave fake'",
})
]]--

