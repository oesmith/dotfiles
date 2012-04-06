ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}»"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%}»"

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    parse_git_dirty
  else
    echo "%{$fg[white]%}%B»%b"
  fi
}

PROMPT='%{$fg[white]%}%m %{$reset_color%}%2d $(_prompt_char) %{$reset_color%}'
