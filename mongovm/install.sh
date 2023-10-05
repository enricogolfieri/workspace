alias sudo='sudo '

sudo apt-get update -y
sudo apt-get upgrade -y

#basics
sudo apt-get install -y make build-essential git wget curl libssl-dev

#download repository if not exists
if [ ! -d "$HOME/.workspace" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $HOME/.workspace
fi

#install zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)

#install antigen
curl -L git.io/antigen > ~/antigen.zsh

#install rust 
sudo apt install -y snapd gh xclip htop ncdu bpytop tmux nano xclip ripgrep

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
sudo apt install bat fd-find 

#cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-compose

#write "source zshrc" if not exists
zsrchpath=$HOME/.workspace/mongovm/.zshrc
if ! grep -qF "source $zsrchpath" "$HOME/.zshrc"; then
    # Append the source command to ~/.zshrc
    echo "source $zsrchpath" >> "$HOME/.zshrc"
    echo "Added source command to ~/.zshrc"
else
    echo "source command already exists in ~/.zshrc"
fi

#write .zshenv
profilepath=$HOME/.workspace/mongovm/.zshenv
if ! grep -qF "source $profilepath" "$HOME/.zshenv"; then
    # Append the source command to ~/.zshrc
    echo "source $profilepath" >> "$HOME/.zshenv"
    echo "Added source command to ~/.zshenv"
else
    echo "source command already exists in ~/.zshenv"
fi

#run zsh..
zsh
