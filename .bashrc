# export PS1="\u:\W $ "
# mac default: MacBook-Pro-de-Fernando:~ user$
# export PS1="\h:\W \u\$"

bold=$(tput bold)
# green=$(tput green)
normal=$(tput sgr0)

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[${bold}\]\u\[${normal}\]:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vimdiff="/Applications/MacVim.app/Contents/MacOS/Vim -d"
git config --global core.editor "/Applications/MacVim.app/Contents/MacOS/Vim"
# alias mvim="open -a MacVim.app $1"
alias ll='ls -l'
alias sublime="open -a Sublime\ Text.app $1"


# Alias de git

alias gl="git log --all --graph --decorate --oneline"

alias gis="git status"

alias gco="git checkout"
alias gcm="git checkout master"

alias ga="git add"

alias gcv="git commit -v"
alias gcm="git commit -m"

alias gd="git diff"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Matlab
alias matlab="/Applications/MATLAB_R2018b.app/bin/matlab"

# Procesadores de lenguajes
alias minilengcompiler="java -cp ~/ProcesadoresLenguajes/workspace/MiniLeng/bin/ analizador.minilengcompiler"
alias minilengcompiler1="java -cp ~/MiniLeng-Compiler/src javacc.MiniLengCompiler"

# Configuración de bash
export CLICOLOR=1
export HISTSIZE=1000
export HISTFILESIZE=10000

alias ll="ls -lFha"

alias dtob="bc -q <(echo "obase=2")"
alias miip="dig +short myip.opendns.com @resolver1.opendns.com"
alias tiempo="curl wttr.in"

=() {
    echo "$(($@))"
}

alias python="python3"
