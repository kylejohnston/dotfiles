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

alias weather="curl -4 http://wttr.in"

# SASS Command
alias sassw="sass --watch scss:css"

# Local Dev / Laravel
alias sql="mysql.server start"

alias code='open -b com.microsoft.VSCode'

# alias python=/usr/local/bin/python3
# alias pip=/usr/local/pip3

:take () {
    mkdir -p $@ && cd ${@:$#}
}
