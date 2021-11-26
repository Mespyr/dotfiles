" main colors
let s:scheme_bg = "#0E0F10"
let s:scheme_fg = "f1e6d7"
" colors
let s:scheme_red = "#ed7f76"
let s:scheme_green = "#9cb28b"
let s:scheme_yellow = "#edaf76"
let s:scheme_blue = "#8b9cb2"
let s:scheme_magenta = "#a68bb3"
let s:scheme_cyan = "#8bb3b0"
let s:scheme_grey = "#545657"
" cursorline
let s:scheme_cursorline = "#242626"
" line number
let s:scheme_line_number = "#b2a08a"
let s:scheme_cursorline_number = s:scheme_yellow
" comments
let s:scheme_comment = "#545657"

hi clear
syntax reset
let g:colors_name = "dark"
set background=dark
set t_Co=256

" modes
exe "hi Normal guifg=" . s:scheme_fg . " ctermbg=NONE guibg=" . s:scheme_bg . " gui=NONE"
hi Visual gui=NONE guibg=#242626
" cursorline colors
exe "hi CursorLineNR guifg=" . s:scheme_cursorline_number . " guibg=NONE"
" line number
exe "hi CursorLine guibg=" . s:scheme_cursorline
exe "hi LineNr guifg=" . s:scheme_line_number . " guibg=NONE"
" error colors
hi ErrorMsg guifg=#ed7f76 guibg=NONE
hi WarningMsg guifg=#ed7f76 guibg=NONE
hi PreProc guifg=#ed7f76 guibg=NONE
hi Exception guifg=#ed7f76 guibg=NONE
hi Error guifg=#ed7f76 guibg=NONE
" diff colors
hi DiffText guifg=#ed7f76 guibg=NONE
hi DiffDelete guifg=#ed7f76 guibg=NONE
hi DiffAdd guifg=#9cb28b guibg=NONE
hi DiffChange guifg=#edaf76 guibg=NONE
" git colors
hi GitGutterDelete guifg=#ed7f76 guibg=NONE
hi GitGutterChangeDelete guifg=#ed7f76 guibg=NONE
hi GitGutterAdd guifg=#9cb28b guibg=NONE
hi GitGutterChange guifg=#edaf76 guibg=NONE

hi Type guifg=#ed7f76 guibg=NONE
hi Identifier guifg=#ed7f76 guibg=NONE
hi Constant guifg=#9cb28b guibg=NONE
hi Repeat guifg=#9cb28b guibg=NONE
hi Keyword guifg=#9cb28b guibg=NONE
hi IncSearch guifg=#edaf76 guibg=NONE
hi Title guifg=#edaf76 guibg=NONE
hi PreCondit guifg=#edaf76 guibg=NONE
hi Debug guifg=#edaf76 guibg=NONE
hi SpecialChar guifg=#edaf76 guibg=NONE
hi Conditional guifg=#edaf76 guibg=NONE
hi Todo guifg=#edaf76 guibg=NONE
hi Special guifg=#edaf76 guibg=NONE
hi Label guifg=#edaf76 guibg=NONE
hi Delimiter guifg=#edaf76 guibg=NONE
hi Number guifg=#edaf76 guibg=NONE
hi Define guifg=#edaf76 guibg=NONE
hi MoreMsg guifg=#edaf76 guibg=NONE
hi Tag guifg=#edaf76 guibg=NONE
hi String guifg=#edaf76 guibg=NONE
hi MatchParen guifg=#edaf76 guibg=NONE gui=underline
hi Macro guifg=#edaf76 guibg=NONE
hi Function guifg=#8b9cb2 guibg=NONE
hi Directory guifg=#a68bb3 guibg=NONE
hi markdownLinkText guifg=#a68bb3 guibg=NONE
hi Include guifg=#a68bb3 guibg=NONE
hi Storage guifg=#a68bb3 guibg=NONE
hi Statement guifg=#8bb3b0 guibg=NONE
hi Operator guifg=#8bb3b0 guibg=NONE

hi SignColumn guibg=#0E0F10
hi Title guifg=#f1e6d7
hi NonText guifg=#545657 guibg=#0E0F10
" comments
hi Comment guifg=#545657 gui=italic
hi SpecialComment guifg=#545657 gui=italic guibg=NONE
" tabline
hi TabLineFill gui=NONE guibg=#0E0F10 guifg=#B2A08A
hi TabLine guifg=#edaf76 guibg=#242626 gui=NONE
" StatusLine
hi StatusLine gui=bold guibg=#0E0F10 guifg=#f1e6d7
hi StatusLineNC gui=NONE guibg=#0E0F10 guifg=#f1e6d7

