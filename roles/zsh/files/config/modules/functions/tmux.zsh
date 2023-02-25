M_tmux__kill_session_with_fzf() {
    SESSIONS=$(tmux ls -F "#{session_name}")
    SESSIONS="${SESSIONS// /$'\n'}"
    SESSION=$(echo "$SESSIONS" | fzf)

    if [ -z $SESSION ]; then
        exit 0
    fi

    tmux kill-session -t $SESSION
}

M_tmux__open_session_with_fzf() {
    SESSIONS=$(tmux ls -F "#{session_name}")
    SESSIONS="${SESSIONS// /$'\n'}"
    SESSION=$(echo "$SESSIONS" | fzf)

    if [ -z $SESSION ]; then
        exit 0
    fi

    # if outside of tmux
    if [ -z $TMUX ]; then
        tmux attach -t $SESSION
    # else inside of tmux
    else
        tmux switch-client -t $SESSION
    fi
}

M_tmux__create_session_with_fzf() {
    ZOXIDE_RESULT=$(zoxide query -l | fzf --reverse)

    if [ -z $ZOXIDE_RESULT ]; then
        exit 0
    fi

    FOLDER=$(basename $ZOXIDE_RESULT)
    SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')
    SESSION=${SESSION//:/}
    cd $ZOXIDE_RESULT

    # if session does not exists
    if [ -z $SESSION ]; then
        tmux new-session -d -s $FOLDER
    fi 

    # if outside of tmux
    if [ -z $TMUX ]; then
        tmux attach -t $SESSION
    # else inside of tmux
    else
        tmux switch-client -t $SESSION
    fi
}
