alias sudo='sudo '

function _install_pyenv()
{    
    #install pyenv
    [ "$(command -v pyenv)" ] && echo "[install_pyenv] Pyenv already installed" && return

    sudo apt-get install zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    if [ ! -d "$HOME/.pyenv" ] 
    then
        curl https://pyenv.run | bash
    fi

    #setup python
    export PYENV_ROOT="$HOME/.pyenv"
    export LDFLAGS="-Wl,-rpath,$(brew --prefix openssl)/lib"
    export CPPFLAGS="-I$(brew --prefix openssl)/include"
    export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    #install latest python version
    version=3.13.3
    pyenv install $version
    pyenv global $version
}


#some basics for linux 
sudo apt-get update
sudo apt-get install -y build-essential curl git llvm make libssl-dev

#install and load brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#basics
brew install git gh cmake ninja ccache openssl readline xz zlib sqlite3

#download repository if not exists
if [ ! -d "$WS_PATH" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $WS_PATH
fi

#python
_install_pyenv

brew install ssh 

#fzf 
brew install fzf bat fd ripgrep
echo -e "yes\nyes\nno" | $HOMEBREW_PREFIX/opt/fzf/install


#utils 
brew install zlib wget curl xclip htop ncdu bpytop tmux nano

#antigen
brew install antigen

#install zsh and set as default
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)

#write "source zshrc" if not exists
zsrchpath=$HOME/.workspace/home/.zshrc
if ! grep -qF "source $zsrchpath" "$HOME/.zshrc"; then
    # Append the source command to ~/.zshrc
    echo "source $zsrchpath" >> "$HOME/.zshrc"
    echo "Added source command to ~/.zshrc"
else
    echo "source command already exists in ~/.zshrc"
fi

#write .zshenv
profilepath=$HOME/.workspace/home/.zshenv
if ! grep -qF "source $profilepath" "$HOME/.zshenv"; then
    # Append the source command to ~/.zshrc
    echo "source $profilepath" >> "$HOME/.zshenv"
    echo "Added source command to ~/.zshenv"
else
    echo "source command already exists in ~/.zshenv"
fi

#run zsh..
zsh




