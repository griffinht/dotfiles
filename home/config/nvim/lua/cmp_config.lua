do
    local cmp = require("cmp")
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({ -- used to set priority
            { name = "nvim_lsp" },
            { name = "conjure" },
        }, { -- set buffer to a lower priority
            --{ name = "buffer" }, -- this is annoying, it just puts every word in the buffer as autocompletion lol
        }),
    })
end

