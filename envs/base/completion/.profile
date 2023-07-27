#bash
[[  -n $_is_bash ]] && . $wsbase_path/completion/git-prompt.sh && . $wsbase_path/completion/git-completion.sh && PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#zsh
if [ -n $_is_zsh ]; then
    autoload -U compinit promptinit 2>&1

    promptinit
    prompt pure &>/dev/null

    compinit
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
    fpath=(/usr/local/share/zsh-completions $fpath) 
fi