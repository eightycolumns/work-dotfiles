die() {
  (($# == 1)) || die 'die() expects one argument'
  local -r message=$1
  echo "error: ${message}" 1>&2 && exit 1
}

export -f die

usage() {
  (($# == 1)) || die 'usage() expects one argument'
  local -r message=$1
  echo "usage: ${message}" 1>&2 && exit 64
}

export -f usage
