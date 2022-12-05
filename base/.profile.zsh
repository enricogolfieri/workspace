
#Utility to load all modules

## Load envs module
. ~/.config/workspace/base/envs/.profile
## Load oh-my-posh module
. ~/.config/workspace/base/oh-my-posh/.profile.zsh
## Load tools module
. ~/.config/workspace/base/tools/.profile
## Load fzf module
. ~/.config/workspace/base/fzf/.profile.zsh
## Load git-prompt module
. ~/.config/workspace/base/git-completion/git-completion.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
