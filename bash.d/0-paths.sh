# add stuff to the path!

function path_contains {
  echo $PATH | grep -F "$1" &>/dev/null
}

function path_lpush {
  if [ -d "$1" ] && ! path_contains $1
  then
    export PATH="$1:$PATH"
  fi
}

function path_rpush {
  if [ -d "$1" ] && ! path_contains "$1"
  then
    export PATH="$PATH:$1"
  fi
}

path_rpush /usr/local/sbin
path_rpush ~/.brew/bin
path_rpush ~/Projects/Libraries/bin
path_rpush ~/.rbenv/bin
path_rpush ~/bin
