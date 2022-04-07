PATH="/opt/homebrew/bin:$PATH"

### Set personal Linux settings
. ~/.config/workspace/linux/bashrc_lnx

### Set aliases
unalias ls
alias python3=python #for compiling mongo, this takes for granted miniconda is installed with python3.9

### Set Homebrew bash completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh
