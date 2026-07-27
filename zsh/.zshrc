# Case-insensitive matching & menu select
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
setopt globdots

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Initialize the completion system. Bun's completion file does this implicitly
# and unguarded if we don't; -C reuses the dump unless it's over a day old,
# which skips the security audit.
autoload -Uz compinit
_zdump_fresh=(~/.zcompdump(Nmh-24))
if (( $#_zdump_fresh )); then
  compinit -C
else
  compinit
fi
unset _zdump_fresh

# Automatically load bash completion functions (needs compinit above first)
autoload -U +X bashcompinit && bashcompinit

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 5000000 ] && HISTSIZE=5000000
[ "$SAVEHIST" -lt 1000000 ] && SAVEHIST=1000000

## History command configuration
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_ALL_DUPS   # older command is removed from the list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # share command history data

# Enable vi keybindings
bindkey -v
export KEYTIMEOUT=1 # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true # trigger cursor shape changes when switching modes

# Gets called every time the keymap changes (insert <-> normal mode)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q' # block
  else
    echo -ne '\e[6 q' # beam
  fi
}
# Register this function as a ZLE (Zsh Line Editor) widget
zle -N zle-keymap-select

# Runs once when a new ZLE session starts (e.g. when a prompt appears)
zle-line-init() {
  zle -K viins # initiate 'vi insert' as keymap (can be removed if 'binkey -V has been set elsewhere')
  echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup

# Yank to the system clipboard
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Press 'v' in normal mode to launch Vim with current line
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
