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

### fzf 
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

### git 
[[  -n $_is_bash ]] && . $wsbase_path/toolchain/git-prompt.sh && . $wsbase_path/toolchain/git-completion.sh && PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
[[  -n $_is_zsh ]] && . $wsbase_path/toolchain/git-prompt.sh && $wsbase_path/toolchain/git-completion.zsh && setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '







