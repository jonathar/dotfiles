ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.git-completion ~/.git-completion
ln -sf ~/dotfiles/snips ~/.vim/snips

git config --global init.templatedir '~/dotfiles/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'

# Install all vundle plugins
vim +PluginInstall +qall
