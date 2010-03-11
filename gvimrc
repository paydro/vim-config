set nocompatible

colorscheme idleFingers
set linespace=2

syntax on

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set nonumber

" Hide menubar
set go-=T

filetype on
filetype indent on

" Default window size
set lines=60
set columns=120

" Set font
"set guifont=ProFontX:h9
"set guifont=Menlo:h11
set guifont=Bitstream_Vera_Sans_Mono:h11

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

fu! AddOutputERB()
"        let l:current_line = getline(".")
"        let l:lt_equal = strridx(l:current_line, "<%=", col("."))
"        let l:lt_only = strridx(l:current_line, "<%", col("."))
"
"        if l:lt_equal != -1
"                let steps = col(".") - l:lt_equal - 3
"                execute "normal \<Esc>" . steps . "h"
"                execute "normal x" . steps . "l"
"                execute "startinsert"
"
"        elseif l:lt_only != -1
"                let steps = col(".") - l:lt_only - 3
"                execute "normal \<Esc>" . steps . "hi=\<Esc>"
"                execute "normal " . (steps+2) . "l"
"                execute "startinsert"
"        else
                " Add <%= %>
                execute "normal \<Esc>a<%=  %>\<Esc>hh"
                execute "startinsert"
"        endif
endf

imap <D-lt> <Esc>:call AddOutputERB()<CR>

" FuzzyFinder Textmate
" (backslash)t
map <Leader>t :FuzzyFinderTextMate<CR>

" Map <leader>p to NERDtree
" (backslash)p
map <Leader>p :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <D-/> <plug>NERDCommenterToggle

" NERD_commenters
let NERDSpaceDelims=1

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

au BufRead *.rb set ts=2 sw=2 sts=2
au BufRead *.js set ts=4 sw=4 sts=4

" Let fugitive.vim show me git status
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
