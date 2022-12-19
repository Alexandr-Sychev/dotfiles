#!/usr/bin/bash

echo  $DOTFILES
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

echo $DOTFILES/tmux/tmux.conf

git clone https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm
