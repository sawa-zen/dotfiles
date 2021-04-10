#!/bin/sh

CURRENT=$(cd $(dirname $0);pwd)

#ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile
#ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf $CURRENT/tmux/.tmux.conf ~/.tmux.conf
#ln -sf ~/dotfiles/git/.gitignore_global ~/.gitignore_global
#ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
