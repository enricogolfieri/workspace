#!/bin/bash

alias sudo='sudo '

sudo apt update -y
sudo apt upgrade -y

#basics
sudo apt-get install -y make build-essential git wget curl libssl-dev systemctl

#download repository if not exists
if [ ! -d "$HOME/.workspace" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $HOME/.workspace
fi

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#write "source bashrc" if not exists
bashrcpath=$HOME/.workspace/pi/.bashrc
if ! grep -qF "source $bashrcpath" "$HOME/.bashrc"; then
    # Append the source command to ~/.bashrc
    echo "source $bashrcpath" >> "$HOME/.bashrc"
    echo "Added source command to ~/.bashrc"
else
    echo "source command already exists in ~/.bashrc"
fi

