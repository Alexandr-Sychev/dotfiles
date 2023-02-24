export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

plugins=(
  git
  fzf-zsh-plugin
  zsh-syntax-highlighting
  vi-mode
  laravel-sail
)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v

export FZF_PREVIEW_ADVANCED=true
export FZF_PREVIEW_WINDOW='right:65%:nohidden'

export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DOTFILES=~/.dotfiles
export PATH=$PATH:$DOTFILES/scripts

# Aliases

source ./config/aliases.zsh

