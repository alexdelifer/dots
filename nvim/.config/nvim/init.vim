" Source dotfiles
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor


" Variables

" Syntax
syntax on
filetype indent on
set title

" Files
set encoding=utf-8


