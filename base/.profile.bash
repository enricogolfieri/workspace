#Utility to load all modules

## Load envs module
. ~/.config/workspace/base/envs/.profile
## Load oh-my-posh module
. ~/.config/workspace/base/oh-my-posh/.profile.bash
## Load tools module
. ~/.config/workspace/base/tools/.profile
## Load fzf module
. ~/.config/workspace/base/fzf/.profile.bash
## Load git-completion module
. ~/.config/workspace/base/git-prompt/git-prompt.sh
## Load git-prompt module
. ~/.config/workspace/base/git-completion/git-completion.sh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

