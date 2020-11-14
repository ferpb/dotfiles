" Lexima configuration

" Insert $ in tex files
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\%#\$', 'delete': 1, 'filetype': 'tex'})

" Not expand " nor ', before or after a word
" Not expanding ' after a word it's built-in by default in the basic rules
call lexima#add_rule({'char': '"', 'at': '\w\%#"\@!'})
call lexima#add_rule({'char': '"', 'at': '\%#\w', 'input': '"'})
call lexima#add_rule({'char': '`', 'at': '\w\%#`\@!'})
call lexima#add_rule({'char': '`', 'at': '\%#\w', 'input': '`'})
call lexima#add_rule({'char': "'", 'at': '\%#\w', 'input': "'"})

" Don't expand ' in lilypond buffers
call lexima#add_rule({'char': "'", 'filetype': 'lilypond'})

" Disable triple expansion
call lexima#add_rule({'char': "'", 'at': "''\\%#"})
call lexima#add_rule({'char': '`', 'at': '``\%#'})
call lexima#add_rule({'char': '"', 'at': '""\%#'})
