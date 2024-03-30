alias sudo='sudo '
_os=""
case `uname` in
    Darwin)
        echo "Detected MacOS"
        _is_macos=1
    ;;
    Linux)
        echo "Detected Linux"
        _is_linux=1
    ;;
    *)
        echo "[ENV] Unsupported OS, impossible to setup"
        return 1            
    ;;
esac

function _install_nvm_nodejs()
{
    #install nvm 
    brew install nvm
    mkdir -p $HOME/.nvm    

    source $(brew --prefix nvm)/nvm.sh

    #install nodejs
    nvm install --lts
}

function _install_pyenv()
{
    #install pyenv
    [ "$(command -v pyenv)" ] && echo "[install_pyenv] Pyenv already installed" && return

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
    $version="$(pyenv install --list | grep -E '^\s+[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 1)"
    pyenv install $version
    pyenv global $version
}

function _install_vscode()
{
    if ! [ "$(command -v code)" ]; then
        if  [[ -n "$_is_linux" ]] ; then
            sudo snap install --classic code
        elif  [[ -n "$_is_macos" ]]; then
            brew install --cask visual-studio-code
        fi
    fi
}

function _install_docker()
{
    if ! [ "$(command -v docker)" ]; then
        if  [[ -n "$_is_linux" ]] ; then
            sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
        elif  [[ -n "$_is_macos" ]]; then
            brew install --cask docker 
        fi
    fi
}


#some basics for linux 
if [[ -n "$_is_linux" ]] ; then
    sudo apt-get update
    sudo apt-get install -y build-essential curl git llvm make libssl-dev
fi

#install and load brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[[ -d "/home/linuxbrew/" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[[ -d "/opt/homebrew/" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

#basics
brew install git gh cmake ninja ccache llvm openssl readline xz zlib sqlite3

#download repository if not exists
if [ ! -d "$HOME/.workspace" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $HOME/.workspace
fi

#python
_install_pyenv

brew install ssh 
brew install ssh-copy-id

#nodejs
_install_nvm_nodejs

#rust
brew install rust 

#fzf 
brew install fzf bat fd ripgrep
echo -e "yes\nyes\nno" | $HOMEBREW_PREFIX/opt/fzf/install

#docker
_install_docker
brew install docker-compose

#utils 
brew install zlib wget curl xclip htop ncdu bpytop tmux nano 

#antigen
brew install antigen

#vscode
_install_vscode

if [[ -n "$_is_linux" ]] ; then
   #install ssh server
    sudo apt-get install -y openssh-server
    sudo systemctl enable ssh
    sudo systemctl start ssh

    #install chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb
    sudo dpkg -i /tmp/chrome.deb
    rm -rf /tmp/chrome.deb

    #install zsh and set as default
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh) $(whoami)
fi

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




