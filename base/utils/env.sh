### Compute _os variable
_os="Linux";

case `uname` in
    Darwin)
        _os="Darwin"
    ;;
    Linux)
        _os="Linux"
    ;;
    *)
        echo "[ENV] Unsupported OS, impossible to setup"
        return 1            
    ;;
esac
