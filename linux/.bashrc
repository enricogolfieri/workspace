. ~/.config/workspace/linux/.bashrc-base

### Set spelling correction
shopt -s cdspell

### Append to the history file (do not overwrite it)
shopt -s histappend

### Set fzf (command-line fuzzy finder)
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

### Set general environment settings
export CLICOLOR=1
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"

### Set Git prompt functions
. ~/.config/workspace/linux/git-prompt.sh

### Set Git completition
. ~/.config/workspace/linux/git-completion.bash

function workspace-setup(){

    if [ "$EUID" -ne 0 ]
    then echo "Please run with sudo"
    exit
    fi

    #Install oh-my-posh 
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    chmod +x /usr/local/bin/oh-my-posh

    mkdir ~/.poshthemes
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
    unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
    chmod u+rw ~/.poshthemes/*.json
    rm ~/.poshthemes/themes.zip

    #install meslo font 
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

    sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
    sudo mv PowerlineSymbols.otf /usr/share/fonts/

    #Install build tools 
    apt-get update 
    apt-get install ninja-build 
    apt-get install cmake 
    apt-get install build-essential

    echo "Done!"
}