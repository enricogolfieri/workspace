### Set MongoDB's development settings
ulimit -v unlimited
ulimit -n 64000
ulimit -u 64000
ulimit -l 1024
# ulimit wt
ulimit -c unlimited

# BEGIN Source .bashrc
if [[ -f ~/.config/workspace/mongovm/.bashrc ]]; then
    source ~/.config/workspace/mongovm/.bashrc
fi
# END Source .bashrc