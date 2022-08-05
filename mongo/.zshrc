
#add mongofunction
. ~/.config/workspace/mongo/.functions
. ~/.config/workspace/mongo/mongo-functions.zsh     

#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:$PATH

_machine="Darwin";

[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"