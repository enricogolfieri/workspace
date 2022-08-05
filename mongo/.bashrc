#add mongofunction
. ~/.config/workspace/mongo/.functions
. ~/.config/workspace/mongo/mongo-functions.sh
_machine="Linux";


#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:$PATH


[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"