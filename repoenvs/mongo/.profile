#add mongofunction
. ~/.config/workspace/repoenvs/mongo/.aliases

export NINJA_STATUS='[%f/%t (%p) %es] '

#add scripts
export PATH=~/.config/workspace/repoenvs/mongo/bashscripts:$PATH

[[ $- == *i* ]] || return

echo "mongo environment activated for $_os"