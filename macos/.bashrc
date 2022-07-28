export NINJA_STATUS='[%f/%t (%p) %es] '

#load aliases
. ~/.config/workspace/linux/.bash_aliases

#load utility functions (no apt-get specific)
. ~/.config/workspace/linux/.functions

#load environment settings
. ~/.config/workspace/linux/.profile

### Set Git prompt functions
. ~/.config/workspace/linux/git-prompt.sh

### Set Git completition
. ~/.config/workspace/linux/git-completion.sh