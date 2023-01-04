### Set Style

if [ "$(command -v oh-my-posh)" ] 
then
    export CLICOLOR=1
    eval "$(oh-my-posh --init --shell bash --config $HOME/.config/workspace/envs/base/oh-my-posh/easy-term-v1.omp.json)"
fi
