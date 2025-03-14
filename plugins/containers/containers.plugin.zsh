
function runpi()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up pi -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec pi /bin/bash  # Open an interactive shell
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

function build-mongovm()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up -d dev-mongo
}

function run-mongovm()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec dev-mongo /bin/bash
}

function runhome()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up home -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec home /bin/bash  # Open an interactive shell
}

function runhomeserver()
{
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml up home-server -d 
    docker-compose -f $WS_PLUGINS_PATH/containers/docker-compose.ubuntu.yml exec home-server /bin/bash  # Open an interactive shell
}
