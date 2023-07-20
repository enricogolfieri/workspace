

. $wsbase_path/.config-workspace

. $wsbase_path/toolchain/.aliases

. $wsbase_path/oh-my-posh/.aliases

. $wsbase_path/containers/.aliases

_is_bash=1

## Load envs module
. $HOME/.config/workspace/envs/base/toolchain/.profile
## Load oh-my-posh module
. $HOME/.config/workspace/envs/base/oh-my-posh/.profile.bash

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

