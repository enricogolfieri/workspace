. ~/.config/workspace/linux/.bashrc-base

### Set spelling correction
shopt -s cdspell

### Set general environment settings
export CLICOLOR=1
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"

### Set Git prompt functions
. ~/.config/workspace/linux/git-prompt.sh

### Set Git completition
. ~/.config/workspace/linux/git-completion.bash
