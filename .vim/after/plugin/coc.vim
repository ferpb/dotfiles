" https://github.com/neoclide/coc.nvim#example-vim-configuration

" Node path
let g:coc_node_path = '/Users/user/.nvm/versions/node/v12.16.3/bin/node'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Don't pass messages to |ins-completion-menu|.
" This disables echoing completion messages on the command line
set shortmess+=c

" Signcolumn
set signcolumn=auto

function! SignColumnToggle()
    if &signcolumn == "yes"
        set signcolumn=auto
    else
        set signcolumn=yes
    endif
endfunction

command! SignColumnToggle call SignColumnToggle()


" Consider dashed identifiers when autocompleting (this-is-a-variable)
set iskeyword+=-


" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
" gr - find references
nmap <silent> gr <Plug>(coc-references)

"gy - go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" gi - go to implementation
nmap <silent> gI <Plug>(coc-implementation)


" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>


" rename the current word in the cursor
" coc-rename often only works locally, to rename a word in the whole
" project is better to use CocSearch and a replace command
nmap <leader>cr  <Plug>(coc-rename)
" Rename word in the whole project
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>


nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)


" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
