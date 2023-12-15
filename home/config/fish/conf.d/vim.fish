if ! status is-interactive
    return
end

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
# normal/visual mode
set fish_cursor_default block
# insert mode
set fish_cursor_insert line
# replace mode
set fish_cursor_replace_one underscore
#function fish_vi_cursor
#    set fish_cursor_insert line
#end

# disable ugly mode prompt from vim mode
function fish_mode_prompt
end
