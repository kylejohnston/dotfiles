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

# Local Dev / Laravel
alias sql="mysql.server start"

alias code='open -b com.microsoft.VSCode'

alias notify='osascript -e "display notification \"Command completed\" with title \"Terminal\" sound name \"Glass\""'

alias code='open -b com.microsoft.VSCode "$@"'

alias python="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"

alias claude="/Users/kylejohnston/.claude/local/claude"

# alias python=/usr/local/bin/python3
# alias pip=/usr/local/pip3

mkcd () {
    mkdir -p $@ && cd ${@:$#}
}
pasta () {
    pbpaste > "$HOME/Desktop/$1.md"
}
copy() {
    cat $1 | pbcopy
}
gb() {
    git checkout -b $1
}
gm() { git checkout main }

gmp() { git checkout main && git pull }
