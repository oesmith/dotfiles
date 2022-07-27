#!/bin/bash

FILES="vim vimrc gvimrc bashrc bash_profile tmux.conf ackrc Xdefaults \
  colordiffrc"

CONFIGS="fish foot mako sway waybar sakura"

LOCALS="~/.vimrc.local ~/.bashrc.local"

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

for i in $CONFIGS ; do
  if [[ -d ~/.config/$i ]] ; then
    echo "Not overwriting ~/.config/$i"
  else
    ln -s ~/.dotfiles/config/$i ~/.config/$i
  fi
done

for i in $LOCALS ; do
  if [[ ! -f "$i" ]] ; then
    touch "$i"
  fi
done
