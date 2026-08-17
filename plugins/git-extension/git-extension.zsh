alias merge_scope_files='MERGE=$(git rev-list --first-parent --merges -n 1 HEAD); PRE=$MERGE^1; OTHER=$MERGE^2; BASE=$(git merge-base $PRE $OTHER); comm -12 <(git diff --name-only $BASE..$PRE | sort) <(git diff --name-only $PRE..$MERGE | sort)'

function git-diff-merge-scope() {
    MERGE=$(git rev-list --first-parent --merges -n 1 HEAD); PRE=$MERGE^1
    git diff "$PRE..$MERGE" -- $(merge_scope_files)
}

function git-diff-merge-scope-files() {
    MERGE=$(git rev-list --first-parent --merges -n 1 HEAD)
    PRE=$MERGE^1
    TMP=$(mktemp -d /tmp/merge-scope.XXXXXX)
    while IFS= read -r f; do
    mkdir -p "$TMP/$(dirname "$f")"
    git show "$PRE:$f" > "$TMP/$f" 2>/dev/null || : > "$TMP/$f"
    code --diff "$TMP/$f" "$PWD/$f"
    done < <(merge_scope_files)
    echo "Temp before-files: $TMP"
}

function git-diff-merge-scope-files-it() {
    MERGE=$(git rev-list --first-parent --merges -n 1 HEAD)
    PRE=$MERGE^1
    TMP=$(mktemp -d /tmp/merge-scope.XXXXXX)
    local files=("${(@f)$(merge_scope_files)}")
    for f in "${files[@]}"; do
        mkdir -p "$TMP/$(dirname "$f")"
        git show "$PRE:$f" > "$TMP/$f" 2>/dev/null || : > "$TMP/$f"
    done
    local i=1
    for f in "${files[@]}"; do
        echo "[$i/${#files[@]}] $f"
        code --diff "$TMP/$f" "$PWD/$f"
        ((i++))
        [[ $i -le ${#files[@]} ]] && read -s -k "?Press any key for next file (q to quit)... "
        echo
        [[ "$REPLY" == "q" ]] && break
    done
}