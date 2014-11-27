ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"

plugins=(git brew cabal docker encode64 gem jira lein npm pod pip python tmuxinator)

source $ZSH/oh-my-zsh.sh

export PATH="/root/.cabal/bin:"$PATH

### Prompt:
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="root"
