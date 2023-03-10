

_is_zsh=1

## Load envs module
. $wsbase_path/toolchain/.profile
## Load oh-my-posh module
[[ -n $NO_LOAD_OMP ]] || . $wsbase_path/oh-my-posh/.profile.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
