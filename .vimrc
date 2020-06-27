" Activa los plugins filetype
filetype plugin indent on
syntax on
set number
set nocompatible
" Desactivar el mensaje por defecto del principio
set shortmess+=I

let $VIM='~/.vim/'

" Plugins de Plug
call plug#begin('~/.vim/plugged')
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" " Ajustes de Coc {
" if filereadable(expand('~/.vim/vim-coc.vim'))
"     source ~/.vim/vim-coc.vim
" endif
" " }

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become
" resolved.
" set signcolumn=yes


" Tipo de letra para MacVim
set guifont=Menlo:h12
" set macligatures
" set guifont=Fira\ Code:h12

"http://vimcasts.org/episodes/tabs-and-spaces/
"Para controlar el espacio hay 4 ajustes
set tabstop=4 "número del columnas con las que se representa el tabulado
set softtabstop=4 "al usar softabs, indica el número de espacios que se borran con <DEL>
set shiftwidth=4 "determina la cantidad de espacio en blanco que se introduce o elimina con la indentación
set expandtab "inserta espacios en vez de tabulados
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
" Función para ajustar las opciones de tabulación dependiendo del fichero
" map <C-n> :NERDTreeToggle<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
endif
" Para saber el tipo de un archivo: :set ft?
" Para establecer el tipo de un archivo setfiletype <tipo> o set filetype=<tipo>

" colorscheme sublimemonokai
colorscheme gruvbox
set background=dark

"Coloschemes
if has("gui_running") && has("gui_macvim")
    colorscheme nord
endif
"autocmd BufEnter * colorscheme default
" autocmd BufEnter *.cpp colorscheme sublimemonokai
" autocmd BufEnter *.hpp colorscheme sublimemonokai
" autocmd BufEnter Makefile colorscheme sublimemonokai

" set nowrap

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Mostrar siempre una línea de estado al final, incluso cuando sólo hay una ventana abierta
set laststatus=2
" Evitar que salga el mensaje del modo en el que está
set noshowmode
set guioptions=
set guicursor+=n-v-c:blinkon0

" Marca los resultados de búsqueda, busca de forma incremental
" y automáticamente cambia a case-sensitive cuando la búsqueda
" contiene una letra mayúscula
" set hlsearch
set incsearch
set ignorecase
" La búsqueda se vuelve sensible a mayúsculas cuando contiene alguna mayúsculas.
set smartcase

set autoindent


" Configuración UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsSnippetsDir="~/.vim/myUltiSnips"
let g:UltiSnipsSnippetDirectories = ['myUltiSnips']

if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
endif


"Configuración de ALE
" " Establece los listers y fixers que están activados
" let g:ale_linters = {'c++': ['gcc', 'clang', 'flawfinder']}
" "Siempre muestra la barra de errores para evitar que se mueva la pantalla
" let g:ale_sign_column_always = 1
" "Muestra los errores en airline
" "let g:airline#extensions#ale#enabled = 1
" "Remapear a [e y ]e para navegar entre errores
" nmap <silent> [e <Plug>(ale_previous_wrap)
" nmap <silent> ]e <Plug>(ale_next_wrap)
"
" set statusline=%{LinterStatus()}


"Asegurarse de que los ficheros no están plegados por defecto
set nofoldenable
"Guardar la configuración de pliegues cada vez que se sale
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview



" Configuración corrector
setlocal nospell
set spelllang=es,en_us


"Mapeo para corregir palabras con errores en el modo insert pulsando Ctrl - L
"Cambia la palabra por la primera corrección que propone el corrector
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"Salta al último error con [s, después coge la última sugerencia con 1z=, y
"finalmente vuelve a donde estaba el cursor al principio con `]a. El comando
"<c-g>u en medio hace que sea posible deshacer la corrección fácilmente.

"Configuración concealing
" set conceallevel=2
" hi clear Conceal



"Wrap text
set wrap linebreak

