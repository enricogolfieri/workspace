#!/usr/bin/env bash
# mongovm installer
# Phase 1: check what's already installed
# Phase 2: print plan
# Phase 3: install missing modules, reprinting the table after each one

WS_PATH=$HOME/.workspace
alias sudo='sudo '

# ---------------------------------------------------------------------------
# Module registry
# ---------------------------------------------------------------------------
# Each module has:
#   - a name (used as key)
#   - a check_<name> function that returns 0 if already installed
#   - an install_<name> function that performs the install
# After phase 1, MODULE_STATUS[<name>] is one of: "installed" | "pending"

MODULES=(workspace_repo apt_basics zsh antigen rust fzf docker pyenv shell_config gitconfig)
declare -A MODULE_STATUS

# ---- checks ---------------------------------------------------------------
check_workspace_repo() { [ -d "$WS_PATH" ]; }
check_apt_basics()     {
    local pkgs=(make build-essential git wget curl libssl-dev snapd gh xclip htop ncdu bpytop tmux nano ripgrep)
    for p in "${pkgs[@]}"; do
        dpkg -s "$p" >/dev/null 2>&1 || return 1
    done
}
check_zsh()       { command -v zsh >/dev/null 2>&1; }
check_antigen()   { [ -f "$HOME/antigen.zsh" ]; }
check_rust()      { [ -x "$HOME/.cargo/bin/rustc" ] && [ -x "$HOME/.cargo/bin/cargo" ]; }
check_fzf()       { command -v fzf >/dev/null 2>&1 || [ -d "$HOME/.fzf" ]; }
check_docker()    { command -v docker >/dev/null 2>&1; }
check_pyenv()     { [ -d "$HOME/.pyenv" ]; }
check_shell_config() {
    grep -qF "source $WS_PATH/mongovm/.zshrc"  "$HOME/.zshrc"   2>/dev/null && \
    grep -qF "source $WS_PATH/mongovm/.zshenv" "$HOME/.zshenv"  2>/dev/null
}
check_gitconfig() {
    [ "$(readlink "$HOME/.gitconfig")" = "$WS_PATH/mongovm/gitconfig" ] && \
    [ "$(readlink "$HOME/.gitignore")" = "$WS_PATH/mongovm/gitignore" ]
}

# ---- helpers --------------------------------------------------------------
apt_install_missing() {
    local missing=()
    for pkg in "$@"; do
        dpkg -s "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
    done
    if [ ${#missing[@]} -gt 0 ]; then
        sudo apt-get install -y "${missing[@]}"
    fi
}

# ---- installers -----------------------------------------------------------
install_workspace_repo() {
    git clone https://github.com/enricogolfieri/workspace.git "$WS_PATH"
}
install_apt_basics() {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    apt_install_missing make build-essential git wget curl libssl-dev \
        snapd gh xclip htop ncdu bpytop tmux nano ripgrep
}
install_zsh() {
    sudo apt-get install -y zsh
    sudo chsh -s "$(which zsh)" "$(whoami)"
}
install_antigen() {
    curl -L git.io/antigen > ~/antigen.zsh
}
install_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck disable=SC1091
    source "$HOME/.cargo/env"
}
install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --completion --key-bindings --no-update-rc
    apt_install_missing bat fd-find
}
install_docker() {
    apt_install_missing docker-ce docker-ce-cli containerd.io docker-compose
}
install_pyenv() {
    # CPython build deps so `pyenv install <ver>` works later
    apt_install_missing libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev \
        libncursesw5-dev libffi-dev liblzma-dev tk-dev xz-utils
    curl -fsSL https://pyenv.run | bash
}
install_shell_config() {
    local zrc="$WS_PATH/mongovm/.zshrc"
    local zenv="$WS_PATH/mongovm/.zshenv"
    grep -qF "source $zrc"  "$HOME/.zshrc"  2>/dev/null || echo "source $zrc"  >> "$HOME/.zshrc"
    grep -qF "source $zenv" "$HOME/.zshenv" 2>/dev/null || echo "source $zenv" >> "$HOME/.zshenv"
}
install_gitconfig() {
    ln -sf "$WS_PATH/mongovm/gitconfig" "$HOME/.gitconfig"
    ln -sf "$WS_PATH/mongovm/gitignore" "$HOME/.gitignore"
}

# ---------------------------------------------------------------------------
# Table printing
# ---------------------------------------------------------------------------
print_table() {
    local title=$1
    echo
    echo "==== $title ===="
    printf "  %-18s %s\n" "MODULE" "STATUS"
    printf "  %-18s %s\n" "------" "------"
    for m in "${MODULES[@]}"; do
        printf "  %-18s %s\n" "$m" "${MODULE_STATUS[$m]}"
    done
    echo
}

# ---------------------------------------------------------------------------
# Phase 1: detect current state
# ---------------------------------------------------------------------------
for m in "${MODULES[@]}"; do
    if "check_$m"; then
        MODULE_STATUS[$m]="installed"
    else
        MODULE_STATUS[$m]="pending"
    fi
done
print_table "Phase 1: detected state"

# ---------------------------------------------------------------------------
# Phase 2: plan
# ---------------------------------------------------------------------------
pending=()
for m in "${MODULES[@]}"; do
    [ "${MODULE_STATUS[$m]}" = "pending" ] && pending+=("$m")
done

if [ ${#pending[@]} -eq 0 ]; then
    echo "Phase 2: nothing to install. Everything is up to date."
    exec zsh
fi

echo "Phase 2: will install the following modules: ${pending[*]}"

# ---------------------------------------------------------------------------
# Phase 3: install, re-printing the table after each module
# ---------------------------------------------------------------------------
for m in "${pending[@]}"; do
    echo
    echo ">>> Installing $m ..."
    if "install_$m"; then
        # Re-run the check to confirm
        if "check_$m"; then
            MODULE_STATUS[$m]="installed"
        else
            MODULE_STATUS[$m]="failed (post-check)"
        fi
    else
        MODULE_STATUS[$m]="failed"
    fi
    print_table "After installing $m"
done

# Finally drop into zsh
exec zsh
