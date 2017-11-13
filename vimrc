call pathogen#infect()

set nocompatible
set modeline
set modelines=5

colorscheme idlefingers

syntax on

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Line numbers
set number

" Go related
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Show relative line numbers
set relativenumber
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

set nofoldenable " disable folding

" By default, the /usr/share/vim/vimrc sets this but it doesn't seem to work
" with my setup. Therefore we add this setting here.
" http://stackoverflow.com/questions/10727392/vim-not-allowing-backspace
set backspace=2

" Map TextMate indent keys with vim
"nmap <D-[> <<
"nmap <D-]> >>
"vmap <D-[> <gv
"vmap <D-]> >gv

" Ignore node_modules in projects because they're fracking annoying.
set wildignore+=node_modules/**

" Don't save options. Pathogen manipulates this
set sessionoptions-=options
set sessionoptions-=buffers

" Map <leader>p to NERDtree
" (backslash)p
map <Leader>p :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <Leader>/ <plug>NERDCommenterToggle

map <Leader>i :GoImports<CR>

let NERDTreeSortOrder=[]

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_no_abbreviations=0


let NERDTreeSortOrder=[]
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '__pycache__$[[dir]]', '\.pyc$']

let g:CommandTMaxFiles=40000
" This breaks window sizing with nerdtree toggled. Therefore, we need to
" comment out a line in ruby/command-t/match_window.rb. Look for the
" #restore_windown_dimensions and remove the line that sets
" window.width = width.
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=0
let g:CommandTFileScanner='find'

" Python settings
let python_highlight_all = 1

" Go settings
"let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 0
let g:go_highlight_extra_types = 1

" json-vim
let g:vim_json_syntax_conceal = 0

autocmd FileType gitcommit set textwidth=72

" vim's smartindent auto-removes indentation with #. This fixes it.
" See :help smartindent
autocmd BufRead *.py inoremap # X<c-h>#

" Remove all trailing whitespaces when saving a file
autocmd BufWritePre * :%s/\s\+$//e

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.ejs set filetype=eruby
au BufNewFile,BufRead *.vcl set filetype=conf
au BufNewFile,BufRead *.vcl.erb set filetype=conf
au BufNewFile,BufRead *.q set filetype=sql
au BufNewFile,BufRead *.es6 set filetype=javascript

" Tabbing rules
au BufRead *.rb set ts=2 sw=2 sts=2 expandtab
au BufRead *.py set ts=4 sw=4 sts=4 expandtab formatoptions-=t formatoptions+=croql
au BufRead *.erb set ts=2 sw=2 sts=2 expandtab
au BufRead *.html set ts=2 sw=2 sts=2 expandtab
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
au BufRead *.sls set formatoptions+=croql
au BufRead,BufNewFile *.go set filetype=go

" Autowrap text in markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Let fugitive.vim show me git status
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" syntastic
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %#warningmsg#%{SyntasticStatuslineFlag()}%*\ %P

