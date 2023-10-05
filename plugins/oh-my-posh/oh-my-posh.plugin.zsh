function install-oh-my-posh()
{
    curl -s https://ohmyposh.dev/install.sh | bash -s

    if [ ! -d "$HOME/.poshthemes" ] 
    then
        mkdir $HOME/.poshthemes
        wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O $HOME/.poshthemes/themes.zip
        unzip $HOME/.poshthemes/themes.zip -d $HOME/.poshthemes
        chmod u+rw $HOME/.poshthemes/*.json
        rm $HOME/.poshthemes/themes.zip
    fi
    oh-my-posh font install Meslo
}

### Set Style
if [[ "$(command -v oh-my-posh)" ]]
then
    export CLICOLOR=1
    eval "$(oh-my-posh --init --shell zsh --config $WS_PLUGINS_PATH/oh-my-posh/easy-term-v1.omp.json)"
fi