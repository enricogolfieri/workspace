[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Fuzzy completion for Bash history
bind '"\C-r": "$(history | fzf +s --tac | sed -E \"s/ *[0-9]+ *\*? *//\")\n"'
