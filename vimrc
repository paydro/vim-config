call pathogen#infect()

set nocompatible

"colorscheme adam

syntax on

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set nonumber

" Go related
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Show relative line numbers
"set relativenumber
set numberwidth=3

" Stop blinking cursor
" set guicursor=a:blinkon0

" Always display status bar
set laststatus=2

set ruler

" By default, the /usr/share/vim/vimrc sets this but it doesn't seem to
" work with my setup. Therefore we add this setting here.
" http://stackoverflow.com/questions/10727392/vim-not-allowing-backspace
set backspace=2 

autocmd FileType gitcommit set textwidth=72
