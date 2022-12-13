#add mongofunction
. $HOME/.config/workspace/repoenvs/mongo/.aliases

export NINJA_STATUS='[%f/%t (%p) %es] '

### Set MongoDB's development settings
ulimit -v 65011712
ulimit -n 64000
ulimit -u 64000
ulimit -l 1024
# ulimit wt
ulimit -c unlimited

#add scripts
export PATH=~/.config/workspace/repoenvs/mongo/bashscripts:$PATH

[[ $- == *i* ]] || return

echo "mongo environment activated for $_os"