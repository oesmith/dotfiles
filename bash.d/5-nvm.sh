export NVM_DIR=$HOME/.nvm
if [[ -d $NVM_DIR ]] ; then
  if [[ -r ~/.nvm/nvm.sh ]] ; then
    source ~/.nvm/nvm.sh
  elif which brew &> /dev/null ; then
    x=`brew --prefix nvm`/nvm.sh
    [[ -r $x ]] && source $x
  fi
fi
