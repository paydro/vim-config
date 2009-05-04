set nocompatible

colorscheme idleFingers

syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set sts=2

" Hide menubar
set go-=T

filetype on
filetype indent on

" Default window size
set lines=50
set columns=150

" Indenting preferences
set smartindent
set autoindent

" Set font
set guifont=ProFontX:h9

" Disable to beep on errors
set vb t_vb=

" Status bar
set ruler

" Incremental search
set incsearch
" make searches case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase

set autowrite

" Jump to the last position in the file on open
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" FuzzyFinder Textmate
map <Leader>t :FuzzyFinderTextMate<CR>

" Map <leader>p to NERDtree
map <Leader>p :NERDTreeToggle<CR>
