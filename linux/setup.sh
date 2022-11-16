. ~/.config/workspace/.functions


function _install_cargo()
{
    if ! [ -x "$(command -v cargo)" ]; then
        sudo apt install cargo -y 
    fi
}

function _install_fd_find()
{
    # Install fd find
    if ! [ -x "$(command -v fd)" ]; then
        if [[ $(lsb_release -rs) == "18.04" ]]; then
            _install_cargo 
            git clone git@github.com:sharkdp/fd.git /tmp/fd
            cd /tmp/fd
            cargo install --path . 
            cd - 
            rm -rf /tmp/fd
        else
            sudo apt install -y fd-find
        fi
    fi  
}

function _install_bat()
{
    # Install bat
    if ! [ -x "$(command -v bat)" ]; then
        if [[ $(lsb_release -rs) == "18.04" ]]; then
            _install_cargo 
            git clone git@github.com:sharkdp/bat.git /tmp/bat
            cd /tmp/bat
            cargo install --path . 
            cd - 
            rm -rf /tmp/bat
        else
            sudo apt install -y bat
        fi
    fi
}


function workspace-setup(){
    echo "installin workspace dependencies..."

    #Install oh-my-posh 
    if [ ! -d "/usr/local/bin/oh-my-posh" ] 
    then
        wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
        chmod +x /usr/local/bin/oh-my-posh
    fi

    if [ ! -d "$HOME/.poshthemes" ] 
    then
        mkdir ~/.poshthemes
        wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
        unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
        chmod u+rw ~/.poshthemes/*.json
        rm ~/.poshthemes/themes.zip
    fi

    #install meslo font 
    if [[ ! -f "/usr/share/fonts/PowerlineSymbols.otf " ]] 
    then  
        wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
        wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

        sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
        sudo mv PowerlineSymbols.otf /usr/share/fonts/
    fi

    _install_bat
    _install_fd_find

    #install fzf
    if [ ! -d "$HOME/.fzf" ] 
    then
       git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    fi

    #install gh 
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh

    #install nvm 
    if ! [ -x "$(command -v nvm)" ]; then
        ccurl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o /tmp/install_nvm.sh
        /tmp/install_nvm.sh
        rm -rf /tmp/install_nvm.sh
        #reload
        source ~/.bash_profile
    fi

    #install nodejs
    if ! [ -x "$(command -v node)" ]; then
        nvm install --lts
    fi

    echo "Done!"
}




