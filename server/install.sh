alias sudo='sudo '
WS_PATH=$HOME/.workspace

function _install_npm()
{
    #install npm 
    sudo apt-get install -y npm
    npm install -g npm

    #install npx 
    npm install -g npx
}

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
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    #install latest python version
    version=3.11
    pyenv install $version
    pyenv global $version
}

sudo apt-get update -y
sudo apt-get upgrade -y

#basics
sudo apt-get install -y make build-essential git wget curl libssl-dev

#download repository if not exists
if [ ! -d "$WS_PATH" ] 
then
    git clone https://github.com/enricogolfieri/workspace.git $WS_PATH
fi

#install zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)

#install antigen
curl -L git.io/antigen > ~/antigen.zsh

#install npm
_install_npm

#install pyenv
_install_pyenv

#install docker & docker-compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
sudo apt-get install -y docker-compose

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
sudo apt install bat fd-find 

#install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-compose

#write "source zshrc" if not exists
zsrchpath=$WS_PATH/server/.zshrc
if ! grep -qF "source $zsrchpath" "$HOME/.zshrc"; then
    # Append the source command to ~/.zshrc
    echo "source $zsrchpath" >> "$HOME/.zshrc"
    echo "Added source command to ~/.zshrc"
else
    echo "source command already exists in ~/.zshrc"
fi

#install ssh server
sudo apt-get install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

#install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

#write .zshenv
profilepath=$WS_PATH/server/.zshenv
if ! grep -qF "source $profilepath" "$HOME/.zshenv"; then
    # Append the source command to ~/.zshrc
    echo "source $profilepath" >> "$HOME/.zshenv"
    echo "Added source command to ~/.zshenv"
else
    echo "source command already exists in ~/.zshenv"
fi

#run zsh..
zsh
