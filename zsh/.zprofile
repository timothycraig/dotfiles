# Locale settings
export LANG="en_US.UTF-8" # Sets default locale for all categories
export LC_ALL="en_US.UTF-8" # Overrides all other locale settings
export LC_CTYPE="en_US.UTF-8" # Controls character classification and case conversion

# Set neovim as default editor and enable vim motions in the command prompt
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
set -o vi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
