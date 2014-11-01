call pathogen#infect()

set nocompatible
set modeline
set modelines=5

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
set incsearch
set smartcase
set splitbelow
set splitright

" By default, the /usr/share/vim/vimrc sets this but it doesn't seem to work
" with my setup. Therefore we add this setting here.
" http://stackoverflow.com/questions/10727392/vim-not-allowing-backspace
set backspace=2


let NERDTreeSortOrder=[]

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_no_abbreviations=0


let NERDTreeSortOrder=[]
let NERDTreeShowBookmarks=1

let g:CommandTMaxFiles=40000
" This breaks window sizing with nerdtree toggled. Therefore, we need to
" comment out a line in ruby/command-t/match_window.rb. Look for the
" #restore_windown_dimensions and remove the line that sets
" window.width = width.
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=0

" Python settings
let python_highlight_all = 1

autocmd FileType gitcommit set textwidth=72
