

_is_zsh=1

## Load envs module
. $HOME/.config/workspace/envs/base/toolchain/.profile
## Load oh-my-posh module
[[ -n $NO_LOAD_OMP ]] || . $HOME/.config/workspace/envs/base/oh-my-posh/.profile.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
