# Displays last backup time.
if [[ -f ~/.last-backup ]] ; then
  echo -n "Last backup: "
  stat -f %Sm -t "%a %b %e %X" ~/.last-backup
fi
