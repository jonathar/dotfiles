# Setup nvim
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/dein
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
cp ~/dotfiles/fonts/* ~/Library/fonts/.

if [ ! -d "$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim" ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s ~/.config/nvim/dein
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.git-completion ~/.git-completion
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
if [ ! -h ~/.vim/snips ]; then
  ln -sf ~/dotfiles/snips ~/.vim/snips
fi

if [ ! -h ~/.config/nvim/snips ]; then
  ln -sf ~/dotfiles/snips ~/.config/nvim/snips
fi

git config --global init.templatedir '~/dotfiles/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'

# Install all vundle plugins
vim +PluginInstall +qall

defaults write com.googlecode.iterm2 PromptOnQuit -bool false
/usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Normal Font\" \"SauceCodeProNerdFont---Regular 14\""  ~/Library/Preferences/com.googlecode.iterm2.plist

if hash pip3 2>/dev/null; then
  pip3 install --quiet -r ./requirements.txt
else
  echo "pip3 required to fully install"
fi
