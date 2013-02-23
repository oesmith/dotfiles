# generate self-signed certificates
function sslcert () {
  openssl genrsa -des3 -out $PWD/$1.orig.key 2048
  openssl rsa -in $PWD/$1.orig.key -out $PWD/$1.key
  openssl req -new -key $PWD/$1.key -out $PWD/$1.csr
  openssl x509 -req -days 365 -in $PWD/$1.csr -signkey $PWD/$1.key -out $PWD/$1.crt
  rm $1.orig.key $1.csr
}
