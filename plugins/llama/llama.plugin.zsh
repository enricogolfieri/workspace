
_llama_root_path=$HOME/.llama
_models_path=$_llama_root_path/models

#### Private functions ####
function _install_if_needed()
{
    if ! [ -d $_llama_root_path/build ]; then
        git clone https://github.com/ggerganov/llama.cpp.git $_llama_root_path && \
        cd $_llama_root_path && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make -j$(nproc) && \
        cd -
        #create .venv 
        python3 -m venv $_llama_root_path/.venv
        source $_llama_root_path/.venv/bin/activate
        pip install -r $_llama_root_path/requirements.txt
    fi
}

function _extract_model_gguf()
{   
    #extract the file that ends with .bin or .gguf
    #get the first file
    #do not print colors 
    ls $_models_path/$1 | grep -E '\.bin|\.gguf' --color=never | head -n 1 
}

function _run_llama()
{
    _install_if_needed

    #if $1 is a model name, use it 
    if ! [ -z "$1" ]; then
        local _model_name=$1
        shift
    elif [ -f $_llama_root_path/selected_model ]; then
        local _model_name=$(cat $_llama_root_path/selected_model)
        echo "Running with selected model $_model_name"
    else
        echo "Usage: llama <model_name>"
    fi

    shift 
    local model_file=$(_extract_model_gguf $_model_name)
    $_llama_root_path/build/bin/main -m $_models_path/$_model_name/$model_file $@
}

function _run_llama_prompt()
{

    local _prompt=$(ls $_llama_root_path/prompts | fzf --prompt="Select a sample prompt: ")
    [ -z "$1" ] &&  _run_llama "" -n 256 --repeat_penalty 1.0 --color -i -r "User:" -f ~/.llama/prompts/$_prompt 
    [ ! -z "$1" ] &&  _run_llama $1 -n 256 --repeat_penalty 1.0 --color -i -r "User:" -f ~/.llama/prompts/$_prompt
   
}

# Use fzf to interactively select a model
_list_models_remote() {
    local _keyword=${1:-llama}
    curl -s https://huggingface.co/api/models\?search\=$_keyword | jq -r '.[] | .modelId'
}

function _select_and_download()
{
   # Use fzf to interactively select a model
    local _model_id=$(_list_models_remote $1 | fzf --prompt="Select a llama model: ")

    #_model_name=user/llama-model-name, remove user
    _model_name=${_model_id#*/}
    mkdir -p $_models_path/$_model_name
    # Download the model files
    files=$(curl -s https://huggingface.co/api/models/$_model_id/tree/main | jq -r '.[] | .path')
    #iterate over the files by /n 
    while IFS= read -r file; do
        echo "Downloading $file"
        wget "https://huggingface.co/$_model_id/resolve/main/$file?download=true" -O $_models_path/$_model_name/$file
    done <<< "$files"
}

#### Public functions ####
function goto()
{
    # Use fzf to interactively select a model
    selected_model=$(_list_models_remote $1 | fzf --prompt="Select a llama model: ")

    if [ -z "$selected_model" ]; then
        return 1
    fi
    open https://huggingface.co/$selected_model
}

function quantize()
{
    if ! [ -z "$1" ]; then
        echo "Usage: quantize <quantization_method: q2_0 q3_0 q4_0 q8_0 etc..."
        return 1
    fi
    _quantization_method=$1
    shift
    local _model_name=$(ls $_models_path | fzf --prompt="Select a llama model: ")
    local _new_model_name=$_model_name"_"$_quantization_method
    mkdir -p $_models_path/$_new_model_name
    $_llama_root_path/build/bin/quantize $_models_path/$_model_name/model.bin  $_models_path/$_new_model_name/model.bin $_quantization_method
}

function perplexity()
{
    local _model_name=$(ls $_models_path | fzf --prompt="Select a llama model: ")
    if ! [ -f $_llama_root_path/wiki.test.raw ]; then
        echo "Perplexity file not found"
        get -O $_llama_root_path/wiki.test.raw https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-2-raw-v1.zip?ref=salesforce-research
    fi
    $_llama_root_path/build/bin/perplexity $_models_path/$_model_name/model.bin -f $_llama_root_path/wiki.test.raw 
}

function convert()
{
    source $_llama_root_path/.venv/bin/activate
    local _model_name=$(ls $_models_path | fzf --prompt="Select a llama model: ")
    python $_llama_root_path/convert.py $_models_path/$_model_name $@
}

function llama() {
    case "$1" in
        add)
            _select_and_download $2
        ;;
        list)
            ls $_models_path
        ;;
        goto)
            goto $2
        ;;
        quantize)
            shift
            quantize "$@"
        ;;
        perplexity)
            shift
            perplexity "$@"
        ;;
        help)
            echo "Usage: llama add | list | goto | quantize | perplexity | code | select | prompt | convert"
        ;;
        code)
            code $_llama_root_path
        ;;
        select)
            local _model_name=$(ls $_models_path | fzf --prompt="Select a llama model: ")
            #save the model name in a file
            echo $_model_name > $_llama_root_path/selected_model
        ;;
        prompt)
            shift
           _run_llama_prompt "$@"
        ;;
        convert)
            shift
            convert "$@"
        ;;
        *)
            _run_llama "$@"
        ;;
    esac
}



