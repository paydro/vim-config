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

hi Cursor               guibg=#FFFFFF ctermbg=15
hi CursorIM             guifg=NONE guibg=#ff83fa ctermbg=213
hi CursorLine           term=NONE cterm=NONE guibg=#333333
hi CursorLineNr         term=bold ctermfg=14 guifg=#999999
hi Directory            guifg=#FFC66D ctermfg=221
hi DiffAdd              guibg=#165913 ctermbg=66
hi DiffChange           guibg=#593F13 ctermbg=95
hi DiffDelete           guibg=#591313 guifg=#9C2222 ctermbg=0
hi DiffText             guibg=#59B4CD ctermbg=95
hi ErrorMsg             guifg=#D8D8D8 guibg=#ff0000 ctermfg=188 ctermbg=9
hi Folded               guifg=#999999 guibg=#444444 ctermfg=246 ctermbg=238
hi FoldColumn           guifg=#e8e8e8 guibg=#222222 ctermfg=253 ctermbg=242
hi SignColumn           guifg=#777777 guibg=#333333 ctermfg=143 ctermbg=37
hi IncSearch            gui=bold guifg=#282828 guibg=#75aac8 ctermfg=0 ctermbg=188
hi LineNr               guifg=#777777 guibg=#282828 ctermfg=102
hi MatchParen           guifg=#FFFFFF guibg=#666666 gui=bold ctermfg=15 ctermbg=241
hi ModeMsg              gui=NONE
hi MoreMsg              guifg=#20b2aa ctermfg=172
hi NonText              guifg=#D8D8D8 ctermfg=188
hi Normal               guibg=#282828 guifg=#D8D8D8 ctermbg=235 ctermfg=188
hi Question             guifg=#ff6347 ctermfg=203
hi Search               guifg=#282828 guibg=#75aac8 ctermfg=0 ctermbg=220
hi SpecialKey           guifg=#00ffff ctermfg=67
hi VertSplit            gui=bold guifg=#CCCCCC guibg=#484848 ctermfg=236 ctermbg=222
hi StatusLine           gui=bold guifg=#CCCCCC guibg=#484848 ctermfg=241 ctermbg=188
hi StatusLineNC         gui=none guifg=#CCCCCC guibg=#484848  ctermfg=250 ctermbg=238
hi Title                guifg=#ff6347 ctermfg=203
" hi Visual               guibg=#ff4671
hi Visual               guibg=#ff6565 guifg=#000000 ctermbg=241
hi VisualNOS            guifg=#000000 guibg=fg ctermfg=0
hi WarningMsg           guifg=#D8D8D8 guibg=#ff6347 ctermfg=188 ctermbg=203
hi WildMenu             guifg=#000000 guibg=#ffff00 ctermfg=0 ctermbg=11
hi Pmenu                guibg=#444444
hi PmenuSel             guibg=#777777 ctermbg=226 ctermfg=0
hi QuickFixLine         guifg=#000000 guibg=#ffff00

hi SpellCap             term=reverse ctermbg=9 gui=undercurl guisp=#FFF980


" Colors for syntax highlighting
hi Comment              guifg=#BC9458 ctermfg=246

hi Constant             guifg=#6C99BB gui=NONE ctermfg=67
    hi String           guifg=#A5C261 ctermfg=107
    hi Character        guifg=#6C99BB ctermfg=67
    hi Number           guifg=#6C99BB ctermfg=67
    hi Boolean          guifg=#6C99BB ctermfg=67
    hi Float            guifg=#6C99BB ctermfg=67

hi Identifier           guifg=#B7DFF8 ctermfg=153
    hi Function         guifg=#FFF980 ctermfg=228

hi Statement            guifg=#FFC66D ctermfg=221
    hi Conditional      guifg=#CC7833 ctermfg=172
    hi Repeat           guifg=#CC7833 ctermfg=172
    hi Label            guifg=#CC7833 ctermfg=172
    hi Operator         guifg=#CC7833 ctermfg=172
    hi Keyword          guifg=#CC7833 ctermfg=166
    hi Exception        guifg=#CC7833 ctermfg=172

hi PreProc              guifg=#CC7833 ctermfg=172
    hi Include          guifg=#CC7833 ctermfg=172
    hi Define           guifg=#CC7833 gui=NONE ctermfg=172
    hi Macro            guifg=#CC7833 ctermfg=172
    hi PreCondit        guifg=#CC7833 ctermfg=172

hi Type                 guifg=#FFF980 gui=NONE ctermfg=228
    hi StorageClass     guifg=#FFF980 ctermfg=228
    hi Structure        guifg=#FFF980 ctermfg=228

