### Compute _os variable
_os="Linux";

case `uname` in
    Darwin)
        _os="Darwin"
        _is_macos=1
    ;;
    Linux)
        _os="Linux"
        _is_linux=1
    ;;
    *)
        echo "[ENV] Unsupported OS, impossible to setup"
        return 1            
    ;;
esac

if [[ $(uname -m) == 'arm64' ]]; then
  _is_arm=1
fi

### compute shell type 

_shell_type=$(ps -o comm= -p $$)

if [[ $_shell_type == "zsh" ]]; then
    _is_zsh=1
elif [[ $_shell_type == "bash" ]]; then
    _is_bash=1
else
    echo "[ENV] Unsupported shell, impossible to setup"
    return 1
fi