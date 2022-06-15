
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


echo "mongo environment activated for $_machine"

