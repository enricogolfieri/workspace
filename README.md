# Workspace
Personal Workspace

# Linux 
`
git clone git@github.com:enricogolfieri/workspace ~/.config/workspace 
`

update .bashrc

`
source ./config/workspace/linux/.bashrc
`

# Mac 

```
git clone git@github.com:enricogolfieri/workspace ~/.config/workspace 
```

```
brew install miniconda
brew install bash-completion
brew install oh-my-posh
brew install --cask iterm2
```

Install Menslo LF Nerd Font (refer to "MesloLGM Nerd Font" family)
```
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

Install python 3.9
```
conda install python=3.9 
```


To install useful key bindings and fuzzy completion:

```
$(brew --prefix)/opt/fzf/install
```

update .zshrc

```
source ./config/workspace/macos/.zshrc
```

# MongoDb 

## Mac
to work on mongodb, update .bashrc 

```
source ~/.config/workspace/mongo/.zshrc
```

install 

```
brew install ninja 
brew install ccache
```

## Linux 

to work on mongodb, update .bashrc 

```
source ./config/workspace/linux/.bashrc
```

install 

```
sudo apt install ninja 
sudo apt install ccache 
```

clone mongodbtoolchain in /opt/


