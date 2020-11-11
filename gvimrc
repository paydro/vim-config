"""""""""""""""
" Vi Settings "
"""""""""""""""

" MacVim comes bundled with a specific version of ruby so it has problems
" using command-t when a newer system ruby is installed.
" Use `gem environment` to find out where the current system ruby's
" installation path exists. Then find the dylib file.
"set rubydll=/usr/local/Cellar/ruby/2.5.1/lib/libruby.2.5.dylib

" Stop blinking cursor
" set guicursor=a:blinkon0

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

" Disable to beep on errors
set vb t_vb=

set undolevels=8000

set cursorline

set runtimepath+=$GOROOT/misc/vim

""""""""""""
" Mappings "
""""""""""""
map <Leader>d <Esc>:lcd %:p:h<CR>
map <Leader>n <Esc>:NERDTree %:p:h<CR>
map <Leader>j <Esc>%!python -m json.tool<CR>

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

"" NERD_commenters
"let NERDSpaceDelims=1
"let g:NERDCustomDelimiters = { 'sls': { 'left': '#' } }

" NERDTree
" Change cwd as you change directories
" See :help nerdtree
"let NERDTreeChDirMode=2

" List all files/directories in alphabetical order.
" Allows directories and files with the same name to appear next to
" each other.
"let NERDTreeSortOrder=[]

"" html indenting
"let g:html_indent_inctags = "video,source"
"
"" Disable rails.vim abbreviations
"let g:rails_no_abbreviations=0

" Command-T Options
" Update: 2019-03-03 Using FZF now.
" if has("gui_macvim")
"   map <Leader>t :CommandT<CR>
"   map <D-r> :CommandTFlush<CR>
" endif

"map <Leader>s :e ~/Desktop/ruby_scratch.rb<CR>

"let NERDTreeSortOrder=[]
"let NERDTreeShowBookmarks=1

"let g:CommandTMaxFiles=40000
"" This breaks window sizing with nerdtree toggled. Therefore, we need to
"" comment out a line in ruby/command-t/match_window.rb. Look for the
"" #restore_windown_dimensions and remove the line that sets
"" window.width = width.
"let g:CommandTMatchWindowAtTop=1
"let g:CommandTMaxHeight=20
"let g:CommandTMatchWindowReverse=0

" Python settings
"let python_highlight_all = 1

let g:black_virtualenv = "~/.virtualenv/black"

" Reactjs
let g:jsx_ext_required = 0

augroup gvimrc
  au!
  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
augroup END

" Save session on quitting Vim
"autocmd VimLeave * NERDTreeClose
"autocmd VimLeave * mksession! ~/.vim/sessions/latest.vim

" This expects the python installation to be installed via pyenv!
set pythonthreehome=/Users/pbui/.pyenv/versions/3.6.8/lib/python3.6
set pythonthreedll=/Users/pbui/.pyenv/versions/3.6.8/lib/python3.6/lib-dynload
