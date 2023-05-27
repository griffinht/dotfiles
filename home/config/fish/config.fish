#https://stackoverflow.com/questions/28444740/how-to-use-vi-mode-in-fish-shell

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# https://fishshell.com/docs/current/interactive.html#programmable-title
function fish_title
    pwd
end

function fish_greeting
    # nothing
end

# set OSC-133;A for foot prompt jumping
# https://codeberg.org/dnkl/foot/wiki#fish-1
function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end

function fish_prompt
    printf '%s$%s ' (set_color $fish_color_cwd) (set_color normal)
end
