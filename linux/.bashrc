. ~/.config/workspace/linux/.bashrc-base

### Set spelling correction
shopt -s cdspell

### Append to the history file (do not overwrite it)
shopt -s histappend

### Set fzf (command-line fuzzy finder)
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

### Set general environment settings
export CLICOLOR=1
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"

### Set Git prompt functions
. ~/.config/workspace/linux/git-prompt.sh

### Set Git completition
. ~/.config/workspace/linux/git-completion.bash
