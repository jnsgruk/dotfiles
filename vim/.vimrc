filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'catppuccin/vim'
call plug#end()

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

if filereadable( expand("$HOME/.vim/plugged/vim/colors/catppuccin_macchiato.vim") )
  color catppuccin_macchiato
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
set tabstop=2 "tab width
set shiftwidth=2
set bs=indent,eol,start "make the backspace key actually work
set cinkeys=0{,0},:,0#,!^F
set nocompatible

let g:lightline = {'colorscheme': 'catppuccin_macchiato'}
