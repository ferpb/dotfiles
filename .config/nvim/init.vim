" ========== Load Vim configuration ==========
set runtimepath+=~/.vim,~/.vim/after
" set packpath+=~/.vim
let &packpath = &runtimepath
source ~/.vimrc


" Remove delay when pressing <Esc>
set ttimeoutlen=10
" Enable interactive feedback for the :s command
set inccommand=nosplit

" Use true colors when possible
if $COLORTERM == "truecolor" || $COLORTERM == "24bit"
    set termguicolors
endif

" Highlight terminal mode cursor
:hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

colorscheme gruvbox


" ========== Plugin configuration ==========
" Vimtex
let g:vimtex_compiler_progname = 'nvr'

" Lexima
" Always insert new line regardless if popup menu is visible
let g:lexima_accept_pum_with_enter = 0
