alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# List all files, ordered so that the most recently changed appears at the end of the output
alias ll='ls -ltrFa'

# Refresh .zshrc
alias rz="source ~/.zshrc"

alias gs="git status"
alias o.="open ."
alias yg="yt-dlp"
# 2025-02-15 swapped you-get for yt-dlp
alias sn="sudo nano"
alias vim="nvim"
alias v="nvim"

alias weather="curl -4 http://wttr.in"

# memex-static image pipeline (works from any directory)
alias memex-watch='npm --prefix ~/Sites/memex-static run watch'
alias memex-process='npm --prefix ~/Sites/memex-static run process'
alias memex-deploy='~/Sites/memex-static/scripts/deploy-images.sh'

# Local Dev / Laravel
alias sql="mysql.server start"

alias code='open -b com.microsoft.VSCode'

alias notify='osascript -e "display notification \"Command completed\" with title \"Terminal\" sound name \"Glass\""'

alias code='open -b com.microsoft.VSCode "$@"'

alias python="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"

serve() { python3 -m http.server "${1:-8080}"; }
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/pip3

mkcd () {
    mkdir -p $@ && cd ${@:$#}
}
copy() {
    cat $1 | pbcopy
}
# paste [--desk] name: write clipboard to name.md in $PWD, or on the Desktop with --desk
paste () {
    local dir=$PWD
    if [[ $1 == --desk ]]; then
        dir=$HOME/Desktop
        shift
    fi
    pbpaste > "$dir/${1:?usage: paste [--desk] name}.md"
}
gb() {
    git checkout -b $1
}
gm() { git checkout main }

# Switch to main, pull, and delete the previous branch once its remote is gone (i.e. the PR merged and was auto-deleted)
gmp() {
  local b
  b=$(git branch --show-current)
  git checkout main && git pull --prune || return 1
  if [[ -n "$b" && "$b" != main && "$(git for-each-ref --format='%(upstream:track)' "refs/heads/$b")" == "[gone]" ]]; then
    git branch -D "$b"
  fi
}

# 2025-12 add; pass bookmarks to nvim
nvim() {
  if [[ $# -ge 1 && ${#1} -eq 1 && $1 != "+" ]]; then
    local mark="$1"
    shift
    command nvim -c "normal! '${mark}" "$@"
  else
    command nvim "$@"
  fi
}

