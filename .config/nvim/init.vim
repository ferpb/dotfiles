set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

set ttimeoutlen=10

let g:vimtex_compiler_progname = 'nvr'

if $COLORTERM == "truecolor" || $COLORTERM == "24bit"
    set termguicolors
endif
