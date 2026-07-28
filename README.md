# Dotfiles symlinked on my machine

### Install with stow:

`setup.sh` stows everything into `~/.config` and links the Claude Code config
into `~/.claude`. Zsh needs two links in `$HOME` that stow can't make itself:

```bash
./setup.sh

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
```

(`aliases.zsh` and `custom.zsh` need no links — `.zshrc` sources them from
`~/.config/zsh/`, which stow provides.)

### Homebrew installation:

```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```

### herdr plugins:

herdr records installed plugins in `herdr/plugins.json` using absolute paths, so
it's gitignored along with the rest of the package and a fresh machine has to
reinstall. Launch herdr first — the CLI only talks to a running server:

```bash
# tmux-style tab titles, driven by the focused pane's process or directory
herdr plugin install aarsh21/herdr-tab-title
herdr plugin action invoke aarsh21.tab-title.start
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
