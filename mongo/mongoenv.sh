
#add scripts
export PATH=~/.config/workspace/mongo/bashscripts:~/.config/workspace/mongo/tools:${PATH}\


#!/usr/bin/env bash
_machine=;
if [ "$(uname)" == "Darwin" ]; then
    #add mongofunction
    . ~/.config/workspace/mongo/mongo-functions-mac.sh      
    _machine="Darwin";
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    #add mongofunction
    . ~/.config/workspace/mongo/mongo-functions-lnx.sh
    _machine="Linux";
fi

#redifining cd to automatically activate python inside .venv
cd ()
{
	builtin cd $@

	# Check there is no virtual environment activated.
	if [[ -z ${VIRTUAL_ENV} ]]; then
		# If the .venv directory is found then activate the virtual
		# environment.
		if [[ -d ./.venv ]]; then
			. .venv/bin/activate
		fi
	else
		# If the current directory does not belong to earlier VIRTUAL_ENV
		# directory then deactivate the virtual environment.
		PARENT_DIR=$(dirname ${VIRTUAL_ENV})
		if [[ ${PWD}/ != ${PARENT_DIR}/* ]]; then
			deactivate
		fi
	fi
}

mongo-download-evg-logs() {
    _workstation="mongo-ws"
    _logs_url=$1
	_logs_folder="~/tmp"

    _filename=${_logs_url##*/}

    ssh ${_workstation} "cd $_logs_folder; wget -q -O ${_filename} $1"
    if [ $? -ne 0 ]; then
         return 1;
    fi;

    scp -C ${_workstation}:${_logs_folder}/${_filename} .
}


echo "mongo environment activated for $_machine"

