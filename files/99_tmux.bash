# Set tmux to start automatically if
# LC_TMUX_SESSION_NAME is set
if [ -n "$LC_TMUX_SESSION_NAME" -a $TERM != "screen" ]; then
  echo -ne "\033]0;"${USER}@${HOSTNAME}"\007"  # Set terminal title
  session_name=$USER-$LC_TMUX_SESSION_NAME
  tmux has-session -t $session_name && tmux attach-session -t $session_name || tmux new-session -s $session_name
  if [ -n "$LC_TMUX_LOGOUT_ON_CLOSE" ]; then
    exit
  fi
fi
