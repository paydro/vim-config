"""""""""""""""
" Vi Settings "
"""""""""""""""

set nocompatible
set modeline
set modelines=5

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
"set nonumber
set number

" Show relative line numbers
" If used with number, will show relative and current line no.
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
set guioptions=Ace

" Helper function to return basename of cwd.
function! GetParentDir()
    return fnamemodify(getcwd(), ':t')
endfunction

set guitablabel=%M%{GetParentDir()}

filetype on
filetype indent plugin on

" Default window size
"set lines=50
"set columns=280
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

set undolevels=8000

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
map <Leader>d <Esc>:lcd %:p:h<CR>
map <Leader>n <Esc>:NERDTree %:p:h<CR>
map <Leader>j <Esc>%!python -m json.tool<CR>

" For 8tracks
map <F11> <Esc>:au BufRead *.js set ts=2 sw=2 sts=2 expandtab<CR>

" Save plangrid coding session
fu! PGSaveSession()
	let l:session_path="~/code/plangrid/pg.vim"
	exe "mksession! " . l:session_path
	echom "Session saved to " . l:session_path
endf

map <F5> :call PGSaveSession()<CR>

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

" LCD to 8tracks code
map <Leader>c <Esc>:lcd ~/code/8tracks<CR>

" Helps NERDCommenter determine comment characters
filetype plugin on

" NERD_commenters
let NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'sls': { 'left': '#' } }

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

map <Leader>s :e ~/Desktop/ruby_scratch.rb<CR>

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

" Reactjs
let g:jsx_ext_required = 0

"# Coffeescript syntax highlighting
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Save session on quitting Vim
"autocmd VimLeave * NERDTreeClose
"autocmd VimLeave * mksession! ~/.vim/sessions/latest.vim

