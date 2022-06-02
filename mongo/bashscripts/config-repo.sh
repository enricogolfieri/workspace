#!/bin/bash
#just call config-vscode on the root of a mongo git repo 

ln -s ~/.config/workspace/mongo/vscode/ .vscode
ln -s ~/.config/workspace/mongo/tools/ .

. .venv/bin/activate 

pip install -r  ~/.config/workspace/mongo/tools/requirements.txt

