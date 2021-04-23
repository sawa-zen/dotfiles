#!/bin/sh

CURRENT=$(cd $(dirname $0);pwd)

ln -sf $CURRENT/tmux/.tmux.conf ~/.tmux.conf
ln -sf $CURRENT/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $CURRENT/git/.gitconfig ~/.gitconfig