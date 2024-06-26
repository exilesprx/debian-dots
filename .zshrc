# Aliases
alias ls='lsd'
alias ll='lsd -lah'
alias grep='grep --color=auto'
alias vim='nvim'
alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cat='batcat'
alias git-curb='git rev-parse --abbrev-ref HEAD'
alias cat='batcat'
alias tmux='TERM=xterm-256color tmux'

# Exports
export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="kate"
export MANPAGER="nvim +Man!"

# Ghcup
if [ -f "$HOME/.ghcup/env" ]; then
  source "$HOME/.ghcup/env" # ghcup-env
fi

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Key binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship
if [ -f /usr/local/bin/starship ]; then
  eval "$(starship init zsh)"
fi

# SSH key
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env
# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ "$agent_run_state" = 1 ]; then
    ssh-add
fi
unset env

# tmuxifier
if [[ -d "$HOME/.tmux/plugins/tmuxifier/bin" ]]; then
  PATH=$PATH:"$HOME/.tmux/plugins/tmuxifier/bin"
  eval "$(tmuxifier init -)"
fi

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# Zoxide
if [ -f "$HOME/.local/bin/zoxide" ]; then
  PATH=$PATH:"$HOME/.local/bin/"
  eval "$(zoxide init zsh)"
fi
