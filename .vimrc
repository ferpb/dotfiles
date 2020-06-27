set nocompatible
filetype on
filetype plugin on
filetype indent on

" ========== General configuration ==========
source ~/.vim/packages.vim

set history=5000
set showcmd

set number

set ruler

set encoding=utf-8
set ffs=unix,dos,mac

set mouse=nv

setlocal keywordprg=:help

set hidden

let b:is_posix=1

set ttimeout
set ttimeoutlen=100

set display+=lastline " Always try to show a paragragh's last line

set backspace=indent,eol,start

set clipboard+=unnamed

set shortmess+=I " Disable startup splash screen

" Always display one line at the end of the window
set scrolloff=1


" ========== Search ==========
set incsearch
set ignorecase
set smartcase
set hlsearch


" ========== Colorscheme ==========
syntax on

if $TERM_PROGRAM == "iTerm.app"
    colorscheme gruvbox
    set background=dark
endif

" MacVim GUI configuration
if has("gui_running") && has("gui_macvim")
    colorscheme nord
endif
set guifont=Menlo:h12
" set macligatures
" set guifont=Fira\ Code:h12
set guicursor+=n-v-c:blinkon0


" ========== Command mode completion ==========
set complete-=i
set wildmenu
" Improve completion
set wildmode=longest,list,full


" ========== Indentation ==========
"http://vimcasts.org/episodes/tabs-and-spaces/
set autoindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" ========== Spell checking ==========
setlocal nospell
set spelllang=en,en_us,es

" This command maps C-l in insert mode to "go to the last spell error and
" replace it with the first suggestion"
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" ========== Wrap ==========
set wrap
set linebreak

nmap S :%s//g<Left><Left>


" ========== Hidden characters ==========
"http://vimcasts.org/episodes/show-invisibles/
nmap <leader>1 :set list!<CR>
set listchars=tab:▸\ ,eol:¬


" ========== Persistent undo ==========
if !isdirectory($HOME . "/.vim/undo-dir")
    call mkdir($HOME . "/.vim/undo-dir", "p", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


" ========== Autoread ==========
" Detect when current file is changed from another program and reload it
set autoread
" au " Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl NoneFocusGained,BufEnter * checktime


" ========== General mappings ==========
:let g:mapleader="\<Space>"

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <leader>e :e $MYVIMRC<CR>
noremap <leader>s :source $MYVIMRC<CR>

" Delete trailing whitespace and newlines on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\n\+\%$//e

" Replace ex mode with gw
vmap Q gw
nmap Q gwap

" Buffer mappings
map <leader>j :bnext<cr>
map <leader>k :bprevious<cr>

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Change directory to current file's directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" ========== Cursor settings ==========
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar


" ========== Plugin configuration ==========
" netrw
let g:netrw_banner=0

" `matchit.vim` is built-in, so activate it
runtime macros/matchit.vim

" FZF
" Search over all files of actual directory
nnoremap <C-p> :Files<CR>
" Search over all files of actual repository
" nnoremap <C-p> :GFiles<CR>

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled=1
let g:tex_conceal='abdmgs'

" Vim-Slime
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "clisp"
let g:slime_vimterminal_config = {"term_finish": "close"}

" Lightline
set laststatus=2
" Don't show current mode below status line
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" " Lexima
" " Insertar $ in tex files
" call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
" call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
" call lexima#add_rule({'char': '<BS>', 'at': '\%#\$', 'delete': 1, 'filetype': 'tex'})
" " Not expand " nor ', before or after a word
" " Not expanding ' after a word it's built-in by default in the basic rules
" call lexima#add_rule({'char': '"', 'at': '\w\%#'})
" call lexima#add_rule({'char': '"', 'at': '\%#\w'})
" call lexima#add_rule({'char': "'", 'at': '\%#\w'})
