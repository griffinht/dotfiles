#https://stackoverflow.com/questions/28444740/how-to-use-vi-mode-in-fish-shell

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# https://fishshell.com/docs/current/interactive.html#programmable-title
function fish_title
    pwd
end
