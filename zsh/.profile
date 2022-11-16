
. ~/.config/workspace/base/.profile

### oh my posh
eval "$(oh-my-posh --init --shell zsh --config ~/.config/workspace/easy-term-v1.omp.json)"

### fuzzy finder 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

### Set Style
export CLICOLOR=1
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/easy-term-v1.omp.json)"

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth