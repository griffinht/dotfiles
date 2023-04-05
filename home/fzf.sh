#!/usr/bin/env sh

#cmd fzf_search ${{
# column not used?
result="$( \
    RG_PREFIX="rg --color=always --smart-case --column --line-number --heading --context=5"
    FZF_DEFAULT_COMMAND="$RG_PREFIX ''" \
        fzf \
        --disabled --ansi \
        --bind "change:reload:$RG_PREFIX {q} || true" \
        | cut -d ':' -f 1
)"

#--layout-reverse?
#--header 'header'?
    #--delimiter ':' --preview 'bat --color=always {1} --highlight-line={2}' \
if [ ! -z "$result" ]; then
    lf -remote "send $id select \"$result\""
fi
#}}

#map gs :fzf_search
