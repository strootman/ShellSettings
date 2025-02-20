# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

######### Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Set bash config dir. If the config dir exists, then source all
## *.cfg files therein.
export BASH_CFG_DIR=~/.bash_cfg
if [ -d "$BASH_CFG_DIR" ]; then
	 for cfg_file in $BASH_CFG_DIR/*.cfg; do source $cfg_file; done
fi
