#
# FISH
#

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

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# disable ugly mode prompt
function fish_mode_prompt
end

# rememebr we are in vim mode which means our binds need to be in insert mode

# control+space cycle through autocompletes
bind -M insert -k nul complete
# tab accept next word
bind -M insert \t forward-bigword
# shift+enter accept all and execute
bind -M insert \e\[27\;2\;13~ accept-autosuggestion execute

#
# ENVIRONMENT
#

# make ssh work on guix foreign distro
# not needed for guix distro????
# but arch needs this and probably debian
# when nss-certs is installed
set -g SSL_CERT_DIR "$HOME/.guix-profile/etc/ssl/certs"
set -g SSL_CERT_FILE "$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
set -g GIT_SSL_CAINFO "$SSL_CERT_FILE"

# add local bin for testing
set -g PATH "$HOME/.local/bin:$PATH"

# use bat as manpager
set -g MANPAGER "sh -c 'col -bx | bat -l man -p'"

#
# ALIASES
#

# temp fix for ssh on remote terminals without foot installed (which is all of them)
alias ssh="TERM=linux command ssh $argv"

#
# MAIN
#

#if lf level is set and it is 0
#if [ -z "$LF_LEVEL" ] || [ "$LF_LEVEL" -eq 0 ]; then
#    # only if it exists
#    if which lf > /dev/null; then
#        SHELL=fish exec lf
#    fi 
#fi

