
## Load git module 
[[ -n $NO_LOAD_GIT ]] || . $HOME/.config/workspace/envs/base/git/.profile.bash
## Load envs module
[[ -n $NO_LOAD_TOOLCHAIN ]] ||  . $HOME/.config/workspace/envs/base/toolchain/.profile
## Load oh-my-posh module
[[ -n $NO_LOAD_OMP ]] || . $HOME/.config/workspace/envs/base/oh-my-posh/.profile.bash
## Load tools module
[[ -n $NO_LOAD_TOOLS ]] || . $HOME/.config/workspace/envs/base/tools/.profile
## Load fzf module
[[ -n $NO_LOAD_FZF ]] || . $HOME/.config/workspace/envs/base/fzf/.profile.bash
## Load docker module
[[ -n $NO_LOAD_DOCKER ]] || . $HOME/.config/workspace/envs/base/docker/.profile

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

