### Set Style
[[ -n $NO_LOAD_OMP ]] && return 0;

_shell=;
[[ -n $_is_bash ]] && _shell="bash"
[[ -n $_is_zsh ]] && _shell="zsh"
#if [[ "$(command -v oh-my-posh)" ]]; then
    export CLICOLOR=1
    eval "$(oh-my-posh --init --shell $_shell --config $HOME/.config/workspace/envs/base/oh-my-posh/easy-term-v1.omp.json)"
#fi