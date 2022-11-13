### Set personal Linux settings
. ~/.config/workspace/linux/.bashrc

## Add mongodb environment
. ~/.config/workspace/mongo/.bashrc

### Set general environment settings
export PATH=~/bin:${PATH}
#export PS1='\[\e[0;31m\][\u@devel-ws:\[\e[0;33m\]\w\[\e[0;31m\]]\[\e[0;35m\]$(__git_ps1 "(%s)")\[\e[0;31m\]\$\[\e[0m\] '


### Set MongoDB's development settings
export LC_ALL='C'
ulimit -v 65011712
ulimit -n 64000
ulimit -u 64000
ulimit -l 1024
ulimit -c unlimited

### Set general environment settings
export PATH=~/bin:${PATH}
export PATH=~/util:${PATH}
export PATH=~/bat/target/release:${PATH}

export PATH=~/.local/bin:~/devel/bin:/opt/mongodbtoolchain/v4/bin:/opt/nodejs/node-v8.11.3-linux-x64/bin:${PATH}
export NINJA_STATUS='[%f/%t (%p) %es] '