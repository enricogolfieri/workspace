
#Utility to load all modules
LOAD_OH-MY-POSH=1;
LOAD_TOOLS=1;
LOAD_FZF=1;
LOAD_GIT=1;
LOAD_ENVS=1;

## Load git module 
[[ $LOAD_GIT -eq 1 ]] && . $HOME/.config/workspace/base/git/.profile.zsh
## Load envs module
[[ $LOAD_ENVS -eq 1 ]] && . $HOME/.config/workspace/base/envs/.profile
## Load oh-my-posh module
[[ $LOAD_OH-MY-POSH -eq 1 ]] && . $HOME/.config/workspace/base/oh-my-posh/.profile.zsh
## Load tools module
[[ $LOAD_TOOLS -eq 1 ]] && . $HOME/.config/workspace/base/tools/.profile
## Load fzf module
[[ $LOAD_FZF -eq 1 ]] && . $HOME/.config/workspace/base/fzf/.profile.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
