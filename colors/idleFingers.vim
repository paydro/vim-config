" idleFingers Vim Colorsheme
" This file attempts to match the Textmate color scheme idleFingers 
" (http://idlefingers.co.uk/)
" 
" This file was NOT created by the maintainer of idleFingers, it just
" tries to copy the color style for MacVim usage.

" Init
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "idleFingers"

" Allows ruby syntax highlighting for operators
" NOTE: There are some additions to the syntax/ruby.vim to allow for
"       idleFingers colorscheme to work.  
let ruby_operators=1

" GUI colors

hi Cursor               guibg=#91FF00
hi CursorIM             guifg=NONE guibg=#ff83fa
hi Directory            guifg=#e0ffff
hi DiffAdd              guibg=#528b8b
hi DiffChange           guibg=#8b636c
hi DiffDelete           gui=bold guifg=fg guibg=#000000
hi DiffText             gui=bold guibg=#6959cd
hi ErrorMsg             gui=bold guifg=#D8D8D8 guibg=#ff0000
hi VertSplit            guifg=#323232 guibg=#f0e68c
hi Folded               guifg=#000000 guibg=#bdb76b
hi FoldColumn           guifg=#000000 guibg=#bdb76b
hi SignColumn           gui=bold guifg=#bdb76b guibg=#20b2aa
hi IncSearch            gui=bold guifg=#000000 guibg=#D8D8D8
hi LineNr               gui=bold guifg=#888888 
hi ModeMsg              gui=bold
hi MoreMsg              gui=bold guifg=#20b2aa
hi NonText              gui=bold guifg=#D8D8D8
hi Normal               guibg=#323232 guifg=#D8D8D8
hi Question             gui=bold guifg=#ff6347
hi Search               gui=bold guifg=#000000 guibg=#ffd700
hi SpecialKey           guifg=#00ffff
hi StatusLine           gui=bold guifg=#f0e68c guibg=#000000
hi StatusLineNC         guibg=#f0e68c guifg=#666666
hi Title                gui=bold guifg=#ff6347
hi Visual               guibg=#666666
hi VisualNOS            gui=bold guifg=#000000 guibg=fg
hi WarningMsg           guifg=#D8D8D8 guibg=#ff6347
hi WildMenu             gui=bold guifg=#000000 guibg=#ffff00


" Colors for syntax highlighting
hi Comment              guifg=#BC9458

hi Constant             guifg=#6C99BB
    hi String           guifg=#A5C261
    hi Character        guifg=#6C99BB
    hi Number           guifg=#6C99BB
    hi Boolean          guifg=#6C99BB
    hi Float            guifg=#6C99BB

hi Identifier           guifg=#afeeee
    hi Function         guifg=#FFF980

hi Statement            gui=bold guifg=#FFC66D
    hi Conditional      gui=bold guifg=#CC7833 
    hi Repeat           gui=bold guifg=#CC7833
    hi Label            gui=bold guifg=#CC7833
    hi Operator         gui=bold guifg=#CC7833
    hi Keyword          gui=bold guifg=#CC7833
    hi Exception        gui=bold guifg=#CC7833

hi PreProc              guifg=#CC7833
    hi Include          guifg=#CC7833
    hi Define           guifg=#CC7833
    hi Macro            guifg=#CC7833
    hi PreCondit        guifg=#CC7833

hi Type                 gui=bold guifg=#FFF980
    hi StorageClass     guifg=#FFF980
    hi Structure        guifg=#FFF980

hi Special              guifg=#ff6347
    " Underline Character
    hi SpecialChar      gui=underline guifg=#7fffd4
    hi Tag              guifg=#ff6347
    "Statement
    hi Delimiter        gui=bold guifg=#D8D8D8
    " Bold comment (in Java at least)
    hi SpecialComment   gui=bold guifg=#da70d6
    hi Debug            gui=bold guifg=#ff0000

hi Underlined           gui=underline

hi Ignore               guifg=bg

hi Error                gui=bold guifg=#D8D8D8 guibg=#ff0000

hi Todo                 gui=bold guifg=#323232 guibg=#BC9458

" Ruby syntax
hi rubyConditionalExpression guifg=#D8D8D8
hi rubyMethod           guifg=#D8D8D8
hi rubyInstanceVariable guifg=#B7DFF8
hi rubyRailsMethod      guifg=#B83426
hi rubyStringDelimiter  guifg=#A5C261
hi rubyControl          guifg=#CC7833
hi rubyIdentifier       guifg=#B7DFF8
hi link rubyAccess Keyword
hi link rubyAttribute Keyword
hi link rubyBeginEnd Keyword
hi link rubyEval Keyword
hi link rubyException Keyword
hi clear rubyBracketOperator

" Rails
hi railsStringSpecial guifg=#6EA533

" ERuby syntax
hi erubyRailsMethod     guifg=#B83426
hi erubyRailsRenderMethod guifg=#B83426

" HTML syntax
hi htmlTag              guifg=#FFE5BB
hi htmlTagName          guifg=#FFC66D
hi htmlEndTag           guifg=#FFE5BB
hi htmlArg              guifg=#FFE5BB
hi Title                guifg=#D8D8D8
hi link htmlSpecialTagName htmlTagName

" CSS syntax
hi cssTagName         guifg=#FFC66D
hi cssBraces          guifg=#D8D8D8
hi cssSelectorOp      guifg=#A5C261
hi cssSelectorOp2     guifg=#A5C261
hi cssInclude         guifg=#CC7833
hi cssFunctionName    guifg=#B83426
hi cssClassName       guifg=#D8D8D8
hi cssIdentifier      guifg=#D8D8D8
hi cssComment         guifg=#EEEEEE guibg=#575757
    " Let right hand side be the same color
    hi link cssFontAttr Constant
    hi link cssCommonAttr Constant
    hi link cssFontDescriptorAttr Constant
    hi link cssColorAttr Constant
    hi link cssTextAttr Constant
    hi link cssBoxAttr Constant
    hi link cssGeneratedContentAttr Constant
    hi link cssAuralAttr Constant
    hi link cssPagingAttr Constant
    hi link cssUIAttr Constant
    hi link cssRenderAttr Constant
    hi link cssTableAttr Constant

" Javascript syntax
hi javaScriptIdentifier guifg=#6C99BB
hi javaScriptType guifg=#FFC66D
hi javaScriptValue guifg=#6C99BB
hi link javaScriptBraces Normal
hi link javaScript Normal
hi link javaScriptStatement Keyword
hi link javaScriptFunction Keyword

" NERDTree coloring
hi treeDir guifg=#FFC66D 
hi treeDirSlash guifg=#FFC66D

