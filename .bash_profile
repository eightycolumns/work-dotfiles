source "${HOME}/lib/path.sh"

export PS1="[\u@\h \W]$ "

unalias -a

alias cp='cp -i'
alias emacs='emacs --color=never --no-window-system'
alias gcc='gcc-7'
alias mv='mv -i'
alias play='afplay'
alias python='python3'
alias rm='rm -i'
alias tmux='tmux -2'

stty -ixon

decolorize() {
  local -r color_code='\e\[[0-9;]\+m'
  sed "s/${color_code}//g"
}

export -f decolorize

tree() {
  local -r ignore_dirs='build|.git|gradle|.gradle|node_modules'
  "$(which tree)" -a --charset=ascii -I "${ignore_dirs}" -n "$@"
}

export -f tree

source /usr/local/etc/bash_completion

prepend_to_path "$(brew --prefix coreutils)/libexec/gnubin"
export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:${MANPATH}

export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
prepend_to_path "${JAVA_HOME}/bin"

append_to_path "${HOME}/Library/Android/sdk/emulator"
append_to_path "${HOME}/Library/Android/sdk/platform-tools"
append_to_path "${HOME}/Library/Android/sdk/tools"
append_to_path "${HOME}/Library/Android/sdk/tools/bin"

export NVM_DIR=${HOME}/.nvm
source /usr/local/opt/nvm/nvm.sh
nvm use --lts > /dev/null

prepend_to_path "${HOME}/mongodb-osx-x86_64-4.0.3/bin"

append_to_path "${HOME}/elastic-stack/elasticsearch-6.4.2/bin/elasticsearch"
append_to_path "${HOME}/elastic-stack/kibana-6.4.2-darwin-x86_64/bin/kibana"
append_to_path "${HOME}/elastic-stack/metricbeat-6.4.2-darwin-x86_64/metricbeat"

source "${HOME}/Library/Caches/heroku/autocomplete/bash_setup"

source "${HOME}/google-cloud-sdk/path.bash.inc"
source "${HOME}/google-cloud-sdk/completion.bash.inc"

prepend_to_path "${HOME}/bin"
