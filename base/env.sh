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
        exit 1            
    ;;
esac

#template
#if  [[ "$_os" = "Linux" ]]; then
#elif  [[ "$_os" = "Darwin" ]]; then
#else
#    echo "ERROR unknown machine: $_os"
#fi