hi Search guibg=#545657 guifg=#f1e6d7
hi VertSplit gui=NONE guifg=#242626 guibg=NONE
" NvimTree Highlights 
exe "hi NvimTreeFolderIcon guifg=" . s:scheme_blue
exe "hi NvimTreeFolderName guifg=" . s:scheme_blue
exe "hi NvimTreeOpenedFolderName guifg=" . s:scheme_cyan
exe "hi NvimTreeOpenedFileName guifg=" . s:scheme_cyan
exe "hi NvimTreeEmptyFolderName guifg=" . s:scheme_cyan
exe "hi NvimTreeFileDirty guifg=" . s:scheme_green
exe "hi NvimTreeExecFile guifg=" . s:scheme_yellow
exe "hi NvimTreeGitDirty guifg=" . s:scheme_green
exe "hi NvimTreeGitDeleted guifg=" . s:scheme_green
exe "hi NvimTreeRootFolder guifg=" . s:scheme_magenta
exe "hi NvimTreeIndentMarker guifg=" . s:scheme_yellow
" Nvim-Treesitter Highlights 
exe "hi TSAttribute guifg=" . s:scheme_blue
exe "hi TSBoolean guifg=" . s:scheme_magenta
exe "hi TSCharacter guifg=" . s:scheme_blue
exe "hi TSComment guifg=" . s:scheme_grey
exe "hi TSConditional guifg=" . s:scheme_red
exe "hi TSConstant guifg=" . s:scheme_cyan
exe "hi TSConstBuiltin guifg=" . s:scheme_blue
exe "hi TSConstMacro guifg=" . s:scheme_yellow
exe "hi TSConstructor guifg=" . s:scheme_magenta
exe "hi TSException guifg=" . s:scheme_grey
exe "hi TSField guifg=" . s:scheme_red
exe "hi TSFloat guifg=" . s:scheme_grey
exe "hi TSFunction guifg=" . s:scheme_red
exe "hi TSFuncBuiltin guifg=" . s:scheme_cyan
exe "hi TSFuncMacro guifg=" . s:scheme_magenta
exe "hi TSInclude guifg=" . s:scheme_magenta
exe "hi TSKeyword guifg=" . s:scheme_yellow
exe "hi TSKeywordFunction guifg=" . s:scheme_yellow
exe "hi TsKeywordOperator guifg=" . s:scheme_yellow
exe "hi TSKeywordReturn guifg=" . s:scheme_cyan
exe "hi TSLabel guifg=" . s:scheme_blue
exe "hi TSMethod guifg=" . s:scheme_red
exe "hi TSNamespace guifg=" . s:scheme_red
exe "hi TSNumber guifg=" . s:scheme_yellow
exe "hi TSParameter guifg=" . s:scheme_magenta
exe "hi TSParameterReference guifg=" . s:scheme_magenta
exe "hi TSProperty guifg=" . s:scheme_magenta
exe "hi TSPunctDelimiter guifg=" . s:scheme_yellow
exe "hi TSPunctBracket guifg=" . s:scheme_yellow
exe "hi TSPunctSpecial guifg=" . s:scheme_fg
exe "hi TSRepeat guifg=" . s:scheme_yellow
exe "hi TSString guifg=" . s:scheme_green
exe "hi TSStringRegex guifg=" . s:scheme_green
exe "hi TSStringEscape guifg=" . s:scheme_blue
exe "hi TSStringSpecial guifg=" . s:scheme_blue
exe "hi TSSymbol guifg=" . s:scheme_red
exe "hi TSTag guifg=" . s:scheme_blue
exe "hi TSTagAttribute guifg=" . s:scheme_red
exe "hi TSTagDelimiter guifg=" . s:scheme_fg
exe "hi TSText guifg=" . s:scheme_fg
exe "hi TSStrong guifg=" . s:scheme_fg
exe "hi TSEmphasis gui=italic guifg=" . s:scheme_fg
exe "hi TSUnderline guifg=" . s:scheme_magenta
exe "hi TSStrike guifg=" . s:scheme_fg
exe "hi TSTitle guifg=" . s:scheme_yellow
exe "hi TSLiteral guifg=" . s:scheme_green
exe "hi TSURI guifg=" . s:scheme_red
exe "hi TSMath guifg=" . s:scheme_cyan
exe "hi TSTextReference guifg=" . s:scheme_cyan
exe "hi TSEnvirontment guifg=" . s:scheme_magenta
exe "hi TSEnvironmentName guifg=" . s:scheme_yellow
exe "hi TSNote guifg=" . s:scheme_grey
exe "hi TSWarning guifg=" . s:scheme_bg . " guibg=" . s:scheme_red
exe "hi TSDanger guifg=" . s:scheme_grey
exe "hi TSType guifg=" . s:scheme_yellow
exe "hi TSTypeBuiltin guifg=" . s:scheme_red
exe "hi TSVariable guifg=" . s:scheme_magenta
exe "hi TSVariableBuiltin guifg=" . s:scheme_red
" Pmenu
exe "hi Pmenu guifg=" . s:scheme_fg . " guibg=" . s:scheme_grey
exe "hi PMenuSel guibg=" . s:scheme_green . " guifg=" . s:scheme_bg

" hi cssIdentifier guifg=#ed7f76 guibg=NONE
" hi cssImportant guifg=#ed7f76 guibg=NONE
" hi cssIncludeKeyword guifg=#9cb28b guibg=NONE
" hi cssColor guifg=#edaf76 guibg=NONE
" hi javaScriptBoolean guifg=#a68bb3 guibg=NONE
" hi cssClassName guifg=#a68bb3 guibg=NONE
" hi cssClassNameDot guifg=#a68bb3 guibg=NONE
" hi cssAttr guifg=#8bb3b0 guibg=NONE
