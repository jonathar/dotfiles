alias tmux="TERM=screen-256color-bce tmux"

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    if {rvm gemdir | grep -q "@"}; then
      echo "%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}"
    fi
  fi
}

cdpath=(~/dev/)

export EDITOR=nvim

# Setup employer specific environment
COMPANY_FILE="$HOME/.companyrc"
if [ -f $COMPANY_FILE ]; then
  . $COMPANY_FILE
fi

. ~/dotfiles/.aliasrc

PYTHON_DIR=`python -m site --user-base`/bin
if [ -d $PYTHON_DIR ]; then
  export PATH=$PATH:$PYTHON_DIR
fi

if [ -d "~/Library/Python/3.5/" ]; then
  # AWS cli python path
  export PATH=$PATH:~/Library/Python/3.5/bin/
  # Add userspace python bin/, prefer higher python versions
  for dir in ~/Library/Python/*/bin/(On); do export PATH=$PATH:$dir; done
fi

# Direnv
eval "$(direnv hook zsh)"

function start_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Needed for OSX 10.15. See - https://stackoverflow.com/questions/58272830/python-crashing-on-macos-10-15-beta-19a582a-with-usr-lib-libcrypto-dylib
export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH
