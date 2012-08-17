export PATH=$PATH:~/.brew/bin:~/Projects/Libraries/bin

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="olly"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate rails ruby rbenv brew bundler gem heroku npm node osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

unsetopt correct_all

export EDITOR=vim

# virtualenvwrapper
[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# nvm
[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh

# dos2unix
function dos2unix {
  perl -pi -e 's/\r\n/\n/g' "$@"
}

# HTTP monitoring
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# cd MRU https://github.com/rupa/z
source ~/.dotfiles/z/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

# macvim
[[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]] && alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# postgres
alias pg_on="pg_ctl -D /Users/oliver/.brew/var/postgres -l /Users/oliver/.brew/var/postgres/server.log start"
alias pg_off="pg_ctl -D /Users/oliver/.brew/var/postgres stop -s -m fast"

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
alias examples='for i in *.example ; do cp "$i" "$(basename $i .example)" ; done'

# bundled rails, since we use git gems mostly @ WildFire
eval "function bundled_rails () { _run-with-bundler rails \$@}"
alias rails=bundled_rails
compdef _rails bundled_rails=rails
