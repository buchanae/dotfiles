# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# quickly create a scratch directory
function scratch() {
  mkdir -p "$HOME/scratch/$1"
  cd "$HOME/scratch/$1"
}

# per-host prompt color
hostcolor() {
  python2 -c '
import socket, hashlib, sys
hn = socket.gethostname()
v = hashlib.md5(hn).hexdigest()
col = lambda i: int(v[i:i+2], 16);
sys.stdout.write("\x1b[38;2;{r};{g};{b}m{hn}\x1b[0m".format(r=col(0), g=col(1), b=col(2), hn=hn))
'
}

# copy common user profile files to a remote machine
copyprofile() {
  rsync -vv --exclude .git -a ~/.inputrc ~/.gitconfig ~/.vimrc ~/.profile ~/.vim $1:~/
}

# quick docker run
dr() {
  docker run --user $(id -u):$(id -g) -w /data -v `pwd`:/data $@
}

cutt() {
  cut -d"$1" "${@:2}"
}

set_prompt() {
  purple="\[\033[38;5;129m\]"
  orange="\[\033[38;5;172m\]"
  black="\[\033[38;5;172m\]"
  light_yellow="\[\033[38;5;229m\]"
  off_white="\[\033[38;5;15m\]"
  gray="\[\033[38;5;254m\]"
  dark="\[\033[38;5;240m\]"
  host=$(hostcolor)
  if command -v __git_ps1 > /dev/null 2>&1 ; then
    git_repo=$(__git_ps1 " (%s)")
  else
    git_repo=""
  fi
  PS1="$host $orange\W$git_repo\n$gray"
}

# quickly get absolute path to file.
function abs() {
  # comment
  python2.7 -c '
import os, sys;
for path in sys.argv[1:]:
    print os.path.realpath(path)
' $@
}

# ctrl+f to delete to last "/"
bind '\C-f:unix-filename-rubout'
shopt -s checkwinsize
#shopt -s globstar
shopt -s histappend

alias wget='wget --content-disposition'
alias lc='wc -l'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias env='env | sort'
alias tree='tree -I venv -C'
alias gce='gcloud compute'
alias gcei='gcloud compute instances'
alias xper='xargs -L1'
alias count='sort | uniq -c'
alias tmux='tmux -2'
alias cuts='cut -d" "'
alias tab2nl='sed "s/\t/\n/g"'
alias header='head -n1'
alias head100='head -n100'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

PROMPT_COMMAND=set_prompt
HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
export GOPATH=$HOME
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.5/bin/
export HOSTALIASES=$HOME/.hosts
export EDITOR=$(which vim)
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -f ~/dotfiles/git-prompt.sh ]; then
  source ~/dotfiles/git-prompt.sh
fi

if [ -f ~/dotfiles/git-completion.sh ]; then
  source ~/dotfiles/git-completion.sh
fi

if [ -f ~/dotfiles/bash_completion ]; then
  . ~/dotfiles/bash_completion
fi

