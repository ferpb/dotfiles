set nocompatible
filetype on
filetype plugin on
filetype indent on


" ========== General configuration ==========
source ~/.vim/packages.vim

set history=5000
set noshowcmd

set number

set ruler

set encoding=utf-8
set ffs=unix,dos,mac

" Use mouse in normal, terminal and visual modes
set mouse=nv

setlocal keywordprg=:help

set hidden

let b:is_posix=1

set ttimeout
set ttimeoutlen=100
set updatetime=100

" If last line is wrapped and doesn't fit in the buffer
" show as much as posible.
set display+=lastline

set backspace=indent,eol,start

set clipboard+=unnamed

" Disable startup splash screen
set shortmess+=I
" Show search count
set shortmess-=S

" Always display one line at the end of the window
set scrolloff=1

" Disable error bells
set noerrorbells visualbell t_vb=

" Set gq program to 'par'
set formatprg=par\ -w79r

set path=.,**

" ========== Search ==========
set incsearch
set ignorecase
set smartcase
set hlsearch


" ========== Colorscheme ==========
syntax on

" if $TERM_PROGRAM == "iTerm.app"
" if has('nvim')
    " let g:gruvbox_constrast_dark = 'hard'
    let g:gruvbox_invert_selection = '0'
    colorscheme gruvbox
    set background=dark
" endif

" Better terminal colors on Vim
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
endif


" ========== MacVim GUI configuration ==========
if has("gui_running") && has("gui_macvim")
    set guioptions=
    let g:gruvbox_invert_selection = '0'
    colorscheme gruvbox
    set background=dark

    set guifont=Menlo:h12
    " set macligatures
    " set guifont=Fira\ Code:h12
    set guicursor+=n-v-c:blinkon0
    " set shellcmdflag=-ic

    let g:UltiSnipsUsePythonVersion = 2
endif


" ========== Syntax highlighting groups ==========
" Show highlighting groups for current word
" http://vimcasts.org/transcripts/25/en/
nmap <C-S-s> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')),
  \       'synIDattr(v:val, "name")')
endfunc


" ========== Command mode completion ==========
set complete-=i
set wildmenu
" Improve completion
set wildmode=longest:full,full
set wildignorecase
set wildignore="*.git/*,*.o"

" ========== Indentation ==========
"http://vimcasts.org/episodes/tabs-and-spaces/
set autoindent
set smartindent
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
" <c-g>u inserts an undo-break to make the change undoable
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" ========== Wrap ==========
set wrap
set linebreak


" ========== Hidden characters ==========
"http://vimcasts.org/episodes/show-invisibles/
nmap <leader>1 :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:~


" ========== 80 characters line indicator ==========
" Highligt all characters in line 81
" highlight ColorColumn ctermbg=magenta guibg=darkmagenta
call matchadd('ColorColumn', '\%81v', 100)


" ========== Persistent undo ==========
if !isdirectory($HOME . "/.vim/undo-dir")
    call mkdir($HOME . "/.vim/undo-dir", "p", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


" ========== Autoread ==========
" Detect when current file is changed from another program and reload it
set autoread

augroup autoread_group
    autocmd!
    " Triger `autoread` when files changes on disk
    " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
    " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

    " Notification after file change
    " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
                \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl NoneFocusGained,BufEnter * checktime
augroup END


" ========== General mappings ==========
let g:mapleader="\<Space>"
let maplocalleader="\<Space>"

nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

tnoremap <A-h> <c-\><c-n><c-w>h
tnoremap <A-j> <c-\><c-n><c-w>j
tnoremap <A-k> <c-\><c-n><c-w>k
tnoremap <A-l> <c-\><c-n><c-w>l
" Exit terminal mode
tnoremap <A-[> <C-\><C-n>
" Insert register content from terminal mode
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>p :e ~/.vim/packages.vim<CR>
nnoremap <leader>s :source $MYVIMRC<CR>

" Replace ex mode with gw
vmap Q gw
nmap Q gwap

" Buffer mappings
map <leader>j :bnext<cr>
map <leader>k :bprevious<cr>
map <leader>d :b #<cr>:bdelete! #<cr>
map <leader>b :b <C-d>

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Change directory to current file's directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Open vertical right terminal
command! Terminal vertical below terminal

" Replace shortcut
nmap S :%s//g<Left><Left>

" Move by visual lines
nmap k gk
nmap j gj


" ========== Cursor settings ==========
if !has('gui_running') && !has('nvim')
    let &t_SI.="\e[6 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
endif

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

:hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE



" ========== Trailing whitespace ==========
augroup trailingwhitespace_group
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search (search register), and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    " Clean trailing whitespace at the end of the lines
    %s/\s\+$//e
    " Clean trailing empty lines at the end of the file
    %s/\n\+\%$//e
    " Clean up:
    " Delete search history
    call histdel('/', -1)
    call histdel('/', -1)
    " Restore search register
    let @/=_s
    " Restore cursor position
    call cursor(l, c)
endfunction


" ========== Plugin configuration ==========
" netrw
" Vinegar plugin
let g:netrw_banner=0

" `matchit.vim` is built-in, so activate it
runtime macros/matchit.vim

" FZF
" Search over all files of actual directory
nnoremap <C-p> :Files<CR>
" Search over all files of actual repository
" nnoremap <C-p> :GFiles<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled=0
let g:tex_conceal='abdmgs'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="pdflatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

" Vim-Slime
let g:slime_target = "tmux"
let g:slime_vimterminal_cmd = "clisp"
let g:slime_vimterminal_config = {"term_finish": "close"}

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ },
  \ }

" UltiSnippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Fugitive
nmap <leader>gs :G<cr>
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //2<cr>

" LilyPond
augroup lilypond_group
    " Commentary
    autocmd FileType lilypond setlocal commentstring=%\ %s
    autocmd FileType lilypond setlocal dictionary+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim/syntax/lilypond-words
    autocmd BufWritePost *.ly call feedkeys("\<Esc>|") | silent! make | cw | call feedkeys("\<Enter>")
augroup END

" Undo Tree
nnoremap <F5> :UndotreeToggle<cr>

" Python
let python_highlight_space_errors = 0
let g:python_highlight_all = 1
