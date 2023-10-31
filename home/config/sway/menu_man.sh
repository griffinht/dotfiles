#!/usr/bin/env sh

# note this script will try to re execute itself based on $0

# add --color=always to bat manpager
#
# takes MANPAGER and chops off the last ' and inserts --color=always
# MANPAGER="$(printf '%s' "$MANPAGER" | head -c -1) --color=always'"
# results in this:
# MANPAGER="sh -c 'col -bx | bat -l man -p --color=always'"
manpager() {
    # chop off the last ending apostrophe
    printf '%s' "$MANPAGER" | head -c -1
    # note the ending apostrophe
    printf " %s'" '--color=always'
}

# turns 'cat (1) - stuff' -> 'cat (1)'
get_title() {
    awk '{print $1,$2}'
    #1st arg is optional to change -f arg
    #cut -d ' ' -f "${1:-1}"
}

get_page() {
    # 'cat (1) - stuff' -> '(1) cat'
    # '(1) cat' -> '1 cat'
    awk '{print $2,$1}' \
        | tr -d '()'
}

open() {
    # cat (1) - extra stuff
    read -r raw
    # cat (1)
    title="$(echo $raw | get_title)"
    # 1 cat
    page="$(echo $raw | get_page)"
    #
    swaymsg exec -- foot --title="'$title'" "man $page"
}

selector() {
    # fzf single quotes: {} -> 'value'
    man -k '' \
        | fzf --preview="echo {} | $0 get_page | xargs man | $(manpager)" \
        | open
}

# run selector by default
if [ $# -eq 0 ]; then
    selector
else
    $@
fi
