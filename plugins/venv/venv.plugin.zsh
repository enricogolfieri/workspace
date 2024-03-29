# activate python env
function vact()
{
    [[ -d "./.venv" ]] && source ./.venv/bin/activate && return 0
    [[ -f "./.python-version" ]] && pyenv activate $(cat ./.python-version) && return 0
    return 1
}

# create a new python virtual environment local to the current directory
function vset()
{   
    _pyversion=${1:-$__sys_python3_version}
    #print usage if first argument is help
    [ "$1" = "--help" ] && echo "Usage: vset <python version (3.x.x)> [requirements-file-name]" && return 0
        
    #delete if exists
    [[ -d "./.venv" ]] && rm -rf "./.venv";

    pyenv shell $_pyversion ||
    ( (echo "$_pyversion not found, ready to install..." &&
     pyenv install $_pyversion) ||
    (echo "pyenv shell $_pyversion failed" && return 1) );

    pyenv shell $_pyversion
    python3 -m venv ./.venv || (echo "Failed to create virtual environment" && return 1);

    vact
    #install requirements if exists
    requiments_file_name=${2:-"requirements.txt"}
    if [[ -f "./$requiments_file_name" ]]; then
        python3 -m pip install --upgrade pip && \
        pip install -r requirements.txt
    fi
}

function venv()
{
    #activate if exist otherwise create it 
    vact || vset $@
}


# vgit: CLONE AND CONVERT a git repo and create a python virtual environment local to the current directory
function vgit()
{
    [ "$1" = "--help" ] && echo "Usage: vgit <repo-url> [python version (3.x.x)]" && return 0

    if [ -z "$1" ]; then
        echo "Usage: vgit <repo-url> [python version (3.x.x)]"
        return 1
    else
        _repo_url=$1
        _pyversion=${2:-$__sys_python3_version}
        git clone $_repo_url && cd $(basename $_repo_url .git) && vset $_pyversion
    fi
}

## Utility python ####
#redifining cd to automatically activate python inside .venv
_enable_venv_if_exists()
{
	# Check there is no virtual environment activated.
	if [[ -z ${VIRTUAL_ENV} ]]; then
		# If the .venv directory is found then activate the virtual
		# environment.
        if [ -d "./.venv" ]; then
            source ./.venv/bin/activate
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

chpwd_functions=(${chpwd_functions[@]} "_enable_venv_if_exists")

