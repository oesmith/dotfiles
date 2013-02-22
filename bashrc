export PATH=$PATH:/usr/local/sbin:~/.brew/bin:~/Projects/Libraries/bin

export EDITOR=vim

# virtualenvwrapper
# [[ -s /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# nvm
[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh

# cd MRU https://github.com/rupa/z
source ~/.dotfiles/z/z.sh

# bash completion OSX
if which brew &>/dev/null ; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# git completion
source ~/.dotfiles/lib/git-completion.bash

# dos2unix
function dos2unix {
  perl -pi -e 's/\r\n/\n/g' "$@"
}
function mac2unix {
  perl -pi -e 's/\r/\n/g' "$@"
}

# ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias ll="ls -l"

# HTTP monitoring
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# macvim
[[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]] && alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# postgres
function pg_on() {
  HOMEBREW_PREFIX=$(brew --config | grep PREFIX | awk '{print $2}')
  pg_ctl -D $HOMEBREW_PREFIX/var/postgres -l $HOMEBREW_PREFIX/var/postgres/server.log start
}
function pg_off() {
  HOMEBREW_PREFIX=$(brew --config | grep PREFIX | awk '{print $2}')
  pg_ctl -D $HOMEBREW_PREFIX/var/postgres stop -s -m fast
}

# git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# rails shortcuts
alias dbup="rake db:setup && rake db:test:prepare"
alias dbupp="rake db:setup && rake db:test:prepare && rake parallel:create && rake parallel:prepare"
function examples() {
  if [[ -d examples ]]
  then
    cp examples/*.yml .
  elif [[ -d example ]]
  then
    cp example/*.yml .
  else
    for i in *.example
    do
      cp "$i" "$(basename $i .example)"
    done
  fi
}

# generate self-signed certificates
function sslcert () {
  openssl genrsa -des3 -out $PWD/$1.orig.key 2048
  openssl rsa -in $PWD/$1.orig.key -out $PWD/$1.key
  openssl req -new -key $PWD/$1.key -out $PWD/$1.csr
  openssl x509 -req -days 365 -in $PWD/$1.csr -signkey $PWD/$1.key -out $PWD/$1.crt
  rm $1.orig.key $1.csr
}

# focus for rspec
alias focus="[[ -d ./spec/support ]] && cp ~/.dotfiles/lib/oesmith-rspec-focus.rb ./spec/support/"

# http://justinchouinard.com/blog/2010/04/10/fix-stale-ssh-environment-variables-in-gnu-screen-and-tmux/
function r() {
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=`tmux showenv | grep ^SSH_AUTH_SOCK | cut -d = -f 2`
    if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then
      SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK
    fi
  fi
}

# pretty prompt
parse_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo -e "\033[31m»\033[0m"
  else
    echo -e "\033[32m»\033[0m"
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
export PS1="\u \033[1m\W\033[0m \$(my_git_prompt_info) "
