### Set Style
    export CLICOLOR=1

if [ ! -d "/usr/local/bin/oh-my-posh" ] 
then
    eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/workspace/base/oh-my-posh/easy-term-v1.omp.json)"
fi