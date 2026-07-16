# Directory shortcuts
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias fsfs="cd ~/Code/Frameshift"
alias vsvs="cd ~/Code/Vue"

# Docker
alias dup="docker compose up"
alias ddown="docker compose down"
alias dps="docker compose ps"
alias dub="docker compose up -d --build"
alias dstp="docker compose stop"
alias drm="docker compose rm"
alias dsall="docker stop $(docker ps -aq)"
alias drmi="docker rmi $(docker images -q) -f"
alias drmall="docker rm $(docker ps -a -q)"
alias dprune="docker system prune -a"
alias drs="docker restart $1"

# Mosaic specific
alias mseed="docker compose run --rm express bash dev-tools/seed-projects.sh"
alias mseedv="docker compose run --rm express bash dev-tools/seed-test-variant-data.sh"
alias mlint="docker compose run --rm client npm run lint"
alias mtest="docker compose run --rm client npm run test:unit:watch"
alias mtests="docker compose run --rm express npm run test:server"

# Git
alias gitbranchclean='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'
alias lg="lazygit"

# Eza
alias l="eza -l --icons --git -a"
alias ll="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# Dirs
alias ..="cd .."

# Get public ip address
alias getpubip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tee /dev/tty | pbcopy"

# Lorem ipsum generator
lorem() {
    local n=${1:-3}
    local words=(lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip ex ea commodo consequat duis aute irure in reprehenderit voluptate velit esse cillum eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt culpa qui officia deserunt mollit anim id est laborum)
    local nw=${#words[@]}
    local out=""
    for ((s=0; s<n; s++)); do
        local len=$((RANDOM % 8 + 8)) sentence=""
        for ((w=0; w<len; w++)); do
            sentence+="${words[RANDOM % nw + 1]} "
        done
        sentence="${sentence% }"
        out+="${(C)sentence[1]}${sentence[2,-1]}. "
    done
    printf '%s\n' "${out% }" | pbcopy
}
