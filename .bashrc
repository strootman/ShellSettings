# Developer .bashrc file for interactive bash(1) shells.

if [ -r "${HOME}/.bash_alias" ]; then
   . ${HOME}/.bash_alias
fi

if [ -r "${HOME}/.bash_alias_iplant" ]; then
   . ${HOME}/.bash_alias_iplant
fi

if [ -r "${HOME}/.bash_developer" ]; then
   . ${HOME}/.bash_developer
fi

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups

export IPLANT_CONF_DIR=$HOME/conf

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh ]; then
    . /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

################################################################################
# Set the prompt with PS1 ######################################################

pwdtail () {
    if [ "$PWD" = "$HOME" ]; then
        echo "~"
    else
        # returns the last field of the working directory
        pwd | awk -F/ '{print $NF}'
    fi
}

prompt_command () {
    # Terminal text colors
    local GREEN="\[\e[0;32m\]"
    local CYAN="\[\e[0;36m\]"
    local BCYAN="\[\e[1;36m\]"
    local BLUE="\[\e[0;34m\]"
    local GRAY="\[\e[0;37m\]"
    local DKGRAY="\[\e[1;30m\]"
    local WHITE="\[\e[1;37m\]"
    local RED="\[\e[0;31m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\e[0m\]"

    # set the titlebar to the last field of pwd
    local TITLEBAR='\e]0;\W (${USER}@${HOSTNAME})\a'

    # if we're in a Git repo, show current branch
    if [ "\$(type -t __git_ps1)" ]; then 
        if git diff --quiet 2>/dev/null >&2; then
            BRANCHCOLOR=${GREEN}
        else
            BRANCHCOLOR=${RED}
        fi

        BRANCH="${BRANCHCOLOR}\$(__git_ps1)${DEFAULT}"
    fi

    # set the PS1 prompt var
    CHECKMARK='\342\234\223'
    FAIL='\342\234\227'
    export PS1='$(if [[ $? == 0 ]]; then printf "\[\e[1;32m\]$CHECKMARK"; else printf "\[\e[1;31m\]$FAIL"; fi)\[\e[0m\]\n\[\e[0;30;47m\][\d \t] \[\e[1;34;47m\]\u@\h:\w\e[0;35;47m\]$(__git_ps1)\[\e[0m\]\n\[\e[0;37m\]?\[\e[1;96m\] '
    # set the Titlebar seperately, since including $TITLEBAR in PS1 may cause 
    # prompt issues on a Mac
    echo -ne "\033]0;`pwdtail` (${USER}@${HOSTNAME})\007"
}


case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='prompt_command'
    ;;
*)
    ;;
esac



export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
