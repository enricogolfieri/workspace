PATH="/usr/bin:usr/bin/env:/bin"
### Load environment aliases
. $HOME/.config/workspace/envs/.aliases

### Activate base environment
activate-base-bash

### Always enable mongo-env
activate-mongo

function ws-setup-mongovm()
{
    ws-setup
    mongo-setup-tools
    mongo-setup-toolchain
}

# Not needed since we are using /opt/mongodbtoolchain
function _install_pyenv(){
    echo "_install_pyenv not implemented for mongovm" 
}

### Set general environment settings
export LC_ALL="C"
if [ -d /opt/go ]; then
    export PATH=/opt/go/bin:$PATH
    export GOROOT=/opt/go
fi

export PATH=$HOME/cli_bin:${PATH}

# JIRA Username
export JIRA_USERNAME=enrico.golfieri@mongodb.com

# pipx config
export PATH="/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/cli_bin:/opt/node/bin:/home/ubuntu/.local/bin:${PATH}"

# MongoDB Toolchain
export PATH="/opt/mongodbtoolchain/v4/bin:${PATH}"

