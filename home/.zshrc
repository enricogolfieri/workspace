


WS_PATH=$HOME/.workspace
WS_PLUGINS_PATH=$WS_PATH/plugins
function load()
{
    [[ -d "/opt/homebrew/" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    [[ -d "/home/linuxbrew/" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    ANTIGEN_LOG=/tmp/antigen.log
    source $(brew --prefix)/share/antigen/antigen.zsh
    # Load the oh-my-zsh's library.
    antigen use oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh).
    antigen bundle gitfast
    antigen bundle heroku
    antigen bundle fzf
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-history-substring-search
    antigen bundle zsh-users/zsh-syntax-highlighting


    # Syntax highlighting bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting

    # Load custom bundles.
    antigen bundle $WS_PLUGINS_PATH/docker-extra
    antigen bundle $WS_PLUGINS_PATH/oh-my-posh
    antigen bundle $WS_PLUGINS_PATH/venv
    antigen bundle $WS_PLUGINS_PATH/remote
    antigen bundle $WS_PLUGINS_PATH/utils
    antigen bundle $WS_PLUGINS_PATH/fbrew
    antigen bundle $WS_PLUGINS_PATH/containers
    antigen bundle $WS_PLUGINS_PATH/pyenv

    # Load mongo
    antigen bundle enricogolfieri/workspace-mongo --branch=main

    # Tell Antigen that you're done.
    antigen apply
}

function load-w-trace()
{
    zmodload zsh/zprof  
    load
    zprof
}

load