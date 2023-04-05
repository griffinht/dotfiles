#!/usr/bin/env sh

export RG_PREFIX="rg --color=always --smart-case --line-number"
FZF_DEFAULT_COMMAND="$RG_PREFIX ''" \
    fzf \
    --disabled --ansi \
    --delimiter ':' --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind 'change:reload:$RG_PREFIX {q} || true'
