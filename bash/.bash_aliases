### Set aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias rm='rm -i'
alias grep='grep --color=always'
alias more='more --RAW-CONTROL-CHARS --chop-long-lines'
alias less='less --RAW-CONTROL-CHARS --chop-long-lines --IGNORE-CASE'
alias v='nvim'
alias osinfo='lsb_release -a'

function nanorc {
    nano ~/.bashrc
}