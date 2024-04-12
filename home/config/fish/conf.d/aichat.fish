# todo fish actually has a really neat default alt-e shortcut which I might still want to use
# it seems to open the current command in neovim which is epic
# https://github.com/sigoden/aichat/blob/main/scripts/shell-integration/integration.fish

function _aichat_fish
    set -l _old (commandline)
    if test -n $_old
        echo -n "⌛"
        commandline -f repaint
        commandline (aichat -e $_old)
    end
end
bind -M insert \ee _aichat_fish

