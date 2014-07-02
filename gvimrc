"""""""""""""""
" Vi Settings "
"""""""""""""""

set nocompatible
set modelines=0

set background=light
colorscheme idleFingers
"colorscheme macvim

syntax on

" Don't use .swp files
set noswapfile

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set nonumber
" set number

" Show relative line numbers
set relativenumber
set numberwidth=3

" Stop blinking cursor
" set guicursor=a:blinkon0

" Always display status bar
set laststatus=2

" Hide balloon tooltips
set noballooneval

" Hide menubar
"set go-=T

" Hide scroll bars
set guioptions=Acge

filetype on
filetype indent plugin on

" Default window size
set lines=60
set columns=203
"
" Set font
"set guifont=Bitstream_Vera_Sans_Mono:h12
"set guifont=Inconsolata-dz:h12
set guifont=Menlo:h12
"set guifont=Ubuntu_Mono:h13
set linespace=0

" Highlight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

set undolevels=1000

set splitbelow
set splitright

set cursorline

set runtimepath+=$GOROOT/misc/vim


" Jump to the last position in the file on open
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif


""""""""""""
" Mappings "
""""""""""""
map <F5> <Esc>:set columns=80<CR>
map <F6> <Esc>:set columns=114<CR>
map <F7> <Esc>:set columns=162<CR>
map <F8> <Esc>:set columns=192<CR>
map <F9> <Esc>:set columns=274<CR>
map <Leader>d <Esc>:lcd %:p:h<CR>
map <Leader>n <Esc>:NERDTree %:p:h<CR>
map <Leader>j <Esc>%!python -m json.tool<CR>

" For 8tracks
map <F11> <Esc>:au BufRead *.js set ts=2 sw=2 sts=2 expandtab<CR>

fu! AddERB()
  execute "normal \<Esc>a<% %>\<Esc>hh"
  execute "startinsert"
endf

imap <D-lt> <Esc>:call AddERB()<CR>
imap <D->> <C-x><Space>

" Map TextMate indent keys with vim
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


" Map <leader>p to NERDtree
" (backslash)p
map <D-P> :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <D-/> <plug>NERDCommenterToggle

" Helps NERDCommenter determine comment characters
filetype plugin on

" NERD_commenters
let NERDSpaceDelims=1

" NERDTree
" Change cwd as you change directories
" See :help nerdtree
"let NERDTreeChDirMode=2

" List all files/directories in alphabetical order.
" Allows directories and files with the same name to appear next to
" each other.
let NERDTreeSortOrder=[]

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_no_abbreviations=0

" Command-T Options
if has("gui_macvim")
  map <Leader>t :CommandT<CR>
  map <D-r> :CommandTFlush<CR>
endif

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

"# Coffeescript syntax highlighting
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" Remove all trailing whitespaces when saving a file
autocmd BufWritePre * :%s/\s\+$//e

" Lesscss files (*.less)
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.ejs set filetype=eruby
au BufNewFile,BufRead *.vcl set filetype=conf
au BufNewFile,BufRead *.vcl.erb set filetype=conf
au BufNewFile,BufRead *.q set filetype=sql
"au BufNewFile,BufRead *.jst set filetype=html ts=2 sw=2 sts=2 expandtab

" Tabbing rules
au BufRead *.rb set ts=2 sw=2 sts=2 expandtab
au BufRead *.py set ts=4 sw=4 sts=4 expandtab
au BufRead *.erb set ts=2 sw=2 sts=2 expandtab
au BufRead *.css set ts=2 sw=2 sts=2 expandtab
au BufRead *.ru set filetype=ruby
au BufRead *.js set ts=2 sw=2 sts=2 expandtab
au BufRead *.json set ts=2 sw=2 sts=2 expandtab
au BufRead *.jst set ts=2 sw=2 sts=2 expandtab
au BufRead *.tpl set ts=2 sw=2 sts=2 expandtab
au BufRead *.coffee set ts=2 sw=2 sts=2 expandtab
au BufRead *.c set ts=4 sw=4 sts=4 expandtab
au BufRead *.php set ts=4 sw=4 sts=4 expandtab
"au BufRead *.as set ts=4 sw=4 sts=4 noexpandtab
au BufRead *.go set ts=4 sw=4 sts=4 noexpandtab
au BufRead,BufNewFile *.go set filetype=go

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Let fugitive.vim show me git status
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
