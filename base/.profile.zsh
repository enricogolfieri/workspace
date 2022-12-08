
#Utility to load all modules

# Load all aliases 
. $HOME/.config/workspace/base/.aliases

## Load git module 
. $HOME/.config/workspace/base/git/.profile.zsh
## Load envs module
. $HOME/.config/workspace/base/envs/.profile
## Load oh-my-posh module
. $HOME/.config/workspace/base/oh-my-posh/.profile.zsh
## Load tools module
. $HOME/.config/workspace/base/tools/.profile
## Load fzf module
. $HOME/.config/workspace/base/fzf/.profile.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
