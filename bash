export EDITOR=/usr/local/bin/vim
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export PS1='\[\033[31m\]\W$(__git_ps1 " (%s)")\$ \[\033[0m\]'

alias diff="diff -bu"
alias grep="grep -I"

source ~/.git-completion.sh

if [ -f `brew --prefix`/etc/bash_completion ];
then
    . `brew --prefix`/etc/bash_completion
fi

export PROMPT_COMMAND='history -a'
