### Set spelling correction
shopt -s cdspell

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Append to the history file (do not overwrite it)
shopt -s histappend

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Set Git prompt functions
. ~/.config/workspace/linux/git-prompt.sh

### Set Git completition
. ~/.config/workspace/linux/git-completion.bash

### Set general environment settings
export CLICOLOR=1
#export PS1='\[\e[0;31m\][\u@\h:\[\e[0;33m\]\w\[\e[0;31m\]]\[\e[0;35m\]$(__git_ps1 "(%s)")\[\e[0;31m\]\$\[\e[0m\] '
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"
export EDITOR=emacs

### Set aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias rm='rm -i'
alias grep='grep --color=always'
alias more='more --RAW-CONTROL-CHARS --chop-long-lines'
alias less='less --RAW-CONTROL-CHARS --chop-long-lines --IGNORE-CASE'
alias emacs='emacs -nw'
alias e='emacs'

### Set fzf (command-line fuzzy finder)
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

export PATH=~/.config/workspace/mongo/devscripts:${PATH}