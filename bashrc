# load stuff from config dir
if [ -d ~/.dotfiles/bash.d ]; then
  for i in ~/.dotfiles/bash.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
