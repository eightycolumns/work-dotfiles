source "${HOME}/lib/util.sh"

remove_from_path() {
  (($# < 1)) && die 'remove_from_path() expects one or more arguments'

  for path in "$@"; do
    PATH=:${PATH}:
    PATH=${PATH//:${path}:/:}
    PATH=$(echo "${PATH}" | sed -r 's/(^:|:$)//g')
  done

  export PATH
}

export -f remove_from_path

append_to_path() {
  (($# < 1)) && die 'append_to_path() expects one or more arguments'

  for path in "$@"; do
    remove_from_path "${path}" && PATH=${PATH}:${path}
  done

  export PATH
}

export -f append_to_path

prepend_to_path() {
  (($# < 1)) && die 'prepend_to_path() expects one or more arguments'

  for path in "$@"; do
    remove_from_path "${path}" && PATH=${path}:${PATH}
  done

  export PATH
}

export -f prepend_to_path
