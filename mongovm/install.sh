WS_PATH=$HOME/.workspace

alias sudo='sudo '

sudo apt-get update -y
sudo apt-get upgrade -y

#basics
sudo apt-get install -y make build-essential git wget curl libssl-dev

#download repository if not exists
if [ ! -d "$WS_PATH" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $WS_PATH
fi

#install zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)

#install antigen
curl -L git.io/antigen > ~/antigen.zsh

#install rust 
sudo apt install -y snapd gh xclip htop ncdu bpytop tmux nano xclip ripgrep

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --completion --key-bindings --no-update-rc
sudo apt install bat fd-find 

#cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-compose

# run connect.sh
zsh $WS_PATH/mongovm/connect.sh

#run zsh..
zsh
