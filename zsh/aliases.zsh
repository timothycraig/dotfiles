# Directory shortcuts
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias fsfs='cd ~/Code/Frameshift'
alias vsvs='cd ~/Code/Vue'

# Docker
alias dup='docker compose up'
alias ddown='docker compose down'
alias dps='docker compose ps'
alias dub='docker compose up -d --build'
alias dstp='docker compose stop'
alias drm='docker compose rm'
alias dsall='docker stop $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q) -f'
alias drmall='docker rm $(docker ps -a -q)'
alias dprune='docker system prune -a'
alias drs='docker restart $1'

# Mosaic specific
alias mseed='docker compose run --rm express bash dev-tools/seed-projects.sh'
alias mseedv='docker compose run --rm express bash dev-tools/seed-test-variant-data.sh'
alias mlint='docker compose run --rm client npm run lint'
alias mtest='docker compose run --rm client npm run test:unit:watch'
alias mtests='docker compose run --rm express npm run test:server'

# Git
alias gitbranchclean='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# Dirs
alias ..="cd .."
