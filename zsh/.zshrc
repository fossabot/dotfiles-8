alias c="clear"
alias pwn="ssh pwn"
alias ipy="/usr/local/anaconda3/bin/jupyter_mac.command ; exit;"
alias pip="pip3"
alias python="python3"
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

export EDITOR=/usr/local/bin/nvim
export GOPATH=$HOME/go

export ZSH=/Users/keyakoto/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
