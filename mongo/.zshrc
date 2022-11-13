#add mongofunction
. ~/.config/workspace/mongo/.functions

_machine="Linux";

if [ "$(uname)" == "Darwin" ]; then
    _machine="Darwin";
    . ~/.config/workspace/mongo/.mongo-functions-macos   
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    _machine="Linux";
    . ~/.config/workspace/mongo/.mongo-functions-lnx
fi

#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:$PATH

[[ $- == *i* ]] || return

echo "mongo environment activated for $_machine"