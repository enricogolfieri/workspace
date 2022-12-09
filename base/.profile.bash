#Utility to load all modules
LOAD_OMP=1;
LOAD_TOOLS=1;
LOAD_FZF=1;
LOAD_GIT=1;
LOAD_ENVS=1;

## Load git module 
[[ $LOAD_GIT -eq 1 ]] && . $HOME/.config/workspace/base/git/.profile.bash
## Load envs module
[[ $LOAD_ENVS -eq 1 ]] && . $HOME/.config/workspace/base/envs/.profile
## Load oh-my-posh module
[[ $LOAD_OMP -eq 1 ]] && . $HOME/.config/workspace/base/oh-my-posh/.profile.bash
## Load tools module
[[ $LOAD_TOOLS -eq 1 ]] && . $HOME/.config/workspace/base/tools/.profile
## Load fzf module
[[ $LOAD_FZF -eq 1 ]] && . $HOME/.config/workspace/base/fzf/.profile.bash

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

