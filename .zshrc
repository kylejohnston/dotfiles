# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=/usr/local/opt/mysql@5.7/bin:/usr/local/opt/node@12/bin:/Users/kylejohnston/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/kylejohnston/.config/composer/vendor/bin

# version control
autoload -Uz vcs_info
precmd() { vcs_info }

# current git branch
zstyle ':vcs_info:git:*' formats '%b '

# colors, date & time, current directory, git branch
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{white}%~%f %F{cyan}${vcs_info_msg_0_}%f$ '

# make auto-completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -Uz compinit && compinit

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/aliases.zsh

# Install Casks in the Applications folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

alias code='open -b com.microsoft.VSCode'

export HISTCONTROL=ignoreboth:erasedups


# Herd injected NVM configuration
export NVM_DIR="/Users/kylejohnston/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
export PATH="/Users/kylejohnston/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/kylejohnston/Library/Application Support/Herd/config/php/82/"

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
