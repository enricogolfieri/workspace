PATH="/usr/bin:usr/bin/env:/bin:/usr/local/bin"
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
    mongo-setup-repos
}

# Not needed since we are using /opt/mongodbtoolchain
function _install_pyenv(){
    echo "_install_pyenv not implemented for mongovm" 
}

