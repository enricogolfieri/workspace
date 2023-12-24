### brew ###
FB_FORMULA_PREVIEW='HOMEBREW_COLOR=true brew info {}'
FB_FORMULA_BIND="ctrl-space:execute-silent(brew home {})"
FB_CASK_PREVIEW='HOMEBREW_COLOR=true brew info --cask {}'
FB_CASK_BIND="ctrl-space:execute-silent(brew home --cask {})"
function fbrew() {
    local inst=$(brew formulae | fzf --query="$1" -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)

    if [[ $inst ]]; then
        for prog in $(echo $inst); 
        do
          brew install $prog; 
        done
    fi
}

function fbrewu() {
    local uninst=$(brew leaves | fzf --query="$1" -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)

    if [[ $uninst ]]; then
        for prog in $(echo $uninst);
        do 
          brew uninstall $prog; 
        done
    fi
}

function fcask() {
    local inst=$(brew casks | fzf --query="$1" -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)

    if [[ $inst ]]; then
        for prog in $(echo $inst); 
          do
            brew install --cask $prog; 
          done
    fi
}

function fcasku() {
    local inst=$(brew list --cask | fzf --query="$1" -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)

    if [[ $inst ]]; then
        for prog in $(echo $inst); 
        do 
          brew uninstall --cask $prog; 
        done
    fi
}