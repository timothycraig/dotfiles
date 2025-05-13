# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completions
[ -s "/Users/ttcraig/.bun/_bun" ] && source "/Users/ttcraig/.bun/_bun"

# Chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
chruby ruby-3.4.1

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Tmux
# Always work in a tmux session if Tmux is installed
# if which tmux 2>&1 >/dev/null; then
#   if [ $TERM != "tmux-256color" ] && [  $TERM != "screen" ]; then
#     tmux attach -t default || tmux new -s default; exit
#   fi
# fi

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-execute

# Lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

# Bat
export BAT_THEME="Visual Studio Dark+"

# Neovim
export PATH="$HOME/nvim-macos-arm64/bin:$PATH"

