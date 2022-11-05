# if not running interactively, don't do anything {{{
case $- in
    *i*) ;;
      *) return;;
esac
# }}}
# bash options {{{
# history
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=20000

export EDITOR=vim

shopt -s histappend
shopt -s checkwinsize
#shopt -s globstar

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# rust
export CARGO_HOME=/data/rust/cargo
export RUSTUP_HOME=/data/rust/rustup
export PATH=$PATH:$CARGO_HOME/bin

source "$CARGO_HOME/env"

# }}}
# aliases {{{

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# python (we're in 2020, it's 3 now, finally!)
alias python='python3'
alias pip='pip3'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# }}}
# prompt {{{

FG_COLOR='\e[38;5;2m'
FG_RESET='\e[0m'

function ps1status() {
    local STATUS=$?

    if [ $STATUS -ne 0 ];
    then
        echo -en "$STATUS|"
    fi
}

PS1_FORMAT='\u@\h:\w> '
export PS1='\['"$FG_COLOR"'\]$(ps1status)'"$PS1_FORMAT"'\['"$FG_RESET"'\]'

# }}}
# junk? {{{
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# }}}
# completion {{{

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# }}}

