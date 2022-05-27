
#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:${PATH}\


#!/usr/bin/env bash
_machine=;
if [ "$(uname)" == "Darwin" ]; then
    #add mongofunction
    . ~/.config/workspace/mongo/mongo-functions-mac.sh      
    _machine="Darwin";
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    #add mongofunction
    . ~/.config/workspace/mongo/mongo-functions-lnx.sh
    _machine="Linux";
fi

echo "mongo environment activated for $_machine"
