
if [ ! -d "$_img_workdir" ]; then
    mkdir -p "$_img_workdir"
fi

if [ ! -d "$_img_workdir/.venv" ]; then
    _setup_env
fi

source "$_img_workdir/.venv/bin/activate"

echo "imaginary environment activated"

