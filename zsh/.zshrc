# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt sharehistory histignorealldups

# Key binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"
[ -f "$HOME/.zsh_exports" ] && source "$HOME/.zsh_exports"

# cargo/rust
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# fnm
if [ -f "$HOME/.cargo/bin/fnm" ]; then
  eval "`fnm env`"
fi

# Ghcup
if [ -f "$HOME/.ghcup/env" ]; then
  source "$HOME/.ghcup/env" # ghcup-env
fi

if [ -d /opt/goenv ]; then
  export GOENV_ROOT="/opt/goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi

# Starship
if [ -f "$HOME/.cargo/bin/starship" ]; then
  eval "$(starship init zsh)"
fi

# Zim
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
if [ -f "${ZIM_HOME}/init.zsh" ]; then
  source ${ZIM_HOME}/init.zsh
fi

# Zoxide
if [ -f "$HOME/.cargo/bin/zoxide" ]; then
  eval "$(zoxide init zsh)"
fi

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/acampbell/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# Lua
if [ -d "$HOME/.luarocks" ]; then
  export PATH="$HOME/.luarocks/bin:$PATH"
fi
