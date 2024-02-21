#!/bin/sh

set -e

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

cat > "$directory/config.vim" << EOF
" todo?
"set termguicolors
colorscheme $theme_nvim
set background=$color_scheme
EOF

cat > "$directory/config.fish" << EOF
function theme
    apply_theme.sh terminal
end

# enable reloads by sending SIGUSR1 to fish processes
trap theme USR1

# apply theme on startup
#theme
# not necessary! handled by foot!
EOF

# todo set with theme.sh -p?
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

reload_theme.sh
