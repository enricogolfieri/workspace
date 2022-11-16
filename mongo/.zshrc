#add mongofunction
. ~/.config/workspace/mongo/.functions
. ~/.config/workspace/base/env.sh

if  [[ "$_os" = "Darwin" ]]
; then
    . ~/.config/workspace/mongo/.mongo-functions-macos   
elif  [[ "$_os" = "Linux" ]]
; then
    . ~/.config/workspace/mongo/.mongo-functions-lnx
fi

#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:$PATH

[[ $- == *i* ]] || return

echo "mongo environment activated for $_os"