PATH="/opt/homebrew/bin:$PATH"


eval "$(oh-my-posh --init --shell zsh --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"

##fuzzy finder 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Set Git completition
. ~/.config/workspace/macos/git-completion.zsh

### Set aliases
alias python3=python #for compiling mongo, this takes for granted miniconda is installed with python3.9
alias cdws='cd ~/.config/workspace'

### Set Homebrew bash completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh
