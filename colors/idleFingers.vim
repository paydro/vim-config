" idleFingers Vim Colorsheme
" This file attempts to match the Textmate color scheme idleFingers
" (http://idlefingers.co.uk/)
"
" This file was NOT created by the maintainer of idleFingers, it just
" tries to copy the color style for MacVim usage.

" Init
" set background=light
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
hi CursorLine           term=NONE cterm=NONE ctermfg=NONE ctermbg=237 guibg=#333333
hi CursorLineNr         term=bold cterm=NONE ctermfg=253 guifg=#999999
hi Directory            guifg=#FFC66D ctermfg=221
hi DiffAdd              guibg=#165913 ctermbg=034 ctermfg=254 cterm=bold
hi DiffChange           guibg=#593F13 cterm=NONE ctermbg=237 ctermfg=254
hi DiffDelete           guibg=#591313 guifg=#9C2222 ctermbg=160 ctermfg=160
hi DiffText             guibg=#59B4CD ctermbg=028 ctermfg=254 cterm=bold
hi ErrorMsg             guifg=#D8D8D8 guibg=#ff0000 ctermfg=255 ctermbg=196
hi Folded               guifg=#999999 guibg=#444444 ctermfg=246 ctermbg=238
hi FoldColumn           guifg=#e8e8e8 guibg=#222222 ctermfg=253 ctermbg=242
hi SignColumn           guifg=#777777 guibg=#333333 ctermfg=000 ctermbg=235
hi IncSearch            gui=bold guifg=#282828 guibg=#6C99BB ctermfg=0 ctermbg=188
hi IncSearch            gui=NONE guibg=#111111 guifg=#B7DFF8 ctermfg=0 ctermbg=188
hi LineNr               guifg=#8C8C8C guibg=#282828 cterm=NONE ctermfg=242 ctermbg=235
" hi LineNr               guifg=#8C8C8C guibg=#333333 cterm=NONE ctermfg=242 ctermbg=235
hi MatchParen           guifg=#FFFFFF guibg=#666666 gui=bold ctermfg=15 ctermbg=241
hi ModeMsg              gui=NONE
hi MoreMsg              guifg=#5FAFD7 ctermfg=74
hi NonText              guifg=#D8D8D8 ctermfg=188
hi Normal               guibg=#282828 guifg=#D8D8D8 cterm=NONE ctermbg=235 ctermfg=188
hi Question             guifg=#ff6347 ctermfg=203
hi Search               guifg=#111111 guibg=#6C99BB ctermfg=0 ctermbg=220
hi SpecialKey           guifg=#00ffff ctermfg=67
hi VertSplit            gui=bold guifg=#3A3A3A guibg=#3A3A3A cterm=NONE ctermfg=237 ctermbg=237
hi StatusLine           gui=bold guifg=#3A3A3A  guibg=#5FAFD7 cterm=bold ctermbg=74 ctermfg=237
hi StatusLineNC         gui=none guifg=#5FAFD7  guibg=#3A3A3A cterm=NONE ctermbg=237 ctermfg=74
hi Tabline              gui=none guifg=#5FAFD7 guibg=#3A3A3A cterm=none ctermfg=74 ctermbg=237
hi TablineSel           gui=bold guifg=#3A3A3A guibg=#5FAFD7 cterm=bold ctermfg=237 ctermbg=74
hi TablineFill          ctermfg=237
hi Title                guifg=#ff6347 ctermfg=203
hi Visual               guibg=#ff6565 guifg=#FFFFFF ctermbg=161 ctermfg=015
hi VisualNOS            guifg=#000000 guibg=fg ctermfg=0
hi WarningMsg           guifg=#D8D8D8 guibg=#ff6347 ctermfg=188 ctermbg=203
hi WildMenu             guifg=#000000 guibg=#ffff00 ctermfg=0 ctermbg=11
hi Pmenu                guibg=#333333 ctermfg=250 ctermbg=238
hi PmenuSel             guibg=#777777 ctermfg=233 ctermbg=248
hi PmenuSbar            guibg=#AAAAAA ctermfg=243 ctermbg=240
hi PmenuThumb           guibg=#222222 ctermbg=248
hi QuickFixLine         guifg=#FFFFFF guibg=#ff6565 cterm=NONE ctermfg=NONE ctermbg=240

hi SpellCap             term=reverse ctermbg=9 gui=undercurl guisp=#FFF980

hi SpellBad             cterm=undercurl ctermul=233 ctermfg=NONE ctermbg=NONE  gui=undercurl guisp=#ff6565 guibg=NONE guifg=NONE
hi SpellCap             ctermfg=233 ctermbg=203 gui=undercurl guisp=#FFF980
hi SpellRare            ctermfg=233 ctermbg=204 gui=undercurl guisp=Magenta


" Colors for syntax highlighting
hi Comment              guifg=#BC9458 ctermfg=137

hi Constant             guifg=#6C99BB gui=none ctermfg=67
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
hi Error                guibg=#333333 guifg=#ff6565 ctermfg=255 ctermbg=197
hi Todo                 guifg=#323232 guibg=#BC9458 ctermfg=236 ctermbg=137

" Ruby syntax (via vim-rails)
hi rubyMacro			guifg=#B83426 ctermfg=124
hi link rubySchema rubyMacro
hi link rubyRoute rubyMacro
hi link rubyHelper rubyMacro
hi link rubyResponse rubyMacro

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

" NERDTree coloring
hi treeDir guifg=#FFC66D ctermfg=221
hi treeDirSlash guifg=#FFC66D ctermfg=221

" Markdown
hi markdownCode guifg=#6C99BB ctermfg=67
hi markdownHeadingDelimiter guifg=#FFC66D ctermfg=221
hi mkdHeading guifg=#FFC66D ctermfg=221
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

" Python
syn keyword pythonInstanceVariable self
hi link pythonInstanceVariable Identifier
hi link pythonDecorator Identifier
hi link pythonDottedName Identifier
hi link pythonStatement Keyword

" python-mode overrides
hi link pythonDocstring Comment
hi link pythonBuiltinObj Constant

" vim-lsp
hi lspReference guibg=#111111
hi LspErrorVirtualText guifg=#ff6565
hi link LspWarningHighlight Normal
hi link LspErrorHighlight Normal
hi LspWarningVirtualText guifg=#888888
hi LspInformationVirtualText guifg=#5FAFD7
hi LspHintVirtualText guifg=#FFC66D guibg=NONE


" HCL
hi def link hclBlockType Statement
" Don't highlight braces
hi def link hclBraces Normal

