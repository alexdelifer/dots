" Source dotfiles
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor

" Variables & Settings
syntax on
filetype indent on

" UI
set title 		" Set window title
set laststatus=2	" No Idea
set noshowmode 		" Hide -- INSERT --
set nu 			" Line Numbers

" Search & Substitute
set inccommand=nosplit 	" Realtime update
set hlsearch 		" Highlight search 

" Theme
set termguicolors 	" Enable 256 color support
let ayucolor="dark"
colorscheme ayu
" Override bg color to transparant :)
hi Normal guibg=NONE ctermbg=NONE

" Lightline Theme
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" IndentLine
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" Files
set encoding=utf-8


