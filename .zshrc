HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions



# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh pure promt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Git aliases
alias gst='git status'
alias gf='git fetch'
alias gcan!='git commit -v -a --no-edit --amend'
alias gpl='git pull'
alias gaa='git add .'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gbr='git branch'
alias gsw='git switch'
alias gswc='git switch -c'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# yay
alias yu="yay -Syu"

alias fe-up="docker compose -f docker-compose-dev.yml up"
alias dotfiles="cd ~/.dotfiles"
alias nvim="nvim ."
alias v='NVIM_APPNAME="lazy-nvim" nvim .'

set -o vi

export VISUAL='NVIM_APPNAME="lazy-nvim" nvim'
export EDITOR='NVIM_APPNAME="lazy-nvim" nvim'
export TERM="tmux-256color"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export EDITOR=/usr/bin/nvim
# export VISUAL=/usr/bin/nvim

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/.local/scripts:$PATH

# bindkey -s '^f' 'nvim $(fzf)^M'
# open tmux sessionizer with ctrl+f
bindkey -s ^f "tmux-sessionizer\n"
# open vscode with alt+f
bindkey -s "^[f" "vscode-sessionizer\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Enable vi mode
bindkey -v

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# pnpm
export PNPM_HOME="/home/pszedmak/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=$PATH:$HOME/go/bin
