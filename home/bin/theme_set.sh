#!/bin/sh

set -xe

# should be light or dark
color_scheme="$1"
if [ "$color_scheme" != light ]; then
    if [ "$color_scheme" != dark ]; then
        echo color scheme "$color_scheme" must be light or dark
        exit 1
    fi
fi

theme_nvim=solarized8

directory="$XDG_CACHE_HOME/theme"
mkdir -p "$directory"
# todo use envsubst for syntax highlighting?

if [ "$color_scheme" = light ]; then
    theme_sh_theme=solarized-light
else
    theme_sh_theme=solarized-dark
fi
cat > "$directory/theme.sh" << EOF
theme.sh $theme_sh_theme
EOF
chmod +x "$directory/theme.sh"

cat > "$directory/config.vim" << EOF
" todo?
"set termguicolors
colorscheme $theme_nvim
set background=$color_scheme
EOF

# todo ls colors???
# todo performance! cache!
#export LS_COLORS="$(vivid generate "$theme_sh_theme")"
cat > "$directory/config.fish" << EOF
function theme
    # todo escaping?
    $directory/theme.sh
end

# enable reloads by sending SIGUSR1 to fish processes
trap theme USR1


# apply theme on startup
#theme
# not necessary! handled by foot!
EOF

# todo set with theme.sh -p?

if [ "$color_scheme" = "light" ]; then
cat > "$directory/foot.ini" << EOF
# colors copied from https://codeberg.org/dnkl/foot/src/branch/master/themes/solarized-dark

# -*- conf -*-
# Solarized light

[cursor]
color=fdf6e3 586e75

[colors]
background=              fdf6e3
foreground=              657b83
regular0=                eee8d5
regular1=                dc322f
regular2=                859900
regular3=                b58900
regular4=                268bd2
regular5=                d33682
regular6=                2aa198
regular7=                073642
bright0=                 cb4b16
bright1=                 fdf6e3
bright2=                 93a1a1
bright3=                 839496
bright4=                 657b83
bright5=                 6c71c4
bright6=                 586e75
bright7=                 002b36
EOF

else

cat > "$directory/foot.ini" << EOF
# colors copied from https://codeberg.org/dnkl/foot/src/branch/master/themes/solarized-dark

# -*- conf -*-
# Solarized dark

[cursor]
color= 002b36 93a1a1

[colors]
background= 002b36
foreground= 839496
regular0=   073642
regular1=   dc322f
regular2=   859900
regular3=   b58900
regular4=   268bd2
regular5=   d33682
regular6=   2aa198
regular7=   eee8d5
bright0=    002b36
bright1=    cb4b16
bright2=    586e75
bright3=    657b83
bright4=    839496
bright5=    6c71c4
bright6=    93a1a1
bright7=    fdf6e3

# Enable if prefer solarized colors instead of inverterd fg/bg for
# highlighting (mouse selection)
selection-foreground=93a1a1
selection-background=073642
EOF

#todo lf file manager!
# todo sway
#https://github.com/gokcehan/lf/issues/1483

fi






# make sure all neovim instances are launched like this:
# nvim --listen "~/.cache/nvim/$((RANDOM % 1000000)).pipe"
for pipe in ~/.cache/nvim/*.pipe; do
    # :colorscheme to set the neovim specific color scheme
    # :set background= to set light/dark mode
    # :<Esc> to clear the command from the view
    echo todo "$pipe"
    #nvim --server "$pipe" --remote-send ":source $XDG_CACHE_HOME/theme/config.vim<CR>:<Esc>"
    #nvim --server "$pipe" --remote-send ":colorscheme $theme_nvim<CR>:set background=$THEME_COLOR_SCHEME<CR>:<Esc>"
done

echo todo pkill -USR1 fish
#todo 
#pkill -USR1 fish
