set nocompatible              " be iMproved, required
map <C-S-c> gg"+yG

filetype on                  " required
autocmd FileType c map <buffer> <F9> :w<CR>:!clear; gcc -Wall -ansi -pedantic -O2 % -o exec%:r.out; ./exec%:r.out; rm *.out;<CR>
autocmd FileType javascript map <buffer> <F9> :w<CR> :!clear; node %;<CR>
autocmd FileType ruby map <buffer> <F9> :w<CR>:!clear;ruby  %;<CR>
autocmd FileType cpp map <buffer> <F9> :!clear; g++ % -o %:r.out; ./%:r.out;<CR>
autocmd FileType java map <buffer> <F9> :!clear; make<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'pangloss/vim-javascript'

Plugin 'othree/html5.vim'

" Plugin 'benekastah/neomake'

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'vim-airline/vim-airline'


Plugin 'scrooloose/nerdtree'

Plugin 'ternjs/tern_for_vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'flazz/vim-colorschemes'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'morhetz/gruvbox'

Plugin 'tpope/vim-commentary'
Bundle "myusuf3/numbers.vim"

Plugin 'takac/vim-hardtime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set encoding=utf-8
set laststatus=2
set mouse=a
set tabstop=2
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=2
set shiftround
set ignorecase
set showmatch
set smartcase
set smarttab
set hlsearch
set incsearch
set expandtab
set number
syntax on
nnoremap ; :
"let g:solarized_termcolors="256"
set background=dark
colorscheme gruvbox 

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:airline_powerline_fonts = 1

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" autocmd! BufWritePost,BufEnter * Neomake
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:airline_theme='gruvbox'

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" Easymotion shortcut
map <C-O> <Leader><Leader>w
map <C-E> <Leader><Leader>W

let g:hardtime_default_on = 0
"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register

autocmd FocusGained * let @z=@+
