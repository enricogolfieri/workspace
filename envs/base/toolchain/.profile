### Add cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ]
then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

### Add pyenv if exists 
if [ -d "$HOME/.pyenv/" ]
then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

### Add conda if it exists
if [ -d "$HOME/miniconda/bin" ]
then
    export PATH="$HOME/miniconda/bin:$PATH"
fi

### Add nvm (I think this is not needed because nvm installation already adds it to .bashrc)
if [[ -n "$_is_macos" ]]; then
    export NVM_DIR="$HOME/.nvm"
    source $(brew --prefix nvm)/nvm.sh
else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
