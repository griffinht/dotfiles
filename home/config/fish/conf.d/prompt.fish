if ! status is-interactive
    return
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
        # todo only print this once - shouldn't keep going multiple times
        # or just stop using cowsay :( its so pretty but so distracting
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
    # note $(tput cols) can return x.5 so we need to truncate decimals
    printf '%s%s\n%s%s' \
        (set_color $fish_color_cwd) \
        (string repeat -n (math --scale 0 "$(tput cols) / 2") '◠◡') \
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
