
WS_PATH=$HOME/.config/workspace
WS_PLUGINS_PATH=$WS_PATH/plugins
function load()
{
    ANTIGEN_LOG=/tmp/antigen.log
    source ~/antigen.zsh
    # Load the oh-my-zsh's library.
    antigen use oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh).
    antigen bundle heroku
    antigen bundle fzf
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-history-substring-search
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle hschne/fzf-git

    # Syntax highlighting bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting

    # Load custom bundles.
    antigen bundle $WS_PLUGINS_PATH/venv
    antigen bundle $WS_PLUGINS_PATH/remote
    antigen bundle $WS_PLUGINS_PATH/utils
    antigen bundle $WS_PLUGINS_PATH/containers

    #theme
    antigen theme https://github.com/romkatv/powerlevel10k.git
    antigen bundle $WS_PLUGINS_PATH/p10k

    # Load mongo
    antigen bundle enricogolfieri/workspace-mongo --branch=main

    # Tell Antigen that you're done.
    antigen apply

    #Always activate mongo environment
    mongo-dev-activate
    mongo-vm-activate

    #Set-up history
    HISTFILE=~/.zsh_history
    HISTSIZE=100000
    SAVEHIST=10000
    setopt SHARE_HISTORY
}

function load-w-trace()
{
    zmodload zsh/zprof  
    load
    zprof
}

load
