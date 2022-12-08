
# Source server_bashrc.sh
source /home/ubuntu/mongodb-mongo-master/server-workflow-tool/server_bashrc.sh

### Load environment settings, aliases and utility functions
. $HOME/.config/workspace/base/.profile.bash

### Load repoenvs utilities & always enable mongo environment
. $HOME/.config/workspace/repoenvs/.aliases
mongoenv

### Set general environment settings
export LC_ALL="C"
if [ -d /opt/go ]; then
    export PATH=/opt/go/bin:$PATH
    export GOROOT=/opt/go
fi

### Set MongoDB's development settings
ulimit -v 65011712
ulimit -n 64000
ulimit -u 64000
ulimit -l 1024
# ulimit wt
ulimit -c unlimited

# JIRA Username
export JIRA_USERNAME=enrico.golfieri@mongodb.com

# pipx config
export PATH="/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/opt/mongodbtoolchain/gdb/bin:/opt/go/bin:/opt/go/bin:/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/opt/mongodbtoolchain/gdb/bin:/opt/go/bin:/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/opt/mongodbtoolchain/gdb/bin:/opt/go/bin:/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/opt/mongodbtoolchain/gdb/bin:/opt/go/bin:/opt/go/bin:/opt/undodb5/bin:/opt/cmake/bin:/opt/rtags-2.38/bin:/opt/mongodbtoolchain/gdb/bin:/opt/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/node/bin:/opt/node/bin:/home/ubuntu/cli_bin:/opt/node/bin:/opt/node/bin:/opt/node/bin:/opt/node/bin:/home/ubuntu/cli_bin:/opt/node/bin:/home/ubuntu/.local/bin:/home/ubuntu/.local/bin:${PATH}"

export PATH=/opt/mongodbtoolchain/v3/bin:${PATH}
alias ninja=/opt/mongodbtoolchain/v4/bin/ninja

#evergreen group failures by test
alias egf='node $HOME/util/evg_group_failures_by_test/evg_get_failing_tests.js --patch_id'

### Set general environment settings
export PATH=~/bin:${PATH}
export PATH=~/util:${PATH}

