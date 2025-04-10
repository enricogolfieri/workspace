WS_PATH=$HOME/.workspace

# Use mongovm/.zshrc as the main zshrc
zsrchpath=$WS_PATH/mongovm/.zshrc
if ! grep -qF "source $zsrchpath" "$HOME/.zshrc"; then
    # Append the source command to ~/.zshrc
    echo "source $zsrchpath" >> "$HOME/.zshrc"
    echo "Added source command to ~/.zshrc"
else
    echo "source command already exists in ~/.zshrc"
fi
# Use mongovm/.zshenv as the main zshenv
profilepath=$WS_PATH/mongovm/.zshenv
if ! grep -qF "source $profilepath" "$HOME/.zshenv"; then
    # Append the source command to ~/.zshrc
    echo "source $profilepath" >> "$HOME/.zshenv"
    echo "Added source command to ~/.zshenv"
else
    echo "source command already exists in ~/.zshenv"
fi

# Use mongovm/.gitconfig as the main gitconfig
gitconfigpath=$WS_PATH/mongovm/gitconfig
ln -sf $gitconfigpath $HOME/.gitconfig
# Use mongovm/.gitignore as the main gitignore
gitignorepath=$WS_PATH/mongovm/gitignore
ln -sf $gitignorepath $HOME/.gitignore

