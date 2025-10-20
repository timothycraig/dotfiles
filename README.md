# Dotfiles symlinked on my machine

### Install with stow:

```bash
./setup.sh

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
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

### Other programs to install

- Bruno
- Chrome
- DBeaver
- Discord
- Docker
- Ghostty
- Homebrew
- Magnet
- Slack
- Spotify
- VSCode
- Wezterm
- Zoom
- nvm
