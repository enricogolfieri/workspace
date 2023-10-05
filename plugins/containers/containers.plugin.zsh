function runlinda()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up linda
}

function runchiara()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up chiara
}

function runserena()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up serena
}

alias run-ubuntu-18='runlinda'
alias run-ubuntu-20='runchiara'
alias run-ubuntu-22='runserena'