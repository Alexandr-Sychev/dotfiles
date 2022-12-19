#!/usr/bin/bash

ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm
