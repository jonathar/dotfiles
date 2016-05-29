alias tmux="TERM=screen-256color-bce tmux"

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    if {rvm gemdir | grep -q "@"}; then
      echo "%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}"
    fi
  fi
}

cdpath=(~/dev/)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-railscasts.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
