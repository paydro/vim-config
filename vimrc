syntax on
colorscheme idleFingers

set termguicolors
if !has("gui_running")
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
endif

set nocompatible
set modeline
set modelines=5


set noswapfile
set autowrite

" Default tab settings
set expandtab

" Indenting preferences
set smartindent
set autoindent
set ts=2 sw=2 " Default to 2 spaces per tab

" Enable mouse
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
set mouse=a

filetype plugin indent on

set number
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
set splitbelow
set splitright
set undolevels=8000

set nofoldenable " disable folding

" fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Auto complete
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
set sessionoptions-=blank

fu! SaveSession()
	let l:session_path="~/code/session.vim"
	exe "mksession! " . l:session_path
	echom "Session saved to " . l:session_path
endf

map <F5> :call SaveSession()<CR>

" Load files that have changed by default
set autoread

set rtp+=/opt/homebrew/opt/fzf
" NOTE: For this to find the correct files, the silver searcher must be
" installed and the appropriate FZF environment variables should be set. See
" ~/.profile.
map <Leader>t <Esc>:FZF --reverse<CR>

" lcd to current file directory
" map <Leader>d <Esc>:lcd %:p:h<CR>

" Opens NERDTree at the file's current directory
map <Leader>n <Esc>:NERDTree %:p:h<CR>

" Map <leader>p to NERDtree and auto resize-splits
" (backslash)p
map <Leader>p :NERDTreeToggle<CR><C-W>=

" Override default NERDCommenter comment command to use Toggle
" (I override <space> to clear search)
" See :help NERDCommenterFunctionalitySummary
map <Leader>cc <plug>NERDCommenterToggle

" Quickfix bindings with <Leader>q
map <Leader>qc :cclose<CR>
map <Leader>qn :cn<CR>
map <Leader>qp :cp<CR>

" Copy/paste with easier shortcut keys
" Paste with CTRL+SHIFT+v
" noremap <C-S-v> "+gP
" inoremap <C-S-v> <Esc>"+pa
" Copy with CTRL+SHIFT+c
" map <C-S-c> "+y

" Select all
noremap <C-a> ggVG

" Goyo
map <Leader>gg <Esc>:Goyo<CR>
map <Leader>gz <Esc>:Goyo 120x100%<CR>
map <Leader>gr <Esc>:Goyo 75%x100%<CR>

let g:ale_detail_to_floating_preview = 1
let g:ale_linters =  {
\ 'terraform': ['tflint'],
\ 'python': ['flake8', 'dmypy'],
\ 'go': ['staticcheck'],
\}

let g:ale_fix_on_save=1

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier'],
\  'javascriptreact': ['prettier'],
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'python': ['black'],
\  'go': ['goimports'],
\  'terraform': ['terraform'],
\}

" Show ALE commands
map <Leader>at <Plug>(ale_toggle)
map <Leader>ad <Plug>(ale_detail)
map <Leader>an <Plug>(ale_next_wrap)
map <Leader>ap <Plug>(ale_previous_wrap)

" vim-lsp settings

" Debugging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" This is annoying.
let g:lsp_document_highlight_enabled = 0

let g:lsp_experimental_workspace_folders = 1

" Notes:
" * Use virtualenv pylsp instead of global one from vim-lsp-settings.
"   pylsp must be installed in the project's virtualenv. Otherwise, it will
"   not be able to go to definitions for 3rd part packages. This is opposite
"   of how vim-lsp-settings wants to behave.
" * To set true/false, use 1/0. I think this works because in python
"   0 == False
" * Disable all of the plugins. I'm using vim-ale and I like how  it works.
let g:lsp_settings = {
\   'pylsp-all': {
\     'cmd': ['./venv/bin/pylsp', '-v', '--log-file', '/Users/pbui/pylsp.log'],
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8'],
\         'config': {'prefer_local': 1},
\         'plugins': {
\           'pycodestyle': {'enabled': 0},
\           'mccabe': {'enabled': 0},
\           'pyflakes': {'enabled': 0},
\           'flake8': {'enabled': 0},
\         },
\       },
\     },
\   }
\}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <leader>d <plug>(lsp-peek-definition)
  " nmap <buffer> gs <plug>(lsp-document-symbol-search)
  " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  " nmap <buffer> gr <plug>(lsp-references)
  " nmap <buffer> gi <plug>(lsp-implementation)
  " nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  " nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  " nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  let g:lsp_format_sync_timeout = 1000
  " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let NERDTreeSortOrder=[]
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '__pycache__$[[dir]]', '\.pyc$']

