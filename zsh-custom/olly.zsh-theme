ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}»"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%}»"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

function my_git_prompt_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    echo "${ref#refs/heads/} %B$(parse_git_dirty)%b %{$reset_color%}"
  else
    echo "»"
  fi
}

PROMPT='%m %B%2d%b $(my_git_prompt_info) '
