filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ayu-theme/ayu-vim'
call vundle#end()
filetype plugin indent on

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

if exists('+termguicolors')
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors
endif

syntax on 	"set syntax highlighting on
set bg=dark	"default to dark background
set laststatus=2

if filereadable( expand("$HOME/.vim/bundle/ayu-vim/colors/ayu.vim") )
  let ayucolor="mirage"
  color ayu
endif

set showmatch "show matching brackets
set hlsearch "highlight when searching
set autochdir "automcatically change to directory of open file
set ignorecase "ignore case when searcing
set number "line numbers
set cindent 
set autoindent
set smartindent
set smarttab
set noexpandtab "actual tabs not spaces!
set tabstop=4 "tab width
set shiftwidth=2
set bs=indent,eol,start "make the backspace key actually work
set cinkeys=0{,0},:,0#,!^F
set nocompatible

if $TERM == "linux"
  let g:airline_powerline_fonts = 0
else
  let g:airline_powerline_fonts = 1
endif
  
let g:airline_theme='powerlineish'
