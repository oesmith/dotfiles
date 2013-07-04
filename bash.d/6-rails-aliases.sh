# rails shortcuts
alias be="bundle exec"
alias x="xvfb-run -a -s '-screen 0 1600x1200x24'"
alias xbe="x bundle exec"
alias dbup="be rake db:setup && be rake db:test:prepare"
alias dbupc="be rake db:create db:migrate db:seed && be rake db:test:prepare"
alias dbupp="be rake db:setup && be rake db:test:prepare && be rake parallel:create parallel:prepare"
alias dbdn="be rake db:drop"
alias rps="xbe rake parallel:spec"
alias tq="xbe script/tq spec --format progress --no-profile"

# copy example config files in $RAILS_ROOT/config/examples
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

# focus for rspec
alias focus="[[ -d ./spec/support ]] && cp ~/.dotfiles/lib/oesmith-rspec-focus.rb ./spec/support/"
