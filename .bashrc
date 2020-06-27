# Configure PS1

bold=$(tput bold)
# green=$(tput green)
normal=$(tput sgr0)

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[${bold}\]\u\[${normal}\]:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# Bash configuration
export CLICOLOR=1
export HISTSIZE=500000
export HISTFILESIZE=1000000
export TERM=xterm-256color

# history -a writes the last command into the history
# history -r import the history to the current shell
export PROMPT_COMMAND='history -a; history -r'
# append to history instead of overwriting
shopt -s histappend

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# NVM
export NVM_DIR="/Users/user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Flutter
export PATH="$PATH:`pwd`/flutter/bin"

# bin directory
export PATH="$PATH:~/bin"


# Aliases

# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
# alias vimdiff="/Applications/MacVim.app/Contents/MacOS/Vim -d"

alias ll="ls -lFha"

alias sublime="open -a Sublime\ Text.app $1"

## Git aliases
alias gl="git log --all --graph --decorate --oneline"
alias gis="git status"
alias gco="git checkout"
alias gcm="git checkout master"
alias ga="git add"
alias gcv="git commit -v"
alias gcm="git commit -m"
alias gd="git diff"

## Matlab
alias matlab="/Applications/MATLAB_R2018b.app/bin/matlab"

## Procesadores de lenguajes
alias minilengcompiler="java -cp ~/ProcesadoresLenguajes/workspace/MiniLeng/bin/ analizador.minilengcompiler"
