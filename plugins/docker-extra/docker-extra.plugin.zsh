function docker-kill()
{
    ps axf | grep docker | grep -v grep | awk '{print "kill -9 " $1}' | sudo sh
}

function docker-fix-permission-denied()
{
    sudo chmod 666 /var/run/docker.sock
}

function docker-mv-to-folder()
{
    local _folder=$1
    #ask if sure to move
    [[ -z $_folder ]] && echo "No folder specified" && return 0;
    read -p "Are you sure you want to move dockeri installation? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
    echo "Moving docker installation to $_folder ..."
    mkdir -p $_folder
    #move
    sudo service docker stop
    sudo mv /var/lib/docker $_folder
    sudo ln -s $_folder /var/lib/docker
    sudo service docker start
}

#builds and connects to docker image linking the current directory
function docker-build()
{
    docker build -t $1 - < $(pwd)/Dockerfile && \
    docker run -it --rm -v $(pwd):/root/$1 $@ $1
}

#builds gpu and connects to docker image linking the current directory
function docker-build-gpu()
{
    docker build -t $1 - < $(pwd)/Dockerfile && \
    docker run -it --gpus all -v $(pwd):/root/$1 $@ $1 
}

#checks if docker is correctly installed
function docker-check()
{
    curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > /tmp/check-config.sh
    bash /tmp/check-config.sh
}

#docker-setup invidia
function docker-setup-nvidia()
{
    sudo rm -rf /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo rm -rf /etc/apt/sources.list.d/nvidia-docker.list
    sudo rm -rf /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
    sudo nvidia-ctk runtime configure --runtime=docker
    sudo systemctl restart docker
    sudo reboot
}

function docker-setup-nvidia()
{
    sudo rm -rf /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo rm -rf /etc/apt/sources.list.d/nvidia-docker.list
    sudo rm -rf /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
    sudo nvidia-ctk runtime configure --runtime=docker
    sudo systemctl restart docker
    sudo reboot
}
alias dc='docker-compose'
alias docker-start='sudo systemctl start docker'
alias docker-restart='sudo systemctl restart docker'
alias docker-ls='docker container ls -a'
alias docker-im='docker images'