" Based on Drew Neil's configuration: https://github.com/nelstrom/dotfiles/tree/master/vim

" To install minpac:
"    mkdir -p ~/.vim/pack/minpac/opt
"    cd ~/.vim/pack/minpac/opt
"    git clone https://github.com/k-takata/minpac

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus  packadd minpac | source $MYVIMRC | call minpac#status()


" Only executes this when you've donde packadd minpac
if !exists('*minpac#init')
	" If minpac isn't available, stop reading the file
	finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" Packages
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')

call minpac#add('junegunn/vim-easy-align')

call minpac#add('SirVer/ultisnips', {'type': 'opt'})
call minpac#add('honza/vim-snippets')

" Post-update hook
call minpac#add('junegunn/fzf', {'do': { -> fzf#install() }})
call minpac#add('junegunn/fzf.vim')

call minpac#add('lervag/vimtex')

call minpac#add('morhetz/gruvbox')
call minpac#add('lifepillar/vim-solarized8')
call minpac#add('altercation/vim-colors-solarized')

call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

call minpac#add('arcticicestudio/nord-vim')

call minpac#add('jpalardy/vim-slime')

call minpac#add('sheerun/vim-polyglot')

call minpac#add('cohama/lexima.vim')

call minpac#add('romainl/vim-cool')
