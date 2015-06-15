alias tmux="TERM=screen-256color-bce tmux"

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
      echo "%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}"
  fi
}
