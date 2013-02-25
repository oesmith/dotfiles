# rails shortcuts
alias be="bundle exec"
alias dbup="bundle exec rake db:setup && bundle exec rake db:test:prepare"
alias dbupp="bundle exec rake db:setup && bundle exec rake db:test:prepare && bundle exec rake parallel:create && bundle exec rake parallel:prepare"
alias rps="xvfb-run bundle exec rake parallel:spec"

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