"Desactivar tabulador para YouCompleteMe
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


"Comandos para autocompletar {, ( y [
"inoremap { {}<ESC>hli
"inoremap ( ()<ESC>hli
"inoremap [ []<ESC>hli
"inoremap {<CR> {<Cr>}<ESC>ko

"Comandos para la color column
" set textwidth=100
" set colorcolumn=+1
set colorcolumn=0

"Alternativa para colorear las letras que se pasan de textwith
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


"http://vimcasts.org/episodes/show-invisibles/
"shortcut para activar rápidamente `set list`, que muestra los caracteres ocultos
nmap <leader>1 :set list!<CR>
"usar los mismos símbolos que en TextMate para tabstops y EOLs
set listchars=tab:▸\ ,eol:¬

"hacer que el registro sin nombre de vim sea el portapapeles
set clipboard=unnamedplus

" Permite trabajar con buffers ocultos, es decir
" que no tienen asignados ninguna ventana
set hidden



"TAGS
"Usar Ctrlp para buscar tags
" nnoremap <leader>. :CtrlPTag<cr>

"Ignora los ficheros de git para que vaya más rápido
let g:ctrlp_user_command = ['.git', 'git ls-files --cached --others --exclude-standard %s']

"Activar Tagbar
" nnoremap <silent> <C-m> :TagbarToggle<CR>
"Comando para llamar a ctags
command MakeTags :!ctags -R

"Actualizar automáticamente los tags cada vez que se guarda.
"No elimina los tags que ya no sirve, igual hace falta usar algún plugin
"autocmd BufWritePost *
"      \ if filereadable('tags') |
"      \   call system('ctags -a '.expand('%')) |
"      \ endif

"Define el directorio donde guardar los tags en Gutentags
let g:gutentags_ctags_tagfile = ".git/ctags"
let g:gutentags_ctags_extra_args = ['--tag-relative=no']


"Poder usar j y k para cambiar de línea cuando se usa softwrap
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

"Desactivar resaltado de la búsqueda al presionar doble <ESC>
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" Establece la tecla 'termwinkey'
" set termwinkey=<C-L>

"Aumenta el update time para que gitgutter vaya más rápido. El el delay con el que vim escribe el
"fichero de swap
set updatetime=400

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


nnoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


"Abrir .vimrc
nnoremap <leader>e  :e ~/.vimrc<CR>



" Vuelve a leer un fichero cuando es cambiado desde fuera

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



"Activa el Wild menu
set wildmenu
" Ignora los fichero compilados
set wildignore+=*/.git/*,*/.DS_Store

" La tecla backspace tiene un comportamiento poco intuitivo por defecto. Por ejemplo,
" no se puede hacer borrar antes del punto de inserción establecido por 'i'.
" Con esta configuración se puede hacer backspace en cualquier sitio
set backspace=eol,start,indent

" Activa 256 colores en el terminal
" set t_Co=250


" Establece utf8 como codificación por defecto
set encoding=utf8
" Establece Unix como tipo de fichero estándar
set ffs=unix,dos,mac



" Comandos para buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT

map <leader>j :bnext<cr>
map <leader>k :bprevious<cr>

" Comandos para tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext


" Cambia al directorio del buffer que se está editando
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Elimina los caracteres  de Windows.
noremap <Leader>wm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" Establece el scrolloff (mínimo de líneas que debe haber bajo el cursor en todo momento)
set scrolloff=1

" Incrementa el historial para undo (por defecto es 50)
set history=1000

"set relativenumber
"set cursorline
"set cursorcolumn

set lazyredraw
set ttyfast

" Muestra el número de ocurrencias de la palabra buscada en la statusline
set shortmess-=S

"Activa el ratón para mover ventanas
" Con el modo i, el ratón se desactiva al entrar en i
set mouse=a

set title

" Usar Q para formatear el parrafo o selección actual
vmap Q gq
nmap Q gqap

