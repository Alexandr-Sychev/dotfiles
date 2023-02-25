_M_tmux__select_active_session_with_fzf() {
    SESSIONS=$(tmux ls -F "#{session_name}")
    SESSIONS="${SESSIONS// /$'\n'}"
    SESSION=$(echo "$SESSIONS" | fzf)

    echo $SESSION
}

_M_tmux__go_to_session() {
    session=$1

    # if outside of tmux
    if [ -z $TMUX ]; then
        tmux attach -t $session
    # else inside of tmux
    else
        tmux switch-client -t $session
    fi
}

_M_tmux__get_tmuxinator_template() {
    case $1 in 
        blog)
            echo laravel-sail
            ;;
        *)
            echo simple
            ;;
    esac
}

_M_tmux__get_tmuxinator_template_path() {
    echo "$DOTFILES/roles/tmux/files/templates/$(_M_tmux__get_tmuxinator_template $1).yml" 
}

_M_tmux__create_project_session() {
    cd $project_path

    if [ -e $project_path/.tmuxinator.yml ]
    then
        tmuxinator start -n $project_name
    else
        tmuxinator start -n $project_name \
            -p $(_M_tmux__get_tmuxinator_template_path $project_name)
    fi
}

M_tmux__kill_session_with_fzf() {
    SESSION=$(_M_tmux__select_active_session_with_fzf)

    if [ -z $SESSION ]; then
        exit 0
    fi

    tmux kill-session -t $SESSION
}

M_tmux__open_session_with_fzf() {
    SESSION=$(_M_tmux__select_active_session_with_fzf)

    if [ -z $SESSION ]; then
        exit 0
    fi

    _M_tmux__go_to_session $SESSION
}

M_tmux__create_session_from_projects_directory_with_fzf() {
    projects_directory=$1
    project_name=$(ls --format=single-column $1 | fzf)
    project_path=$projects_directory/$project_name

    tmux has-session -t $project_name 2>/dev/null

    if [ $? = 1 ]
    then
        _M_tmux__create_project_session $project_name
    fi

    _M_tmux__go_to_session $project_name
}

