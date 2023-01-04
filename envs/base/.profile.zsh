

## Load git module 
[[ -n $NO_LOAD_GIT ]] || . $HOME/.config/workspace/envs/base/git/.profile.zsh
## Load envs module
[[ -n $NO_LOAD_TOOLCHAIN ]] || . $HOME/.config/workspace/envs/base/toolchain/.profile
## Load oh-my-posh module
[[ -n $NO_LOAD_OMP ]] || . $HOME/.config/workspace/envs/base/oh-my-posh/.profile.zsh
## Load tools module
[[ -n $NO_LOAD_TOOLS ]] || . $HOME/.config/workspace/envs/base/tools/.profile
## Load fzf module
[[ -n $NO_LOAD_FZF ]] || . $HOME/.config/workspace/envs/base/fzf/.profile.zsh

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
