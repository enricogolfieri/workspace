
### HomeBrew
PATH="/opt/homebrew/bin:$PATH"

### Set Homebrew bash completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

### oh my posh
eval "$(oh-my-posh --init --shell zsh --config ~/.config/workspace/linux/oh-my-posh-v2.omp.json)"

### fuzzy finder 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

