#add mongofunction
. ~/.config/workspace/mongo/.common
. ~/.config/workspace/mongo/mongo-functions.sh
_machine="Linux";

[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"