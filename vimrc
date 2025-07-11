syntax on
colorscheme idleFingers

packadd! matchit

let HOMEDIR = $HOME

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

" Show # of matches when searching
set shortmess-=S

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

" Load files that have changed by default
set autoread

set rtp+=/opt/homebrew/opt/fzf
set rtp+=~/.fzf
" NOTE: For this to find the correct files, the silver searcher must be
" installed and the appropriate FZF environment variables should be set. See
" ~/.profile.
" Used with basic fzf plugin.
"map <Leader>t <Esc>:FZF --reverse<CR>
" Used with fzf.vim plugin
map <Leader>t <Esc>:Files<CR>
map <Leader>u <Esc>:Buffers<CR>
map <Leader>f <Esc>:RG<CR>

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)
command! -bar -bang -nargs=? -complete=buffer Buffers call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({"options": ['--layout=reverse'], "placeholder": "{1}" }), <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({"options": ['--layout=reverse']}), <bang>0)'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --colors='path:fg:0xFF,0xC6,0x6D' --colors='match:fg:black' --colors='match:bg:0x6c,0x99,0xbb' --colors='line:fg:white' --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)'
command! -bang -nargs=* RG call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --colors='path:fg:0xFF,0xC6,0x6D' --colors='match:fg:black' --colors='match:bg:0x6c,0x99,0xbb' --colors='line:fg:white' --smart-case -- ", <q-args>, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)


" lcd to current file directory
" map <Leader>d <Esc>:lcd %:p:h<CR>

" Opens NERDTree at the file's current directory
map <Leader>n <Esc>:NERDTree %:p:h<CR>

" Map <leader>p to NERDtree and auto resize-splits
" (backslash)p
map <Leader>p :NERDTreeToggle<CR><C-W>=

" Copy file path to + register (system clipboard if enabled)
map <Leader>cf :let @+ = expand("%")<CR>

" Copy to clipboard in normal mode
noremap <Leader>cc <Plug>OSCYankOperator

" Copy to clipboard in visual mode
vnoremap <Leader>cc <Plug>OSCYankVisual

" Quickfix bindings with <Leader>q
map <Leader>qc :cclose<CR>
map <Leader>qn :cn<CR>
map <Leader>qp :cp<CR>


" Select all
noremap <C-a> ggVG

" Ack commands
" Search for word at cursor
noremap <silent> <Leader>s :Rg <C-R><C-W><CR>
" Search for highlighted word

" Goyo
map <Leader>gg <Esc>:Goyo<CR>
map <Leader>gz <Esc>:Goyo 120x100%<CR>
map <Leader>gr <Esc>:Goyo 75%x100%<CR>

" vim-test
let test#strategy = "vimterminal"
let test#python#pytest#options = '-vv'
nmap <silent> <leader>rr :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rl :TestLast<CR>

" vim-lsp settings

" Debugging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" This is annoying.
let g:lsp_document_highlight_enabled = 0

let g:lsp_diagnostics_echo_delay = 100
let g:lsp_diagnostics_highlights_delay = 100
let g:lsp_diagnostics_signs_delay = 100
let g:lsp_document_code_action_signs_delay = 100

let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_wrap = "truncate"

let g:lsp_experimental_workspace_folders = 1

" Notes:
" * Use virtualenv pylsp instead of global one from vim-lsp-settings.
"   pylsp must be installed in the project's virtualenv. Otherwise, it will
"   not be able to go to definitions for 3rd part packages. This is opposite
"   of how vim-lsp-settings wants to behave.
" * To set true/false, use 1/0. I think this works because in python
"   0 == False
" * Disable all of the plugins. I'm using vim-ale and I like how  it works.
"
" TODO: This only works for python projects with a virtualenv. Plain python
" dirs will cause vim to start with errors.
let g:lsp_settings = {
\   'pylsp-all': {
\     'cmd': ['./venv/bin/pylsp', '-v', '--log-file', HOMEDIR . '/pylsp.log'],
\     'workspace_config': {
\       'pylsp': {
\         'configurationSource': ['flake8'],
\         'plugins': {
\           'pylsp_mypy': { 'enabled': 1, 'dmypy': 1, 'live_mode': 0 },
\           'flake8': { 'enabled': 1, 'executable': './venv/bin/flake8' },
\           'autopep8': { 'enabled': 0 },
\           'mccabe': { 'enabled': 0 },
\           'pycodestyle': { 'enabled': 0 },
\           'pyflakes': { 'enabled': 0 },
\         },
\       },
\     },
\   },
\   'typescript-language-server': {
\     'cmd': ['./cloudflare_worker/node_modules/.bin/typescript-language-server', '--stdio'],
\   }
\}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  nmap <buffer> <leader>d <plug>(lsp-document-diagnostics)
  nmap <buffer> <leader>a <plug>(lsp-code-action-float)

  nmap <buffer> <leader>ls <plug>(lsp-status)
  nmap <buffer> <leader>le <Esc>:call lsp#enable_diagnostics_for_buffer()<CR>
  nmap <buffer> <leader>ld <Esc>:call lsp#disable_diagnostics_for_buffer()<CR>

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.py,*.sh LspDocumentFormatSync
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
" Disable default mappings to allow "cc" bindings
let NERDCreateDefaultMappings=0
" Put back the only useful binding
noremap <Leader>c<space> <Plug>NERDCommenterToggle
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

  " Autowrap text in markdown files
  au BufRead,BufNewFile *.md setlocal textwidth=80 ts=2 sw=2 sts=2 expandtab

  " Bats
  au BufRead,BufNewFile *.bats set ft=sh

  au BufNewFile,BufRead */patreon_py/*.py set textwidth=88
  au BufNewFile,BufRead */patreon_py/*.ts set ts=4 sw=4 sts=4 expandtab textwidth=88
  au BufNewFile,BufRead */patreon_py/*.js set ts=4 sw=4 sts=4 expandtab textwidth=88


  au BufNewFile,BufRead */ansible/playbooks/group_vars/* set ft=yaml

  " au VimLeave * :call SaveSession()

augroup END