hi Special              guifg=#ff6347 ctermfg=203
    " Underline Character
    hi SpecialChar      guifg=#7fffd4 ctermfg=122
    hi Tag              guifg=#ff6347 ctermfg=203
    "Statement
    hi Delimiter        guifg=#D8D8D8 ctermfg=188
    " Bold comment (in Java at least)
    hi SpecialComment   guifg=#da70d6 ctermfg=170
    hi Debug            guifg=#ff0000 ctermfg=9

hi Underlined           gui=underline guifg=#6C99BB

hi Ignore               guifg=bg

hi Error                guifg=#D8D8D8 guibg=#ff0000 ctermfg=188 ctermbg=9

hi Todo                 guifg=#323232 guibg=#BC9458 ctermfg=236 ctermbg=137

" Ruby syntax
hi rubyConditionalExpression guifg=#D8D8D8 ctermfg=188
hi rubyMethod           guifg=#FFC66D ctermfg=221
hi rubyInstanceVariable guifg=#B7DFF8 ctermfg=153
hi rubyRailsMethod      guifg=#B83426 ctermfg=124
hi rubyStringDelimiter  guifg=#A5C261 ctermfg=143
hi rubyControl          guifg=#CC7833 ctermfg=172
hi rubyIdentifier       guifg=#B7DFF8 ctermfg=153
hi link rubyAccess Keyword
hi link rubyAttribute Keyword
hi link rubyBeginEnd Keyword
hi link rubyEval Keyword
hi link rubyException Keyword
hi clear rubyBracketOperator
hi link rubyInvalidVariable rubyInstanceVariable

" Rails
hi railsStringSpecial guifg=#6EA533
hi railsMethod guifg=#B83426 ctermfg=130

" ERuby syntax
hi erubyRailsMethod     guifg=#B83426 ctermfg=130
hi erubyRailsRenderMethod guifg=#B83426 ctermfg=130

" HTML syntax
hi htmlTag              guifg=#FFE5BB ctermfg=223
hi htmlTagName          guifg=#FFC66D ctermfg=221
hi htmlEndTag           guifg=#FFE5BB ctermfg=223
hi htmlArg              guifg=#FFE5BB ctermfg=223
hi Title                guifg=#D8D8D8 ctermfg=188
hi link htmlSpecialTagName htmlTagName

" CSS syntax
hi cssTagName         guifg=#FFC66D ctermfg=221
hi cssBraces          guifg=#D8D8D8 ctermfg=188
hi cssSelectorOp      guifg=#A5C261 ctermfg=143
hi cssSelectorOp2     guifg=#A5C261 ctermfg=143
hi cssInclude         guifg=#CC7833 ctermfg=172
hi cssFunctionName    guifg=#B83426 ctermfg=130
hi cssClassName       guifg=#D8D8D8 ctermfg=188
hi cssIdentifier      guifg=#D8D8D8 ctermfg=188
hi cssComment         guifg=#EEEEEE guibg=#575757 ctermfg=7 ctermbg=240
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
hi sassClass guifg=#B7DFF8 ctermfg=153

" Javascript syntax
hi javaScriptIdentifier guifg=#6C99BB ctermfg=67
hi javaScriptType guifg=#FFC66D ctermfg=221
hi javaScriptValue guifg=#6C99BB ctermfg=67
hi link javaScriptBraces Normal
hi link javaScript Normal
hi link javaScriptStatement Keyword
hi link javaScriptFunction Keyword

hi coffeeObjAssign guifg=#FFF980
" Keep parens and special ops normal
hi link coffeeParen Normal
hi link coffeeSpecialOp Normal
" @vars
hi coffeeSpecialVar guifg=#B7DFF8 ctermfg=153

" NERDTree coloring
hi treeDir guifg=#FFC66D ctermfg=221
hi treeDirSlash guifg=#FFC66D ctermfg=221

" Markdown
hi markdownCode guifg=#6C99BB ctermfg=67
hi markdownHeadingDelimiter guifg=#FFC66D ctermfg=221
hi markdownH1 guifg=#FFC66D ctermfg=221
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
hi link markdownCode Comment
hi link markdownCodeBlock Comment
hi link markdownTitleDelimiter Float
hi markdownLinkTextDelimiter guifg=#B7DFF8 ctermfg=153
hi markdownLinkDelimiter guifg=#B7DFF8 ctermfg=153
hi markdownId guifg=#A5C261 ctermfg=143

" Command-T
hi CommandTSelection guifg=#000000 guibg=#ffd700

" Python
syn keyword pythonInstanceVariable self
hi link pythonInstanceVariable Identifier
hi link pythonDecorator Identifier
hi link pythonDottedName Identifier
hi link pythonStatement Keyword

" python-mode overrides
hi link pythonDocstring Comment
hi link pythonBuiltinObj Constant

" Syntastic
hi SyntasticErrorSign guifg=#ff6347 guibg=#333333
