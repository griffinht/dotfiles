-- load guix vim plugins from neovim

do
    local root = vim.fn.expand("~/")

    -- idk if this one does anything
    vim.opt.runtimepath:append(root .. ".guix-home/profile/share/vim/vimfiles")
    -- this one works
    vim.opt.runtimepath:append(root .. ".guix-home/profile/share/vim/vimfiles/pack/*/start/*")
    -- this probably works for plugins withe the after thing
    vim.opt.runtimepath:append(root .. ".guix-home/profile/share/vim/vimfiles/pack/*/start/*/after")
end
