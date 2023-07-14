###################
#  Start Scripts  #
###################
neofetch

##################
#     Aliase     #
##################
alias ll="ls -al"
alias ps1="powershell.exe"
alias vim="nvim"

#################
#      PS1      #
#################
color_prompt=yes
gitPS1(){
    gitps1=$(git branch 2>/dev/null | grep '*')
    gitps1="${gitps1:+ (${gitps1/#\* /})}"
    echo "$gitps1"
}
timeNow(){
    echo "$(date +%r)"
}
newLine(){
	printf "\n "
}
if [ "$color_prompt" = yes ]; then
  if [ x$EUID = x0 ]; then
    PS1='\[\033[1;38m\][ $(timeNow)]\[\033[00m\] \[\033[1;31m\]\u\[\033[00m\]\[\033[1;37m\]@\[\033[00m\]\[\033[0;36m\]\h\[\033[00m\] \[\033[1;36m\]\w\[\033[00m\]\[\033[1;36m\]$(gitPS1)\[\033[00m\] \[\033[1;31m\]$(newLine):/#\[\033[00m\] '
  else
    PS1='\[\033[1;38m\][ $(timeNow)]\[\033[00m\] \[\033[1;32m\]\u\[\033[00m\]\[\033[1;37m\]@\[\033[00m\]\[\033[0;36m\]\h\[\033[00m\] \[\033[1;36m\]\w\[\033[00m\]\[\033[1;36m\]$(gitPS1)\[\033[00m\] \[\033[1;32m\]$(newLine):/$\[\033[00m\] '
  fi
else
    PS1='[$(timeNow)] \u@\h \w$(gitPS1) :/$ '
fi
#################
#  Path / env   #
#################
export PATH="$HOME/nvim/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

#################
#    Anderes    #
#################
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
##################
#    Settings    #
##################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi