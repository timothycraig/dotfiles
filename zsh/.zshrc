# Case-insensitive matching
zstyle ':completion:*' menu select matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 5000000 ] && HISTSIZE=5000000
[ "$SAVEHIST" -lt 1000000 ] && SAVEHIST=1000000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
