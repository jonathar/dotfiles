ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.git-completion ~/.git-completion

git config --global init.templatedir '~/dotfiles/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'
