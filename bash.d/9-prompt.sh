# pretty prompt
ssh_prefix() {
  if [[ -z "$SSH_PTY" ]] ; then
    echo "($(hostname)) "
  fi
}

parse_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo -e "\001\033[31m\002»\001\033[0m\002"
  else
    echo -e "\001\033[32m\002»\001\033[0m\002"
  fi
}
function my_git_prompt_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    echo -e "${ref#refs/heads/} $(parse_git_dirty)"
  else
    echo "»"
  fi
}
export PS1="$(ssh_prefix)\u \[\033[1m\]\W\[\033[0m\] \$(my_git_prompt_info) "
