"Configuración para compilar archivos .lytex
autocmd BufEnter,BufNewFile *.lytex
    \ setf latex |
    \ map <leader>wl :w<CR> <bar> :! lilypond-book -o out -I out --pdf "%:p"<CR> <bar> :cd out<CR> <bar> :! pdflatex "%:p:h/out/%:t:r.tex"<CR> :cd ..<CR> |
    \ map <leader>li              :! lilypond-book -o out -I out --pdf "%:p"<CR> <bar> :cd out<CR> <bar> :! pdflatex "%:p:h/out/%:t:r.tex:<CR> :cd ..<CR> |


