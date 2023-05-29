#
# FISH
#

#https://stackoverflow.com/questions/28444740/how-to-use-vi-mode-in-fish-shell

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#
# APPEARANCE
#

# title
# https://fishshell.com/docs/current/interactive.html#programmable-title
function fish_title
    pwd
end

# greeting
function fish_greeting
    # nothing
    # todo cowsay
end

# prompt
# inspiration https://en.wikipedia.org/wiki/Geometric_Shapes_(Unicode_block)
function fish_prompt
    set last_pipestatus $pipestatus

    # check if any process had non zero exit code
    # im pretty sure this works assuming exit codes are never negative
    # inspire from https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_print_pipestatus.fish which im pretty sure is broken todo
    # (__fish_print_pipestatus '[' ']' '|' (set_color $fish_color_cwd) (set_color $fish_color_error) $last_pipestatus) \
    #     it doesnt work with false | true, only true | false works
    #     my implementation fixes this
    if test (math (string join '+' $last_pipestatus)) -ne 0
        set separator '|'
        set left_brace '['
        set right_brace '] '
        set brace_color (set_color $fish_color_cwd)
        set status_color (set_color $fish_color_error)

        set left_brace $brace_color$left_brace
        set right_brace $brace_color$right_brace
        set separator $brace_color$separator$status_color

        set last_pipestatus $left_brace$status_color$(fish_status_to_signal $last_pipestatus | string join $separator)$right_brace
    else
        set last_pipestatus ''
    end

    # todo lolcat
    printf '%s%s\n%s>%s ' \
        (set_color $fish_color_cwd) (string repeat -n (math "$(tput cols) / 2") '◠◡') \
        $last_pipestatus \
        (set_color normal)
end
function fish_right_prompt
    printf '%s' (set_color $fish_color_cwd) (date '+%T')
end

# set OSC-133;A for foot prompt jumping
# https://codeberg.org/dnkl/foot/wiki#fish-1
function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end

#
# KEYBINDS
#

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

# disable ugly mode prompt from vim mode
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

