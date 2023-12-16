if ! status is-interactive
    return
end

function copy_last_command
    # also print the copied command to stderr
    history -n 1 | tee /dev/stderr | wl-copy
end


# bangarang
function last_command_search_output
    set --local search_engine_uri https://duckduckgo.com/?q=

    xdg-open "$search_engine_uri($history[1])"
    #commandline --current-token -- $history[1]
    #commandline --function repaint
    #J$history[1]
end

#bind -M default nn last_command_search_output

#abbr gg run_last_command
#bind -M insert ! run_last_command
alias !!="echo hi"
