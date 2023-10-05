function ws-generate-rsa-key()
{
    echo "Please enter your email address: "
    read email
    ssh-keygen -t rsa -b 4096 -C $email

    # Start the ssh-agent in the background
    eval "$(ssh-agent -s)"

    # Add your SSH private key to the ssh-agent
    ssh-add ~/.ssh/id_rsa

    # Copy the SSH key to your clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo "Note: SSH public key copied to clipboard"

    if [[ -n "$_is_macos" ]]; then
        echo "You are on a Mac. Please update ~/.ssh/config (create if does not exist) with the following:"
        echo "Host *.github.com
                AddKeysToAgent yes
                UseKeychain yes
                IdentityFile ~/.ssh/id_rsa"
        echo "if you chose not to add a passphrase to your key:"
        echo "Host *.github.com
              IgnoreUnknown UseKeychain"
    fi
}

function ws-auth-host()
{
    #add current pub key to authorized hosts on remote host
    echo "Please enter the remote user: "
    read remote_user
    if [[ -z "$remote_user" ]]; then
        echo "Remote user cannot be empty"
        return
    fi
    echo "Please enter the remote host: "
    read remote_host
    if [[ -z "$remote_host" ]]; then
        echo "Remote host cannot be empty"
        return
    fi

    ssh-copy-id -i ~/.ssh/id_rsa.pub $remote_user@$remote_host
}

## Configure git email and name
function ws-git-configure()
{
    echo "Please enter your git email address: "
    read email
    echo "Please enter your git name: "
    read name
    git config --global user.email $email
    git config --global user.name $name
    git config --global core.excludesfile ~/.gitignore

    touch ~/.gitignore
    echo ".venv" >> ~/.gitignore
    echo ".vscode" >> ~/.gitignore
}

