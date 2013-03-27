export EDITOR=/usr/local/bin/vim
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# prompt 1
# export PS1='\[\033[31m\]\W$(__git_ps1 " (%s)")\$ \[\033[0m\]'

# prompt 2
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1='\n\[\033[31m\]\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] `basename $VIRTUAL_ENV 2> /dev/null` \[\e[0;35m\]`echo $BEV_PROJECT 2> /dev/null`\[\e[0m\]\n'

alias diff="diff -bu"
alias grep="grep -I"
alias awkt="awk -F'\t'"

# apparently this doesn't work on Macs
#alias ls='ls --color=auto --hide "*.pyc"'

# alias activate="source $my_libs/venv/bin/activate"

function abs() { ls -d $PWD/$1 ;}

source ~/.git-completion.sh

if [ -f `brew --prefix`/etc/bash_completion ];
then
    . `brew --prefix`/etc/bash_completion
fi

export PROMPT_COMMAND='history -a'
