#load apt-get specific functions 
. ~/.config/workspace/linux/setup.sh

#load aliases
. ~/.config/workspace/bash/.bash_aliases

#load utility functions (no apt-get specific)
. ~/.config/workspace/.functions

#load environment settings
. ~/.config/workspace/bash/.profile

### Set Git prompt functions
. ~/.config/workspace/bash/git-prompt.sh

### Set Git completition
. ~/.config/workspace/bash/git-completion.sh

### Add cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ]
then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

### Add pyenv if exists 
if [ -d "$HOME/.pyenv/bin" ]
then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
