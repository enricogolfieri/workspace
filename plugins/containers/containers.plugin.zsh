function runlinda()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up linda -d
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec linda /bin/bash  # Open an interactive shell
}

function runchiara()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up chiara -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec chiara /bin/bash  # Open an interactive shell

}

function runserena()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up serena -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml serena linda /bin/bash  # Open an interactive shell

}

alias run-ubuntu-18='runlinda'
alias run-ubuntu-20='runchiara'
alias run-ubuntu-22='runserena'