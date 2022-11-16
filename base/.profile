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

### Add conda
export PATH="$HOME/miniconda/bin:$PATH"

