" Author: Keith Smiley <k@keith.so>, w0rp <devw0rp@gmail.com>
" Description: dmypy support for optional python typechecking
"
" peter: This is based off of https://github.com/dense-analysis/ale/pull/3283
"
" This only works when the file is saved since --shadow-file currently reloads
" dmypy (i.e., not useful)

call ale#Set('python_dmypy_executable', 'dmypy')
call ale#Set('python_dmypy_ignore_invalid_syntax', 0)
call ale#Set('python_dmypy_show_notes', 1)
call ale#Set('python_dmypy_options', 'run --')
call ale#Set('python_dmypy_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('python_dmypy_auto_pipenv', 0)
call ale#Set('python_dmypy_auto_poetry', 0)

function! ale_linters#python#dmypy#GetExecutable(buffer) abort
    if (ale#Var(a:buffer, 'python_auto_pipenv') || ale#Var(a:buffer, 'python_dmypy_auto_pipenv'))
    \ && ale#python#PipenvPresent(a:buffer)
        return 'pipenv'
    endif

    if (ale#Var(a:buffer, 'python_auto_poetry') || ale#Var(a:buffer, 'python_dmypy_auto_poetry'))
    \ && ale#python#PoetryPresent(a:buffer)
        return 'poetry'
    endif

    return ale#python#FindExecutable(a:buffer, 'python_dmypy', ['dmypy'])
endfunction

" The directory to change to before running dmypy
function! ale_linters#python#dmypy#GetCwd(buffer) abort
    " If we find a directory with "mypy.ini" in it use that,
    " else try and find the "python project" root, or failing
    " that, run from the same folder as the current file
    for l:path in ale#path#Upwards(expand('#' . a:buffer . ':p:h'))
        if filereadable(l:path . '/mypy.ini')
            return l:path
        endif
    endfor

    let l:project_root = ale#python#FindProjectRoot(a:buffer)

    return !empty(l:project_root)
    \   ? l:project_root
    \   : expand('#' . a:buffer . ':p:h')
endfunction

function! ale_linters#python#dmypy#GetCommand(buffer) abort
    let l:executable = ale_linters#python#dmypy#GetExecutable(a:buffer)
    let l:exec_args = l:executable =~? 'pipenv\|poetry$'
    \   ? ' run dmypy'
    \   : ''

    return '%e' . l:exec_args
    \   . ale#Pad(ale#Var(a:buffer, 'python_dmypy_options'))
    \   . ' --show-column-numbers'
    \   . ' --show-error-codes'
    \   . ' %s'
endfunction

function! ale_linters#python#dmypy#Handle(buffer, lines) abort
    let l:dir = ale_linters#python#dmypy#GetCwd(a:buffer)
    " Look for lines like the following:
    "
    " file.py:4: error: No library stub file for module 'django.db'
    "
    " Lines like these should be ignored below:
    "
    " file.py:4: note: (Stub files are from https://github.com/python/typeshed)

    let l:types = 'error|warning'

    if ale#Var(a:buffer, 'python_dmypy_show_notes')
        let l:types = 'error|warning|note'
    endif

    let l:pattern = '\v^([a-zA-Z]?:?[^:]+):(\d+):?(\d+)?: ('
    \   . l:types
    \   . '): (.+)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        " Skip invalid syntax errors if the option is on.
        if l:match[5] is# 'invalid syntax'
        \&& ale#Var(a:buffer, 'python_dmypy_ignore_invalid_syntax')
            continue
        endif

        call add(l:output, {
        \   'filename': ale#path#GetAbsPath(l:dir, l:match[1]),
        \   'lnum': l:match[2] + 0,
        \   'col': l:match[3] + 0,
        \   'type': l:match[4] is# 'error' ? 'E' : (l:match[4] is# 'note' ? 'I': 'W'),
        \   'text': l:match[5],
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('python', {
\   'name': 'dmypy',
\   'executable': function('ale_linters#python#dmypy#GetExecutable'),
\   'cwd': function('ale_linters#python#dmypy#GetCwd'),
\   'command': function('ale_linters#python#dmypy#GetCommand'),
\   'callback': 'ale_linters#python#dmypy#Handle',
\   'output_stream': 'both'
\})
