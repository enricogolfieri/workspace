#Utility to load all modules

# Load all aliases 
. $HOME/.config/workspace/base/.aliases

## Load git module 
. $HOME/.config/workspace/base/git/.profile.bash
## Load envs module
. $HOME/.config/workspace/base/envs/.profile
## Load oh-my-posh module
. $HOME/.config/workspace/base/oh-my-posh/.profile.bash
## Load tools module
. $HOME/.config/workspace/base/tools/.profile
## Load fzf module
. $HOME/.config/workspace/base/fzf/.profile.bash

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

