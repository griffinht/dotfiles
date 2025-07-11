if status is-interactive
    # skinny line cursor when typing
    set fish_cursor_insert line blink

    # jj to quit insert mode
    bind --mode insert --sets-mode default jj repaint

    # starship
    starship init fish | source
end

#set -x EDITOR nvim
