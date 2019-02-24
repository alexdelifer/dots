"  __   __   __     __    __
" /\ \ / /  /\ \   /\ "-./  \
" \ \ \'/   \ \ \  \ \ \-./\ \
"  \ \__|    \ \_\  \ \_\ \ \_\
"   \/_/      \/_/   \/_/  \/_/
"
"
" Settings
"
syntax on
filetype indent on
set encoding=utf-8
set complete=.,w,b,u,t,i,kspell " add spelling from kspell for txt files
" Arch linux is ahead of their time...
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'

set laststatus=2 " show airline always
" forgot to sudo?
cmap WW w !sudo tee > /dev/null %

set modeline
set lazyredraw
set splitbelow
set splitright
set nocompatible
set hidden
set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
"set cursorline
set synmaxcol=128
syntax sync minlines=256
set wildmenu
set showmatch
set mouse=a
set incsearch
set relativenumber
set showmode!
" Ignore a bunch of useless shit
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set list
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set timeoutlen=1000 ttimeoutlen=0 " Gotta go fast!

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:netrw_banner=0 " hide the ugly ass header on the file browser... sorry

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:ctrlp_user_command="ag --hidden %s"
"let g:ctrlp_use_caching=0
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'

let NERDTreeHijackNetrw = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1 " may slow things down but damn it makes it prettier
" Thanks xero
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_left_sep = '▓▒░'
" let g:airline_right_sep = '░▒▓'
" let g:airline_left_alt_sep = '▒'
" let g:airline_right_alt_sep = '░'

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'  : '#(battery)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}
" let g:tmuxline_separators = {
"     \ 'left' : '█▓░',
"     \ 'left_alt': '',
"     \ 'right' : '░▒▓',
"     \ 'right_alt' : '',
"     \ 'space' : ' '}


let g:airline_theme='minimalist'

" git-gutter http://git.io/vimgitgutter
" " speed optimizations
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_max_signs = 1500
let g:gitgutter_diff_args = '-w'
" custom syms
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = ':'


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

if exists('$TMUX')
    " allows cursor change in tmux mode
    " let &t_SI = "Ptmux;]50;CursorShape=1\x7\\"
    " let &t_EI = "Ptmux;]50;CursorShape=0\x7\\\"
    " let &t_SI = "[3 q"
    " let &t_EI = "[0 q"
    " Italics in tmux
    set t_ZH=[3m
    set t_ZR=[23m
else
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" dafuq is  <-- ins <c-v> Esc
set t_Co=256
if !($TMUX)
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
endif




" Plugs
call plug#begin('~/.config/nvim/plugged')
" Trim this shit before it gets out of hand...
Plug 'yuratomo/w3m.vim'
" Compatibility
Plug 'jszakmeister/vim-togglecursor'
Plug 'tmux-plugins/vim-tmux'
"Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux'
" Search and FZF
Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'Shougo/neomru.vim'
Plug 'https://git.delifer.ca/alex/vim-denite-z'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'yegappan/mru'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Syntax and Corrections
Plug 'PProvost/vim-ps1'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pearofducks/ansible-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "Can we live
" without
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neco-vim'
Plug 'Shougo/vimshell.vim'
Plug 'w0rp/ale'
Plug 'reedes/vim-lexical'
" NERDSuite
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular' " Learn to use
" Useful
Plug 'dietsche/vim-lastplace'
Plug 'majutsushi/tagbar' " deps: ctags
Plug 'sickill/vim-pasta' " p p?
Plug 'rhysd/committia.vim'
Plug 'vim-utils/vim-man'
" Git
Plug 'tpope/vim-fugitive' " git so gud
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
" Compile
Plug 'tpope/vim-dispatch'
" Pretty
Plug 'beigebrucewayne/Turtles' " Colorscheme
Plug 'ayu-theme/ayu-vim' 
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'yggdroot/indentline'
Plug 'junegunn/vim-emoji'
Plug 'mhinz/vim-startify'
Plug 'chrisbra/Colorizer' " #FFFFFF Colors to colors
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
" Movement
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors' " ctrl-n
Plug 'tpope/vim-surround' " cs\"'
Plug 'justinmk/vim-sneak' " s 
Plug 'tpope/vim-repeat' " . repeat last motion
" LOL

call plug#end()
" You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto


let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
    set completefunc=emoji#complete

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction
" Markdown-Preview
let g:mkdp_path_to_chrome = "$BROWSER"
    " path to the chrome or the command to open chrome(or other modern browsers)

let g:mkdp_auto_start = 0
    " set to 1, the vim will open the preview window once enter the markdown
    " buffer

" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '*'
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:lexical#spell_key = '<leader>S'
" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)

" Neo Complete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1


"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Denite
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Define alias
call denite#custom#alias('source', 'git', 'file_rec')
call denite#custom#var('git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard', '2>&1', '>/dev/null'])
" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#source('z', 'sorters', ['sorter_z'])
command! -nargs=+ -complete=command Z
  \ call denite#start([{'name': 'z', 'args': [<q-args>]}])

" Keybinds 
let mapleader = ","
nnoremap <C-p> :Denite buffer git file_rec file_mru z::frecent unite:tmuxcomplete -highlight-mode-insert=Search<CR>

" BufMRU
imap <A-B> <Esc>:BufMRUPrev<CR>
imap <A-b> <Esc>:BufMRUNext<CR>
map <A-B>  :BufMRUPrev<CR>
map <A-b>  :BufMRUNext<CR>
map <Esc>B :BufMRUPrev<CR>
map <Esc>b :BufMRUNext<CR>

" TmuxNavigator let's you navigate between tmux panes and vim splits as if
" they were one 
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>


" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

map <F4> :NERDTreeToggle<CR>
map <C-c> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>

nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

nnoremap <leader>p p`[v`]=
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .gitignore -l -g ""'

" set background=dark
set termguicolors

"colorscheme turtles
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
colorscheme ayu
let ayucolor="dark"   " for dark version of theme
hi NonText ctermfg=7 guifg=gray

highlight Comment cterm=italic

tnoremap <Esc> <C-\><C-n>
tnoremap <c-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <c-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <c-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <c-l> <C-\><C-n>:TmuxNavigateRight<cr>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Filetype settings
au BufRead,BufNewFile *.asm set filetype=nasm nowrap
