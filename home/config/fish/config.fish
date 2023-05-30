
 # FISH STUFF
 #https://github.com/PatrickF1/fzf.fish
 #https://github.com/jethrokuan/fzf

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
    # so pretty yet so terribly hard to read in a real shell
    #cbonsai -p
    #pwd | figlet -tr | lolcat --24bit --invert
    #echo "welcome to the fish shell, $USER" | cowsay | lolcat --24bit
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

        printf '%s%s' \
            "looks like your program exited with a " \
            (fish_status_to_signal $last_pipestatus | string join $separator) \
            | cowsay -d | lolcat --24bit > /dev/tty
        #set last_pipestatus $left_brace$status_color$(fish_status_to_signal $last_pipestatus | string join $separator)$right_brace
        set last_pipestatus ''
    else
        set last_pipestatus ''
    end

        #$last_pipestatus \
        #printf '%s%s\n%s>%s ' \
        #(set_color $fish_color_cwd) (string repeat -n (math "$(tput cols) / 2" | lolcat) '◠◡') \
        #(set_color normal)
    #echo | figlet -trf mnemonic | lolcat --24bit --invert > /dev/tty

    # flush solid line without that wierd gap on the right, doesn't work with echo (inserts unwanted newline)
    # note this doesn't display on fresh terminals for some reason but its actually fine and looks better probably
    #(string repeat -n (math "$(tput cols) + 0") ' ' | lolcat --24bit --invert) \
        #string repeat -n (tput cols) ' ' | lolcat --24bit --invert
    printf '%s%s\n%s%s' \
        (set_color $fish_color_cwd) \
        (string repeat -n (math "$(tput cols) / 2") '◠◡') \
        ' ▬▶ ' \
        (set_color normal)
end
function fish_right_prompt
    printf '%s ' (set_color $fish_color_cwd) (date '+%T' | lolcat)
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
set -x SSL_CERT_DIR "$HOME/.guix-profile/etc/ssl/certs"
set -x SSL_CERT_FILE "$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
set -x GIT_SSL_CAINFO "$SSL_CERT_FILE"

# add local bin for testing
set -x PATH "$HOME/.local/bin:$PATH"

# use bat as pager
# this is useless and the same as PAGER=less
#set -x PAGER "bat --style=plain"

# use bat as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# set editor
set -x EDITOR "nvim"

#
# ALIASES
#

# temp fix for ssh on remote terminals without foot installed (which is all of them)
alias ssh="TERM=linux command ssh $argv"
# always use 24 bit color with lolcat
alias lolcat="command lolcat --24bit $argv"
# always use full terminal width with figlet
alias figlet="command figlet -t $argv"

#
# MAIN
#

# if lf level is set and it is 0
if test -z "$LF_LEVEL" || test "$LF_LEVEL" -eq 0
    # only if it exists
    if which lf > /dev/null
        exec lf
    end 
end
