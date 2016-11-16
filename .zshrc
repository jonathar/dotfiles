alias tmux="TERM=screen-256color-bce tmux"

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    if {rvm gemdir | grep -q "@"}; then
      echo "%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}"
    fi
  fi
}

cdpath=(~/dev/)

export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export EDITOR=nvim
