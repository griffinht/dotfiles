if ! status is-interactive
    return
end

function copy_last_command
    # also print the copied command to stderr
    history -n 1 | tee /dev/stderr | wl-copy
end

# bangarang
function run_last_command
    echo hi
    #switch (commandline -t)
    #    case "!"
    #        commandline --current-token -- $history[1]
    #        commandline --function repaint
    #end
    echo done
end

function noop
end

bind -M insert --sets-mode default jj noop
abbr gg run_last_command
#bind -M insert ! run_last_command
alias !!="echo hi"
