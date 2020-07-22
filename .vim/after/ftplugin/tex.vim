" .tex files specific configuration
setlocal spell

" Some LaTeX shortcuts

" Set the make program (rubber)
set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
" Mappings for compiling Latex file
nmap <buffer> <C-T> :!latexmk -pdf %<CR>
" nmap <buffer> <C-T> :!rubber --pdf --force --short %<CR>
nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
" nmap <buffer> C :!rubber --clean<CR>

"ir a la línea seleccionada en el pdf
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>
"Poner automáticamente \item. Si se pulsa dos veces seguidas <CR>, se borra
"\item
set formatoptions=tcroqln
set comments+=b:\\item
inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>'
