" idleFingers Vim Colorsheme
" This file attempts to match the Textmate color scheme idleFingers
" (http://idlefingers.co.uk/)
"
" This file was NOT created by the maintainer of idleFingers, it just
" tries to copy the color style for MacVim usage.

" Init
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "idleFingers"

" Allows ruby syntax highlighting for operators
" NOTE: There are some additions to the syntax/ruby.vim to allow for
"       idleFingers colorscheme to work.
"let ruby_operators=0

" GUI colors

hi Cursor               guibg=#FFFFFF
hi CursorIM             guifg=NONE guibg=#ff83fa
hi CursorLine           term=NONE cterm=NONE guibg=#333333
hi CursorLineNr         term=bold ctermfg=14 guifg=#999999
hi Directory            guifg=#FFC66D
hi DiffAdd              guibg=#165913
hi DiffChange           guibg=#593F13
hi DiffDelete           guibg=#591313 guifg=#9C2222
hi DiffText             guibg=#59B4CD
hi ErrorMsg             guifg=#D8D8D8 guibg=#ff0000
hi Folded               guifg=#999999 guibg=#444444
hi FoldColumn           guifg=#e8e8e8 guibg=#222222
hi SignColumn           guifg=#bdb76b guibg=#20b2aa
hi IncSearch            gui=bold guifg=#282828 guibg=#75aac8
hi LineNr               guifg=#777777 guibg=#282828
hi MatchParen           guifg=#FFFFFF guibg=#666666 gui=bold
hi ModeMsg              gui=NONE
hi MoreMsg              guifg=#20b2aa
hi NonText              guifg=#D8D8D8
hi Normal               guibg=#282828 guifg=#D8D8D8
hi Question             guifg=#ff6347
hi Search               guifg=#282828 guibg=#75aac8
hi SpecialKey           guifg=#00ffff
hi VertSplit            gui=bold guifg=#CCCCCC guibg=#484848
hi StatusLine           gui=bold guifg=#CCCCCC guibg=#484848
hi StatusLineNC         gui=none guifg=#CCCCCC guibg=#484848
hi Title                guifg=#ff6347
" hi Visual               guibg=#ff4671
hi Visual               guibg=#ff6565 guifg=#000000
hi VisualNOS            guifg=#000000 guibg=fg
hi WarningMsg           guifg=#D8D8D8 guibg=#ff6347
hi WildMenu             guifg=#000000 guibg=#ffff00
hi Pmenu                guibg=#444444
hi PmenuSel             guibg=#777777


" Colors for syntax highlighting
hi Comment              guifg=#BC9458

hi Constant             guifg=#6C99BB gui=NONE
    hi String           guifg=#A5C261
    hi Character        guifg=#6C99BB
    hi Number           guifg=#6C99BB
    hi Boolean          guifg=#6C99BB
    hi Float            guifg=#6C99BB

hi Identifier           guifg=#B7DFF8
    hi Function         guifg=#FFF980

hi Statement            guifg=#FFC66D
    hi Conditional      guifg=#CC7833
    hi Repeat           guifg=#CC7833
    hi Label            guifg=#CC7833
    hi Operator         guifg=#CC7833
    hi Keyword          guifg=#CC7833
    hi Exception        guifg=#CC7833

hi PreProc              guifg=#CC7833
    hi Include          guifg=#CC7833
    hi Define           guifg=#CC7833 gui=NONE
    hi Macro            guifg=#CC7833
    hi PreCondit        guifg=#CC7833

hi Type                 guifg=#FFF980 gui=NONE
    hi StorageClass     guifg=#FFF980
    hi Structure        guifg=#FFF980

hi Special              guifg=#ff6347
    " Underline Character
    hi SpecialChar      guifg=#7fffd4
    hi Tag              guifg=#ff6347
    "Statement
    hi Delimiter        guifg=#D8D8D8
    " Bold comment (in Java at least)
    hi SpecialComment   guifg=#da70d6
    hi Debug            guifg=#ff0000

hi Underlined           gui=underline guifg=#6C99BB

hi Ignore               guifg=bg

hi Error                guifg=#D8D8D8 guibg=#ff0000

hi Todo                 guifg=#323232 guibg=#BC9458

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
hi link rubyInvalidVariable rubyInstanceVariable

" Rails
hi railsStringSpecial guifg=#6EA533
hi railsMethod guifg=#B83426

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
hi sassClass guifg=#B7DFF8

" Javascript syntax
hi javaScriptIdentifier guifg=#6C99BB
hi javaScriptType guifg=#FFC66D
hi javaScriptValue guifg=#6C99BB
hi link javaScriptBraces Normal
hi link javaScript Normal
hi link javaScriptStatement Keyword
hi link javaScriptFunction Keyword

hi coffeeObjAssign guifg=#FFF980
" Keep parens and special ops normal
hi link coffeeParen Normal
hi link coffeeSpecialOp Normal
" @vars
hi coffeeSpecialVar guifg=#B7DFF8

" NERDTree coloring
hi treeDir guifg=#FFC66D
hi treeDirSlash guifg=#FFC66D

" Markdown
hi markdownCode guifg=#6C99BB
hi markdownHeadingDelimiter guifg=#FFC66D
hi markdownH1 guifg=#FFC66D
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
hi link markdownCode Comment
hi link markdownCodeBlock Comment
hi link markdownTitleDelimiter Float
hi markdownLinkTextDelimiter guifg=#B7DFF8
hi markdownLinkDelimiter guifg=#B7DFF8
hi markdownId guifg=#A5C261

" Command-T
hi CommandTSelection guifg=#000000 guibg=#ffd700
