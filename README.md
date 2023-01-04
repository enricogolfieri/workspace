# Workspace
Personal Workspace

# Linux 
`
git clone git@github.com:enricogolfieri/workspace $HOME/.config/workspace 
`

update .bashrc

`
source $HOME/.config/workspace/linux/.bashrc
`

reload terminal and run

`
ws-setup
`

reload terminal 

# Mac 
`
git clone git@github.com:enricogolfieri/workspace $HOME/.config/workspace 
`

update .bashrc

`
source $HOME/.config/workspace/macos/.bashrc
`

update .zshrc

`
source $HOME/.config/workspace/macos/.zshrc
`

on either zshell or shell run

`
ws-setup
`
reload terminal 

# MongoDb 
Local compilation on macos or linux:
    1. follow steps above for your local machine
    2. install mongo utilities `mongoenv; mongo-setup`
    3. on macos install xcode 
    4. type mongoenv for every shell to enable the environment
Note: when you build locally, you will use the version of ninja, ccache, gcc, python etc installed in your system. There is no guarantee this will actually work.

Compilation on a mongodb virtual machine:
    1. include to .bashrc `source $HOME/.config/workspace/mongovm/.bashrc`
    2. install workspace utilities `ws-setup`
    3. install mongo utilities `mongo-setup`


