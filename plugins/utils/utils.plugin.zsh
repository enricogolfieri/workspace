### Utils ####

cheat() { curl cheat.sh/"$1" ; }

function test-connection()
{
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

### Set aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias rm='rm -i'
alias grep='grep --color=always'
alias more='more --RAW-CONTROL-CHARS --chop-long-lines'
alias less='less --RAW-CONTROL-CHARS --chop-long-lines --IGNORE-CASE'

function ws-osinfo(){
    case `uname` in 
        Darwin)
            echo "OS: Mac OS"
            echo "Version: $(sw_vers -productVersion)"
            echo "Build: $(sw_vers -buildVersion)"
        ;;
        Linux)
            echo "OS: Linux"
            echo "Version: $(lsb_release -a)"
        ;;
        *)
            echo "OS: Unsupported"
        ;;
    esac
}

## system utilities #####
function ws-cleantmp()
{
    _daystoleave=10
    [[ ! -z "$1" ]] && _daystoleave=$1
    sudo find /tmp -type f -atime +$_daystoleave -delete
}

## Workspace functions #####
function ws-update() {
    cd $WS_PATH
    git pull
    cd -
}

function ws-code()
{
    code $WS_PATH
}

function ws-update()
{
    _cd=$(pwd)
    cd $WS_PATH
    git pull
    cd $_cd
}

function ws-test-env()
{
    echo "OS: `uname`"
    #Rust
    ( [ "$(command -v rustc)" ] && echo "Rustc: $(rustc --version)" ) || echo "Rustc: NOT FOUND";
    ( [ "$(command -v cargo)" ] && echo "Cargo: $(cargo --version)" ) || echo "Cargo: NOT FOUND";
    #Python
    ( [ "$(command -v python)" ] && echo "Python: $(python --version)" ) || echo "Python: NOT FOUND";
    ( [ "$(command -v python3)" ] && echo "Python3: $(python3 --version)" ) || echo "Python3: NOT FOUND";
    ( [ "$(command -v pip)" ] && echo "Pip: $(pip --version)" ) || echo "Pip: NOT FOUND";
    ( [ "$(command -v pip3)" ] && echo "Pip3: $(pip3 --version)" ) || echo "Pip3: NOT FOUND";
    ( [ "$(command -v pyenv)" ] && echo "Pyenv: $(pyenv --version)" ) || echo "Pyenv: NOT FOUND";
    #Javascript
    ( [ "$(command -v node)" ] && echo "Node: $(node --version)" ) || echo "Node: NOT FOUND";
    ( [ "$(command -v nvm)" ] && echo "Nvm: $(nvm --version)" ) || echo "Nvm: NOT FOUND";
    #Cpp
    ( [ "$(command -v gcc)" ] && echo "Gcc: $(which gcc)" ) || echo "Gcc: NOT FOUND";
    ( [ "$(command -v clang)" ] && echo "Clang: $(which clang)" ) || echo "Clang: NOT FOUND";
    ( [ "$(command -v ninja)" ] && echo "Ninja: $(ninja --version)" ) || echo "Ninja: NOT FOUND";
    ( [ "$(command -v ccache)" ] && echo "Ccache: $(which ccache)" ) || echo "Ccache: NOT FOUND";
    ( [ "$(command -v cmake)" ] && echo "CMake: $(cmake --version)" ) || echo "CMake: NOT FOUND";

    #Docker
    ( [ "$(command -v docker)" ] && echo "Docker: $(docker --version)" ) || echo "Docker: NOT FOUND";
    ( [ "$(command -v docker-compose)" ] && echo "Docker-compose: $(docker-compose --version)" ) || echo "Docker-compose: NOT FOUND";

    #Utils
    ( [ "$(command -v git)" ] && echo "Git: $(git --version)" ) || echo "Git: NOT FOUND";
    ( [ "$(command -v gh)" ] && echo "Github CLI: $(gh --version)" ) || echo "Github CLI: NOT FOUND";
    ( [ "$(command -v fzf)" ] && echo "Fzf: $(fzf --version)" ) || echo "Fzf: NOT FOUND";
    ( [ "$(command -v bat)" ] && echo "Bat: $(bat --version)" ) || echo "Bat: NOT FOUND";
    ( [ "$(command -v fd)" ] && echo "Fd: $(fd --version)" ) || echo "Fd: NOT FOUND";
}
