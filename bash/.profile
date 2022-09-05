### Add cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ]
then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

### fzf 
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

### Set Style
export CLICOLOR=1
eval "$(oh-my-posh --init --shell bash --config ~/.config/workspace/bash/oh-my-posh-v3.omp.json)"

### Do not put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

### Silence zsh message as default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

### Append to the history file (do not overwrite it)
shopt -s histappend
