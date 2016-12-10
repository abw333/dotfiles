# initialize zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# list plugins
zplug "zplug/zplug"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh

# let zplug manage zplug
zplug update --self

# install plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins
zplug load

# completion options
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# prompt
dir_name() {
    if [ "$(pwd)" = "$HOME" ]; then
        echo "~"
    else
        basename "$(pwd)"
    fi
}

git_branch() {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}

autoload -U colors && colors
setopt prompt_subst

PROMPT='%{$fg[magenta]%}$(dir_name)%{$fg[yellow]%}$(git_branch) %{$fg[cyan]%}∴%{$reset_color%} '

# aliases
alias ls="ls -aG"
alias ll="ls -aGhl"

alias up="cd .."

alias grep="grep --color=auto"

alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# history
setopt HIST_IGNORE_ALL_DUPS
