
WS_PATH=$HOME/.workspace
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

    # Nvm
    export NVM_DIR="$HOME/.nvm"
    export NVM_LAZY_LOAD=true
    export NVM_COMPLETION=true
    antigen bundle lukechilds/zsh-nvm

    # Syntax highlighting bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting

    # Load custom bundles.
    antigen bundle enricogolfieri/antigen-venv.git --branch=main
    antigen bundle $WS_PLUGINS_PATH/remote
    antigen bundle $WS_PLUGINS_PATH/utils
    antigen bundle $WS_PLUGINS_PATH/containers
    antigen bundle $WS_PLUGINS_PATH/pyenv

    #theme
    antigen theme https://github.com/romkatv/powerlevel10k.git
    antigen bundle enricogolfieri/p10k-config --branch=main

    # Load mongo
    antigen bundle enricogolfieri/workspace-mongo-ai-harness --branch=main
    antigen bundle enricogolfieri/workspace-mongo --branch=main

    # Tell Antigen that you're done.
    antigen apply

    #Always activate mongo environment
    mongo-enable

    #Set-up history
    HISTFILE=~/.zsh_history
    HISTSIZE=100000
    SAVEHIST=100000
    setopt SHARE_HISTORY
    unsetopt HIST_IGNORE_SPACE

   # For disagg
    CARGO_HOME="$HOME/.ds_toolchain/.cargo"
    RUSTUP_HOME="$HOME/.ds_toolchain/.rustup"
    PATH="$HOME/.ds_toolchain/coveralls/bin:$HOME/.ds_toolchain/yq/bin:$HOME/.ds_toolchain/jq/bin:$HOME/.ds_toolchain/buf/bin:$HOME/.ds_toolchain/helm/bin:$HOME/.ds_toolchain/minikube/bin:$HOME/.ds_toolchain/mongosh/bin:$HOME/.ds_toolchain/grpcurl/bin:$HOME/.ds_toolchain/sccache/bin:$HOME/.ds_toolchain/protoc/bin:$HOME/.ds_toolchain/just/bin:$HOME/.ds_toolchain/.cargo/bin:$PATH"
}

function load-w-trace()
{
    zmodload zsh/zprof  
    load
    zprof
}

load
