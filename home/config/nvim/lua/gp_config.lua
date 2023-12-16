require("gp").setup({
    openai_api_key = { "cat", vim.fn.expand("~/.local/state/gpnvimkey") },
})

vim.keymap.set("v", "<C-G>", "<cmd>")