set showcmd


" Permite guardar el historial de undo y que sea persistente
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" noremap <space> :
" map <CR> <leader>
map <space> <leader>

" Configuración de closetags
" Extensiones de ficheros para los que está activado
let g:closetag_filenames = '*.html,*xml'
" Tipos de ficheros para los que está activado
let g:closetag_filetypes = 'html,xhtml'

" Shortcut para cerrar tags
let g:closetag_shortcut = '>'

" Comando para escribir > sin cerrar la tag
let g:closetags_close_shortcut = '<leader>>'

" :command te below vertical terminal
:cnoremap Te below vertical terminal

tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>

" Desactiva Coc y la signcolumn
autocmd BufNew,BufEnter *.tex execute "silent! CocDisable"
autocmd BufLeave *.tex execute "silent! CocEnable"


" Configuación para ficheros .tex

autocmd BufEnter,BufNew *.tex colorscheme nord

" Configuración Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0

"Desactivar ALE para ficheros LaTeX
" " let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0}
" \}

" Configuración para los pliegues
let g:vimtex_fold_enabled=1

" Activa el spelling
autocmd BufEnter,BufNew *.tex setlocal spell

" Activa concealing
" a = accents/ligatures
" b = bold and italic
" d = delimiters
" m = math symbols
" g = Greek
" s = superscripts/subscripts
let g:tex_conceal='abdmgs'

"Algunos atajos para LaTeX
"autocmd FileType tex set autoindent
" Set the make program (rubber)
set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
" Mappings for compiling Latex file
autocmd BufEnter,BufNew *.tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
" nmap <buffer> <C-T> :!rubber --pdf --force --short %<CR>
autocmd BufEnter,BufNew *.tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
" nmap <buffer> C :!rubber --clean<CR>

"ir a la línea seleccionada en el pdf
autocmd BufEnter,BufNew *.tex map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>
"Poner automáticamente \item. Si se pulsa dos veces seguidas <CR>, se borra
"\item
autocmd BufEnter,BufNew *.tex set formatoptions=tcroqln
autocmd BufEnter,BufNew *.tex set comments+=b:\\item
autocmd BufEnter,BufNew *.tex inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>'

"Mode Settings
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"" Change cursor shape between insert and normal mode in iTerm2.app
" if $TERM_PROGRAM =~ "iTerm"
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" endif

" Configuración de Vim-Slime
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "clisp"
let g:slime_vimterminal_config = {"term_finish": "close"}

" Ignorar usar clases de equivalencia al buscar tildes
" https://vi.stackexchange.com/questions/7386/ignoring-diacritics-accents-when-searching
" cnoremap <expr> a getcmdtype() =~ '[?/]' ? '[[=a=]]' : 'a'
" Esta opición es mejor:
" cnoremap <CR> <C-\>e getcmdtype() =~ '[?/]' ? substitute(getcmdline(), '\a', '[[=\0=]]', 'g'): getcmdline()<CR><CR>

" Desactiva better whitespace
let g:better_whitespace_enabled=0

" " Reglas para Lexima
" " Insertar $ en fichero .tex
" call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
" call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
" call lexima#add_rule({'char': '<BS>', 'at': '\%#\$', 'delete': 1, 'filetype': 'tex'})

" " No expandir " ni ' cuando se ponen antes o después de una palabra
" " Que no se expanda ' después de una palabra está ya por defecto en
" " las reglas básicas
" call lexima#add_rule({'char': '"', 'at': '\w\%#'})
" call lexima#add_rule({'char': '"', 'at': '\%#\w'})
" call lexima#add_rule({'char': "'", 'at': '\%#\w'})

" Ir al final de la línea en insert mode
inoremap <C-e> <C-o>A
inoremap <C-g><C-g> <ESC>Ea

" Definir que programa se usa al usar K
setl keywordprg=:help

let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

let g:is_posix=1
