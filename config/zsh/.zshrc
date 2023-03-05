export DOTFILES=~/.dotfiles

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$DOTFILES/scripts

export PATH=$PATH:/usr/lib/ruby/gems/3.0.0
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0
export PATH=$PATH:"$(dirname $(gem which tmuxinator))"

# pywal section

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

# end pywal secion

# Aliases
source $DOTFILES/config/zsh/aliases
source $DOTFILES/config/zsh/aliases-generated
