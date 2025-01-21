[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Fuzzy completion for Bash history
bind '"\C-r": "$(history | fzf +s --tac | sed -E \"s/ *[0-9]+ *\*? *//\")\n"'

function install-pihole() {
    curl -sSL https://install.pi-hole.net | bash
}

function install-wireguard() {
    wget https://git.io/wireguard -O wireguard-install.sh && bash wireguard-install.sh
}