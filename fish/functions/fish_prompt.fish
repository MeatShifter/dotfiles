function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    prompt_login

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    if set -q SSH_TTY
        set -g fish_color_host brred
    end

    echo -n '➤ '
    set_color normal
end
