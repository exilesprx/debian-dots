# Aliases
alias ls='lsd'
alias ll='lsd -lah'
alias grep='grep --color=auto'
alias vim='nvim'
alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cat='batcat'
alias cat='batcat'

# Exports
export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="kate"
export MANPAGER="nvim +Man!"
export ZIM_HOME="$HOME/.zim"

# fnm
FNM_PATH="/home/acampbell/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/acampbell/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

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

# Zim
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
if [ -f "${ZIM_HOME}/init.zsh" ]; then
  source ${ZIM_HOME}/init.zsh
fi

# Zoxide
if [ -f "$HOME/.local/bin/zoxide" ]; then
  PATH=$PATH:"$HOME/.local/bin/"
  eval "$(zoxide init zsh)"
fi

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/acampbell/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
