# Setup nvim
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
cp ~/dotfiles/fonts/* ~/Library/fonts/.

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.git-completion ~/.git-completion
if [ ! -h ~/.vim/snips ]; then
  ln -sf ~/dotfiles/snips ~/.vim/snips
fi

git config --global init.templatedir '~/dotfiles/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'

# Install all vundle plugins
vim +PluginInstall +qall
