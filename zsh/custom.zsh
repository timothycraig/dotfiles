# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Miniconda
export PATH="$HOME/miniconda2/bin:$PATH"

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Postgress.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/15/bin
export PGHOST=localhost

# Mongodb
export PATH="$HOME/mongodb/bin:$PATH"

# Terraform
export PATH="$HOME/terraform/bin:$PATH"

# Added by travis gem
[ -f /Users/ttcraig/.travis/travis.sh ] && source /Users/ttcraig/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ttcraig/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ttcraig/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ttcraig/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ttcraig/google-cloud-sdk/completion.zsh.inc'; fi

# Bun completions
[ -s "/Users/ttcraig/.bun/_bun" ] && source "/Users/ttcraig/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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
