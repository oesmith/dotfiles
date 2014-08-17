# load stuff from config dir
if [ -d ~/.dotfiles/bash_profile.d ]; then
  for i in ~/.dotfiles/bash_profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
