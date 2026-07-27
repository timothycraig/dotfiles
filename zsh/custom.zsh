# Homebrew — everything below depends on $HOMEBREW_PREFIX from this
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Nvm — sourcing nvm.sh costs ~170ms, so put the default version on PATH
# directly and load nvm itself only when the `nvm` command is first used.
export NVM_DIR="$HOME/.nvm"
if [ -r "$NVM_DIR/alias/default" ]; then
  _nvm_bin="$NVM_DIR/versions/node/$(<"$NVM_DIR/alias/default")/bin"
  [ -d "$_nvm_bin" ] && export PATH="$_nvm_bin:$PATH"
  unset _nvm_bin
fi

nvm() {
  unfunction nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Chruby
if [ -d "$HOMEBREW_PREFIX/opt/chruby" ]; then
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"
  chruby ruby-3.4.1
fi

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

# Java — $HOMEBREW_PREFIX/opt avoids a `brew --prefix openjdk@21` subprocess
if [ -d "$HOMEBREW_PREFIX/opt/openjdk@21" ]; then
  export JAVA_HOME="$HOMEBREW_PREFIX/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# Set up fzf key bindings and fuzzy completion (also rebinds ^R and TAB)
command -v fzf >/dev/null && source <(fzf --zsh)

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
command -v starship >/dev/null && eval "$(starship init zsh)"

# Activate syntax highlighting
_zsh_hl="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$_zsh_hl" ] && source "$_zsh_hl"
unset _zsh_hl

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
_zsh_as="$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f "$_zsh_as" ]; then
  source "$_zsh_as"
  bindkey '^y' autosuggest-execute
fi
unset _zsh_as

# Carapace
command -v carapace >/dev/null && source <(carapace _carapace)

# Lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

# Bat
# export BAT_THEME="Visual Studio Dark+"

# Neovim
export PATH="$HOME/nvim-macos-arm64/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# Claude code
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Herdr
command -v herdr >/dev/null && source <(herdr completion zsh)
