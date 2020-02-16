" Source dotfiles
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor


" Variables
colorscheme torte

" Syntax
syntax on
filetype indent on
set title

" Line Numbers
set nu

" Files
set encoding=utf-8


