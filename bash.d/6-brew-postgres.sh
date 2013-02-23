# postgres
function pg_on() {
  HOMEBREW_PREFIX=$(brew --config | grep PREFIX | awk '{print $2}')
  pg_ctl -D $HOMEBREW_PREFIX/var/postgres -l $HOMEBREW_PREFIX/var/postgres/server.log start
}
function pg_off() {
  HOMEBREW_PREFIX=$(brew --config | grep PREFIX | awk '{print $2}')
  pg_ctl -D $HOMEBREW_PREFIX/var/postgres stop -s -m fast
}
