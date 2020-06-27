# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.bashrc ] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Force terminal to use English as output language
export LC_ALL=C
