set nocompatible

colorscheme idleFingers
set linespace=0

syntax on

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set nonumber

" Stop blinking cursor
set guicursor=a:blinkon0

" Hide balloon tooltips
set noballooneval

" Hide menubar
"set go-=T

" Hide scroll bars
set guioptions=Acge

filetype on
filetype indent on

" Default window size
set lines=60
set columns=160

" Set font
"set guifont=Bitstream_Vera_Sans_Mono:h12
set guifont=Inconsolata-dz:h12

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

" Jump to the last position in the file on open
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

""""""""""""
" Mappings "
""""""""""""

map <F8> <Esc>:set columns=80<CR>
map <F7> <Esc>:set columns=113<CR>
map <F6> <Esc>:set columns=192<CR>
map <F5> <Esc>:set columns=162<CR>

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

" Map vim-markdown-preview
map <Leader>p :Mm<CR>

" Map <leader>p to NERDtree
" (backslash)p
map <D-P> :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <D-/> <plug>NERDCommenterToggle

" Helps NERDCommenter determine comment characters
filetype plugin on

" NERD_commenters
let NERDSpaceDelims=1

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_abbreviations=0

" Command-T Options
if has("gui_macvim")
  map <Leader>t :CommandT<CR>
  map <D-r> :CommandTFlush<CR>
endif

let g:CommandTMaxFiles=40000
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=20

" Coffeescript syntax highlighting
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" Remove all trailing whitespaces when saving a file
autocmd BufWritePre * :%s/\s\+$//e

" Lesscss files (*.less)
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.ejs set filetype=eruby

" Tabbing rules
au BufRead *.rb set ts=2 sw=2 sts=2 expandtab
au BufRead *.erb set ts=2 sw=2 sts=2 expandtab
au BufRead *.css set ts=2 sw=2 sts=2 expandtab
au BufRead *.ru set filetype=ruby
au BufRead *.js set ts=4 sw=4 sts=4 expandtab
au BufRead *.coffee set ts=2 sw=2 sts=2 expandtab
au BufRead *.c set ts=4 sw=4 sts=4 expandtab
au BufRead *.php set ts=4 sw=4 sts=4 expandtab
au BufRead *.as set ts=4 sw=4 sts=4 noexpandtab

" Let fugitive.vim show me git status
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
