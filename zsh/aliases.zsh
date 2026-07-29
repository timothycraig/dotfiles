# Directory shortcuts
alias dotfiles="nvim ~/dotfiles"
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias fsfs="cd ~/Code/Frameshift"

# Docker
alias dup="docker compose up"
alias ddown="docker compose down"
alias dstp="docker compose stop"

# Mosaic specific
alias mlint="docker compose exec -T client npm run lint"
alias mtest="docker compose exec -T client npm run test:unit:watch"
alias mtests="docker compose exec -T express npm run test"

# Git
# Force-delete local branches whose upstream is gone. The `grep -v "^\*"` skips
# the checked-out branch: `git branch -vv` prefixes it with `* `, which would
# otherwise reach `git branch -D` as a literal `*`.
alias gitbranchclean='git fetch --prune && git branch -vv | grep ": gone]" | grep -v "^\*" | awk "{print \$1}" | xargs -r git branch -D'
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
