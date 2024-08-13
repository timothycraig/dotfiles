# Dotfiles symlinked on my machine

### Install with stow:

```bash
./setup.sh

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dotfiles/zsh/aliases.zsh ~/aliases.zsh
ln -s ~/dotfiles/zsh/custom.zsh ~/custom.zsh
```

### Homebrew installation:

```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```
