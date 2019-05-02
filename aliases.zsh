alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Show and hide desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hiding and showing files in Finder
alias visible="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias invisible="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# List all files, ordered so that the most recently changed appears at the end of the output
alias ll='ls -ltrFa'

# Refresh .zshrc
alias sz="source ~/.zshrc"

# Shortcuts
alias gs="git status"
alias o.="open ."
alias yg="you-get"
alias sn="sudo nano"

alias weather="curl -4 http://wttr.in"

alias resize="sips --resampleWidth 600 formatOptions 100 *"

alias resize14="sips --resampleWidth 1440 formatOptions 100 *"

alias convert="sips -s format jpeg ./*.png --out ."