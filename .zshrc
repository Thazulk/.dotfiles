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

#zsh completion
fpath=($HOME/zsh-completions/src $fpath)
autoload -Uz compinit
compinit

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

# docker
alias fe-up="docker compose -f docker-compose-dev.yml up"
alias vimbegood="docker run -it brandoncc/vim-be-good:latest"


#Neovim
alias v="nvim ."
alias sv="sudo nvim "
# alias v='NVIM_APPNAME="lazy-nvim" nvim .'

#Kubectl
alias k="kubectl"


#Tmux 
set -o vi

export VISUAL='nvim'
export EDITOR='nvim'
export TERM="tmux-256color"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export EDITOR=/usr/bin/nvim
# export VISUAL=/usr/bin/nvim

#Experimental, working on mutli system solution
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Custom scripts directory
export PATH=$HOME/.local/scripts:$PATH

# Go configuration - dynamic solution for cross-platform compatibility
if command -v go >/dev/null 2>&1; then
  export GOPATH=$(go env GOPATH 2>/dev/null || echo "$HOME/go")
  export GOROOT=$(go env GOROOT 2>/dev/null)
  
  [ -d "$GOPATH/bin" ] && export PATH="$GOPATH/bin:$PATH"
  [ -d "$GOROOT/bin" ] && export PATH="$GOROOT/bin:$PATH"
else
  DEFAULT_GOPATH="$HOME/go"
  if [ -d "$DEFAULT_GOPATH" ]; then
    export GOPATH="$DEFAULT_GOPATH"
    [ -d "$GOPATH/bin" ] && export PATH="$GOPATH/bin:$PATH"
    
    for possible_goroot in /usr/local/go /usr/lib/go /opt/go; do
      if [ -d "$possible_goroot" ] && [ -x "$possible_goroot/bin/go" ]; then
        export GOROOT="$possible_goroot"
        export PATH="$GOROOT/bin:$PATH"
        break
      fi
    done
  fi
fi
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

# fnm
FNM_PATH="/home/thazulk/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/thazulk/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

#Tmux
alias tks="tmux kill-server"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/thazulk/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#

# Start ssh-agent on login
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa 2>/dev/null


source <(kubectl completion zsh)
compdef __start_kubectl k