" NERD_commenters
let NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'sls': { 'left': '#' } }
let NERDDefaultAlign='left'

" html indenting
let g:html_indent_inctags = "video,source"

" Disable rails.vim abbreviations
let g:rails_no_abbreviations=0

" Python settings
" let python_highlight_all = 1
let g:black_virtualenv = "~/.virtualenv/black"

" python-mode
let g:pymode_options = 0 " Don't use default options
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_doc = 0 " Hit 'K' for documentation
let g:pymode_breakpoint = 1 " use <leader>b to input breakpoint
let g:pymode_lint = 0 " Use ALE/vim-lsp
let g:pymode_lint_on_write = 0 " Use ALE/vim-lsp
let g:pymode_options_colorcolumn = 0
" let g:pymode_options_max_line_length = 89
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_virtualenv = 1
let g:pymode_run = 0 " I don't need this binding. I run code separately

let g:polyglot_is_disabled = {'go': 1}

"let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_command = "gofmt"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" json-vim
let g:vim_json_syntax_conceal = 0

" ack.vim with the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" vim-closetags
let g:closetag_filenames = '*.html.erb,*.html,*.xhtml,*.html,*.tmpl'
let g:closetag_filetypes = 'html,xhtml,gohtmltmpl'

" vim-ruby settings
let ruby_operators = 1
let ruby_pseudo_operators = 1

augroup vimrc
  au!
  " vim's smartindent auto-removes indentation with #. This fixes it.
  " See :help smartindent
  autocmd BufRead *.py inoremap # X<c-h>#

  " Remove all trailing whitespaces when saving a file
  autocmd BufWritePre * :%s/\s\+$//e

  " tw=88 to better gq comments
  au BufNewFile,BufRead */plangrid/plangrid-forge/*.py set textwidth=88

  " Filetypes
  au BufNewFile,BufRead *.less set filetype=less
  au BufNewFile,BufRead *.ejs set filetype=eruby
  au BufNewFile,BufRead *.vcl set filetype=conf
  au BufNewFile,BufRead *.vcl.erb set filetype=conf
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
  au BufRead *.js set ts=2 sw=2 sts=2 expandtab
  au BufRead *.json set ts=2 sw=2 sts=2 expandtab
  au BufRead *.jst set ts=2 sw=2 sts=2 expandtab
  au BufRead *.tpl set ts=2 sw=2 sts=2 expandtab
  au BufRead *.coffee set ts=2 sw=2 sts=2 expandtab
  au BufRead *.c set ts=4 sw=4 sts=4 expandtab
  au BufRead *.php set ts=4 sw=4 sts=4 expandtab

  au BufRead *.go set ts=4 sw=4 sts=4 noexpandtab formatoptions+=cr
  au BufRead *.tmpl set ft=gohtmltmpl ts=2 sw=2 sts=2 expandtab
  au FileType go nmap <leader>r <Plug>(go-test)
  au FileType go nmap <leader>w <Plug>(go-doc-browser)
  au FileType go nmap <leader>b <Plug>(go-build)

  " Autowrap text in markdown files
  au BufRead,BufNewFile *.md setlocal textwidth=80 ts=2 sw=2 sts=2 expandtab

  " Bats
  au BufRead,BufNewFile *.bats set ft=sh

  au BufNewFile,BufRead */workspace/patreon_react_features/*.js set ts=4 sw=4 sts=4
  au BufNewFile,BufRead */workspace/patreon_react_features/*.ts set ts=4 sw=4 sts=4
  au BufNewFile,BufRead */workspace/patreon_react_features/*.tsx set ts=4 sw=4 sts=4
  au BufNewFile,BufRead */workspace/patreon_react_features/*.jsx set ts=4 sw=4 sts=4
  au BufNewFile,BufRead */patreon_react_features/.circleci/*.yml set ts=4 sw=4 sts=4

  " au VimLeave * :call SaveSession()

augroup END
