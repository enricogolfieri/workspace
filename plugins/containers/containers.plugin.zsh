function runlinda()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up linda -d
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec linda /bin/bash  # Open an interactive shell
}

function runlinda-gpu()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up linda-gpu -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec linda-gpu /bin/bash  # Open an interactive shell
}


function runchiara()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up chiara -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec chiara /bin/bash  # Open an interactive shell
}

function runchiara-gpu()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up chiara-gpu -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec chiara-gpu /bin/bash  # Open an interactive shell
}

function runserena()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up serena -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec serena /bin/bash  # Open an interactive shell
}

function runserena-gpu()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up serena-gpu -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec serena-gpu /bin/bash  # Open an interactive shell
}

function runrasp()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up rasp -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec rasp /bin/bash  # Open an interactive shell
}

function runmaya()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up maya -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec maya /bin/bash  # Open an interactive shell
}

function runmaya-gpu()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up maya-gpu -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec maya-gpu /bin/bash  # Open an interactive shell
}

alias run-ubuntu-18='runlinda'
alias run-ubuntu-20='runchiara'
alias run-ubuntu-22='runserena'
alias run-rasp='runrasp'
alias run-maya='runmaya'