# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/.composer/vendor/bin:$PATH"
export PATH="$PATH:/Users/kylejohnston/.local/bin"
export PATH="$HOME/.dotfiles/bin:$PATH"

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/.composer/vendor/bin:/Users/kylejohnston/.local/bin:$PATH"
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export EDITOR="nvim"

# custom prompt
# version control (git)
autoload -Uz vcs_info
precmd() { vcs_info }
# current git branch
zstyle ':vcs_info:git:*' formats '%b '
# colors, date & time, current directory, git branch
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{white}%~%f %F{cyan}${vcs_info_msg_0_}%f$ '

# make auto-completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Optimize compinit - only check cache once per day
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/zsh/aliases.zsh

# Install Casks in the Applications folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Ignore duplicates and commands starting with space
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate entries from history
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space
setopt HIST_SAVE_NO_DUPS     # Don't write duplicate entries to history file
setopt HIST_FIND_NO_DUPS     # When searching history don't display duplicates

# Additional useful history options
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from history
setopt HIST_VERIFY           # Don't execute immediately upon history expansion

# export HISTCONTROL=ignoreboth:erasedups
# SAVEHIST=0 # for current session
# HISTSIZE=0 # across sessions

# Custom markpath function
export MARKPATH=$HOME/.marks
function go {
    cd -P $MARKPATH/$1 2> /dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- && echo
}

take () {
    mkdir -p $@ && cd ${@:$#}
}


# zprof
# uncomment zprof + the first line to measure performance

# Herd injected PHP binary.
# export PATH="/Users/kylejohnston/Library/Application Support/Herd/bin/":$PATH

# Log
# 2025-01-05 added setopt hist_ lines, enabled history
# 2025-03-29 added take function

# Herd injected PHP binary.
export PATH="/Users/kylejohnston/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/kylejohnston/Library/Application Support/Herd/config/php/82/"

export NVM_DIR="$HOME/.nvm"

# Lazy-load nvm for faster startup
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

node() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  node "$@"
}

npm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  npm "$@"
}

npx() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  npx "$@"
}
