set nocompatible

colorscheme idleFingers
set linespace=1

syntax on

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set number

" Hide menubar
set go-=T

filetype on
filetype indent on

" Default window size
set lines=40
set columns=85

" Set font
"set guifont=ProFontX:h9
"set guifont=Menlo:h11
"set guifont=Bitstream_Vera_Sans_Mono:h11
set guifont=Bitstream_Vera_Sans_Mono:h12

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

""""""""""""
" Mappings "
""""""""""""

" Allow for Command + < to pring out <%= x %> with the cursor
" set at "x"
"imap <D-lt> <%=  %><Esc>hhi

"fu! AddOutputERB()
"  execute "normal \<Esc>a<%=  %>\<Esc>hh"
"  execute "startinsert"
"endf

fu! AddERB()
  execute "normal \<Esc>a<% %>\<Esc>hh"
  execute "startinsert"
endf

imap <D-lt> <Esc>:call AddERB()<CR>
imap <D->> <C-x>/

" Map TextMate indent keys with vim
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" FuzzyFinder Textmate
" (backslash)t
map <Leader>r :FuzzyFinderTextMate<CR>

" PeepOpen
map <Leader>t <Plug>PeepOpen

" Map <leader>p to NERDtree
" (backslash)p
map <Leader>p :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <D-/> <plug>NERDCommenterToggle

" NERD_commenters
let NERDSpaceDelims=1

" Disable rails.vim abbreviations
let g:rails_abbreviations=0

" FuzzyFinderTexmate Options
" --------------------------
" Reduce number of entries found for speed
let g:FuzzyFinderOptions.Base.enumerating_limit = 25
" Increase number of files FuzzyFinder can load
let g:fuzzy_ceiling = 40000

" Ignore vendor directory
let g:fuzzy_ignore = 'vendor/*'

" Remove all trailing whitespaces when saving a file
autocmd BufWritePre * :%s/\s\+$//e

" Lesscss files (*.less)
au BufNewFile,BufRead *.less set filetype=less

" Tabbing rules
au BufRead *.rb set ts=2 sw=2 sts=2
au BufRead *.js set ts=4 sw=4 sts=4

" Let fugitive.vim show me git status
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
