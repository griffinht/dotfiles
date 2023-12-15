if ! status is-interactive
    return
end

# grc is a magical ( but unmaintained :/ ) syntax highlighter for certain commands i run
source $HOME/.guix-home/profile/etc/grc.fish


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


# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert

    # AUTOCOMPLETE


    # tab
    bind -M insert \t forward-word forward-single-char
    # shift tab
    bind -M insert \e\[Z forward-bigword forward-single-char
    # control tab
    bind -M insert \e\[27\;5\;9~ complete-and-search
    # shift+enter accept all and execute
    bind -M insert \e\[27\;2\;13~ accept-autosuggestion execute
end


#
# ALIASES
#

# temp fix for ssh on remote terminals without foot installed (which is all of them)
alias ssh="TERM=linux command ssh $argv"
# always use 24 bit color with lolcat
alias lolcat="command lolcat --24bit $argv"
# always use full terminal width with figlet
alias figlet="command figlet -t $argv"
# todo path doesn't work?
alias sudo="TERM=linux command sudo PATH=$PATH $argv"
# todo stupid hack please remove
# todo guix container!
alias ncspot="LD_LIBRARY_PATH=$HOME/.guix-home/profile/lib command ncspot $argv"
# trash-restore will auto pick up nfs trash dirs causing this command to be really slow, unless we explicitly define the trash directory
alias trash-restore="command trash-restore --trash-dir $HOME/.local/share/Trash $argv"


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
