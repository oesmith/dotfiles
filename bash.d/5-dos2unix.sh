# line ending conversions

function dos2unix {
  perl -pi -e 's/\r\n/\n/g' "$@"
}
function mac2unix {
  perl -pi -e 's/\r/\n/g' "$@"
}
