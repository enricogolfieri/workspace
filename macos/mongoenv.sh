
#autoactivate vev
. ~/.config/workspace/mongo/virtualenv-auto-activate.sh

#add scripts
export PATH=~/.config/workspace/mongo/devscripts:${PATH}\

#add mongofunction
. ~/.config/workspace/mongo/mongo-functions-mac.sh

echo "mongo environment activated"
