

#for testing aliases good to have a helper to load aliases only
base-load-aliases()
{
. $wsbase_path/.config-workspace

. $wsbase_path/toolchain/.aliases

. $wsbase_path/oh-my-posh/.aliases

. $wsbase_path/containers/.aliases
}

_is_zsh=1
base-load-aliases

## Load toolchain module
. $wsbase_path/toolchain/.profile
## Load oh-my-posh module
. $wsbase_path/oh-my-posh/.profile
## Load imaginary
. $HOME/.config/workspace/envs/base/imaginary/.profile

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

autoload -U compinit promptinit 2>&1

promptinit
prompt pure &>/dev/null

compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath) 
