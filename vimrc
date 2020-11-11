"set rubydll=/usr/local/Cellar/ruby/2.5.1/lib/libruby.dylib
call pathogen#infect()

set nocompatible
set modeline
set modelines=5

colorscheme idlefingers

set noswapfile
set autowrite

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

" Highlight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Stop blinking cursor
" set guicursor=a:blinkon0

" Always display status bar
set laststatus=2

set ruler
set incsearch
set ignorecase
set smartcase
set autowrite
set splitbelow
set splitright
set undolevels=8000

set nofoldenable " disable folding

" Autocomplete
set completeopt=longest,menuone
inoremap <C-Space> <C-x><C-o>

" By default, the /usr/share/vim/vimrc sets this but it doesn't seem to work
" with my setup. Therefore we add this setting here.
" http://stackoverflow.com/questions/10727392/vim-not-allowing-backspace
set backspace=2

" Ignore node_modules in projects because they're fracking annoying.
set wildignore+=node_modules/**,*.pyc

" Don't save options. Pathogen manipulates this
set sessionoptions-=options
set sessionoptions-=buffers

" fzf
set rtp+=/usr/local/opt/fzf
map <Leader>t <Esc>:FZF<CR>

" lcd to current file directory
map <Leader>d <Esc>:lcd %:p:h<CR>
map <Leader>n <Esc>:NERDTree %:p:h<CR>
map <Leader>j <Esc>%!python -m json.tool<CR>

" Map <leader>p to NERDtree
" (backslash)p
map <Leader>p :NERDTreeToggle<CR>

" Use TextMate's commenting shortcut
map <Leader>/ <plug>NERDCommenterToggle

map <Leader>i :GoImports<CR>

function! Py2()
  let g:syntastic_python_python_exec = '/usr/local/bin/python2'
endfunction

function! Py3()
  " let g:syntastic_python_python_exec = '/Users/pbui/.virtualenvs/forge/bin/python3.6'
  let g:syntastic_python_python_exec = '/usr/local/bin/python3.7'
endfunction

call Py3()   " default to Py3 because I try to use it when possible

" Save plangrid coding session
fu! PGSaveSession()
	let l:session_path="~/code/plangrid/pg.vim"
	exe "mksession! " . l:session_path
	echom "Session saved to " . l:session_path
endf

let NERDTreeSortOrder=[]
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '__pycache__$[[dir]]', '\.pyc$']

" NERD_commenters
let NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'sls': { 'left': '#' } }

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_no_abbreviations=0

" Python settings
let python_highlight_all = 1
let g:black_virtualenv = "~/.virtualenv/black"

" python-mode
let g:pymode_options = 0 " Don't use default options
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_doc = 1 " Hit 'K' for documentation
let g:pymode_breakpoint = 1 " use <leader>b to input breakpoint
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'
let g:pymode_lint = 0 " Use syntastic instead
let g:pymode_lint_on_write = 0 " Do not lint
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1

" Shell settings
let g:syntastic_sh_checkers = ['shellcheck']

" Go settings
"let g:go_fmt_fail_silently = 1
" let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" json-vim
let g:vim_json_syntax_conceal = 0



augroup vimrc
  au!

  " Find the correct .flake8 file to use
  function! FindConfig(prefix, what, where)
      let cfg = findfile(a:what, escape(a:where, ' ') . ';')
      return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
  endfunction

  autocmd FileType python let b:syntastic_python_flake8_args =
      \ get(g:, 'syntastic_python_flake8_args', '') .
      \ FindConfig('--config', '.flake8', expand('%:p:h', 1))
  autocmd FileType gitcommit set textwidth=72

  autocmd FileType python let b:syntastic_python_flake8_args =
     \ get(g:, 'syntastic_python_flake8_args', '') .
     \ FindConfig('--config', '.flake8', expand('%:p:h', 1))

  " vim's smartindent auto-removes indentation with #. This fixes it.
  " See :help smartindent
  autocmd BufRead *.py inoremap # X<c-h>#

  " Remove all trailing whitespaces when saving a file
  autocmd BufWritePre * :%s/\s\+$//e

  " plangrid-forge repo settings
  " python black syntax format
  au BufWritePre */plangrid/plangrid-forge/*.py silent execute ':Black'

  " tw=88 to better gq comments
  au BufNewFile,BufRead */plangrid/plangrid-forge/*.py set textwidth=88

  au BufNewFile,BufRead *.less set filetype=less
  au BufNewFile,BufRead *.ejs set filetype=eruby
  au BufNewFile,BufRead *.vcl set filetype=conf
  au BufNewFile,BufRead *.vcl.erb set filetype=conf
  au BufNewFile,BufRead *.q set filetype=sql
  au BufNewFile,BufRead *.es6 set filetype=javascript

  " Tabbing rules
  au BufRead *.yml set ts=2 sw=2 sts=2 expandtab
  au BufRead *.yaml set ts=2 sw=2 sts=2 expandtab
  au BufRead *.rb set ts=2 sw=2 sts=2 expandtab
  au BufRead *.py set ts=4 sw=4 sts=4 expandtab formatoptions-=t formatoptions+=croql
  au BufRead *.erb set ts=2 sw=2 sts=2 expandtab
  au BufRead *.html set ts=2 sw=2 sts=2 expandtab
  au BufRead *.css set ts=2 sw=2 sts=2 expandtab
  au BufRead *.ru set filetype=ruby
  au BufRead *.jsonnet set ts=2 sw=2 sts=2 expandtab
  au BufRead *.libsonnet set ts=2 sw=2 sts=2 expandtab
  au BufRead *.jsonnet.TEMPLATE set ft=jsonnet ts=2 sw=2 sts=2 expandtab
  au BufRead *.js set ts=2 sw=2 sts=2 expandtab
  au BufRead *.json set ts=2 sw=2 sts=2 expandtab
  au BufRead *.jst set ts=2 sw=2 sts=2 expandtab
  au BufRead *.tpl set ts=2 sw=2 sts=2 expandtab
  au BufRead *.coffee set ts=2 sw=2 sts=2 expandtab
  au BufRead *.c set ts=4 sw=4 sts=4 expandtab
  au BufRead *.php set ts=4 sw=4 sts=4 expandtab

  au BufRead *.go set ts=4 sw=4 sts=4 noexpandtab
  au FileType go nmap <leader>r <Plug>(go-test)
  au FileType go nmap <leader>d <Plug>(go-doc)
  au FileType go nmap <leader>b <Plug>(go-build)

  au BufRead *.sls set formatoptions+=croql
  au BufRead,BufNewFile *.go set filetype=go

  " Autowrap text in markdown files
  au BufRead,BufNewFile *.md setlocal textwidth=80

  " Bats
  au BufRead,BufNewFile *.bats set ft=sh
augroup END

" syntastic + fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %#warningmsg#%{SyntasticStatuslineFlag()}%*\ %P

