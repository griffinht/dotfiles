#!/bin/sh

# make sure all neovim instances are launched like this:
# nvim --listen "~/.cache/nvim/$((RANDOM % 1000000)).pipe"
for pipe in ~/.cache/nvim/*.pipe; do
    # :colorscheme to set the neovim specific color scheme
    # :set background= to set light/dark mode
    # :<Esc> to clear the command from the view
    nvim --server "$pipe" --remote-send ":source $XDG_CACHE_HOME/theme/config.vim<CR>:<Esc>"
    #nvim --server "$pipe" --remote-send ":colorscheme $theme_nvim<CR>:set background=$THEME_COLOR_SCHEME<CR>:<Esc>"
done

echo todo pkill
#todo 
#pkill -USR1 fish
