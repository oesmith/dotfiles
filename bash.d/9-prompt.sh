# pretty prompt
ssh_prefix() {
  if [[ -n "$SSH_TTY" ]] ; then
    echo "($(hostname -s)) "
  fi
}

export PS1="$(ssh_prefix)\u \[\033[1m\]\W\[\033[0m\] » "
