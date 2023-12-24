### Add pyenv if exists 
if [ -d "$HOME/.pyenv" ]; then
    ### Set openssl for builds 
    if command -v brew &> /dev/null; then
        export LDFLAGS="-Wl,-rpath,$(brew --prefix openssl)/lib"
        export CPPFLAGS="-I$(brew --prefix openssl)/include"
        export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
    fi
    #setup python
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init - --no-rehash)"
fi