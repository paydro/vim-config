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
set lines=100
set columns=200
"
" Set font
" set guifont=Monospace\ 9
" set linespace=1
set guifont=SFMono-Regular:h13
set linespace=1

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

" Copy/paste with easier shortcut keys
" Paste with CTRL+SHIFT+v
noremap <C-S-v> "+gP
inoremap <C-S-v> <Esc>"+pa
" Copy with CTRL+SHIFT+c
map <C-S-c> "+y

" CTRL-S to Save
noremap <C-s> :w<CR>


" Save plangrid coding session
fu! SaveSession()
	let l:session_path="~/code/session.vim"
	exe "mksession! " . l:session_path
	echom "Session saved to " . l:session_path
endf

map <F5> :call SaveSession()<CR>


augroup gvimrc
  au!
  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
augroup END
