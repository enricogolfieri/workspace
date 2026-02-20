WS_PATH=$HOME/.workspace

alias sudo='sudo '

sudo apt-get update -y
sudo apt-get upgrade -y

#basics
sudo apt-get install -y make build-essential git wget curl libssl-dev
sudo apt install -y snapd gh xclip htop ncdu bpytop tmux nano xclip ripgrep

#download repository if not exists
if [ ! -d "$WS_PATH" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $WS_PATH
fi

#install zsh
if ! command -v zsh &> /dev/null
then
    echo "Installing Zsh..."
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh) $(whoami)
fi

#install antigen
if [ ! -f "$HOME/antigen.zsh" ]; then
    echo "Installing Antigen..."
    curl -L git.io/antigen > ~/antigen.zsh
else
    echo "Antigen already installed."
fi

#install rust 
if [ ! -f "$HOME/.cargo/bin/rustc" ] || [ ! -f "$HOME/.cargo/bin/cargo" ]; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
else
    echo "Rust already installed."
fi

#fzf
if ! command -v fzf &> /dev/null
then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --completion --key-bindings --no-update-rc
    sudo apt install bat fd-find 
fi


#install docker
if ! command -v docker &> /dev/null
then
    echo "Installing Docker..."
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo apt-get install -y docker-compose
fi

WS_PATH=$HOME/.workspace
# Use mongovm/.zshrc as the main zshrc
zsrchpath=$WS_PATH/mongovm/.zshrc
if ! grep -qF "source $zsrchpath" "$HOME/.zshrc"; then
    # Append the source command to ~/.zshrc
    echo "source $zsrchpath" >> "$HOME/.zshrc"
    echo "Added source command to ~/.zshrc"
else
    echo "source command already exists in ~/.zshrc"
fi
# Use mongovm/.zshenv as the main zshenv
profilepath=$WS_PATH/mongovm/.zshenv
if ! grep -qF "source $profilepath" "$HOME/.zshenv"; then
    # Append the source command to ~/.zshrc
    echo "source $profilepath" >> "$HOME/.zshenv"
    echo "Added source command to ~/.zshenv"
else
    echo "source command already exists in ~/.zshenv"
fi

# Use mongovm/.gitconfig as the main gitconfig
gitconfigpath=$WS_PATH/mongovm/gitconfig
ln -sf $gitconfigpath $HOME/.gitconfig
# Use mongovm/.gitignore as the main gitignore
gitignorepath=$WS_PATH/mongovm/gitignore
ln -sf $gitignorepath $HOME/.gitignore

#run zsh..
zsh
