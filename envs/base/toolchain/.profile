load_brew
### Add cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ]
then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

### Add pyenv if exists 
if [ -d "$HOME/.pyenv" ]; then
    ### Set openssl for builds 
    export LDFLAGS="-Wl,-rpath,$(brew --prefix openssl)/lib"
    export CPPFLAGS="-I$(brew --prefix openssl)/include"
    export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
    #setup python
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

### Add nvm (I think this is not needed because nvm installation already adds it to .bashrc)
if [ -d $HOME/.nvm ]; then
    source $(brew --prefix nvm)/nvm.sh
fi

### git 
[[  -n $_is_bash ]] && . $wsbase_path/toolchain/git-prompt.sh && . $wsbase_path/toolchain/git-completion.sh && PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

### fzf
[[ -f ~/.fzf.bash ]] && [[ -n $_is_bash ]]  && source ~/.fzf.bash
[[ -f ~/.fzf.zsh ]] && [[ -n $_is_zsh ]]  && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

fzf_history_widget() {
    local selected_command
    selected_command=$(history | fzf +s +m --tac | awk '{print $2}')
    [[ -n "$selected_command" ]] && READLINE_LINE="$selected_command"
}

if [[ -n $_is_bash ]]; then
    # Replace <Shift+Tab-Escape-Sequence> with the actual escape sequence you obtained in step 1
    shift_tab_escape_sequence='^[[Z'

    # Bind the function to Shift+Tab
    bind -x '"'"$shift_tab_escape_sequence"'": fzf_history_widget'
fi

if [[ -n $_is_zsh ]]; then
    #add  file search with shift + tab
    bindkey '^[[Z' fzf-history-widget
fi
