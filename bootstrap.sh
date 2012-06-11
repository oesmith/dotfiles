#!/bin/bash

FILES="vim vimrc gvimrc screenrc tm_properties zshrc zshenv tmux.conf ackrc \
  zsh-custom/olly.zsh-theme:oh-my-zsh/custom/olly.zsh-theme"

mklink() {
  if [[ -z "$2" ]] ; then
    DEST=~/.$1
  else
    DEST=~/.$2
  fi
  if [[ -d ~/.dotfiles/$1 ]] ; then
    if [[ `uname` == 'Darwin' ]] ; then
      ln -sfh ~/.dotfiles/$1 $DEST
    else
      ln -sfT ~/.dotfiles/$1 $DEST
    fi
  else
    ln -sf ~/.dotfiles/$1 $DEST
  fi
}

for i in $FILES ; do
  mklink $(echo $i | tr ':' ' ')
done

