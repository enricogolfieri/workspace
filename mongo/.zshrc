
#add mongofunction
. ~/.config/workspace/mongo/.common
. ~/.config/workspace/mongo/mongo-functions.zsh     

_machine="Darwin";

[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"