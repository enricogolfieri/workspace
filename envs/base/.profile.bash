#for testing aliases good to have a helper to load aliases only
base-load-aliases()
{
. $wsbase_path/.config-workspace

. $wsbase_path/toolchain/.aliases

. $wsbase_path/oh-my-posh/.aliases

. $wsbase_path/containers/.aliases
}

_is_bash=1
base-load-aliases

## Load envs module
. $HOME/.config/workspace/envs/base/toolchain/.profile
## Load oh-my-posh module
. $HOME/.config/workspace/envs/base/oh-my-posh/.profile
## Load imaginary
. $HOME/.config/workspace/envs/base/imaginary/.profile

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend

