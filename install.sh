ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

git config --global init.templatedir '~/dotfiles/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'
