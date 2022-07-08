
#add mongofunction
. ~/.config/workspace/mongo/mongo-functions.zsh     
. ~/.config/workspace/mongo/.common

alias python3=python 

_machine="Darwin";

[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"