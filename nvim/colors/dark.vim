" main colors
let s:scheme_bg = "#12191d"
let s:scheme_fg = "f1e6d7"
" colors
let s:scheme_red = "#ed7f76"
let s:scheme_green = "#9cb28b"
let s:scheme_yellow = "#edaf76"
let s:scheme_blue = "#8b9cb2"
let s:scheme_magenta = "#a68bb3"
let s:scheme_cyan = "#8bb3b0"
" cursorline
let s:scheme_cursorline = "#282e31"
" line number
let s:scheme_line_number = "#b2a08a"
let s:scheme_cursorline_number = s:scheme_yellow

hi clear
syntax reset
let g:colors_name = "dark"
set background=dark
set t_Co=256
exe "hi Normal guifg=" . s:scheme_fg . " ctermbg=NONE guibg=" . s:scheme_bg . " gui=NONE"

" cursorline colors
exe "hi CursorLineNR guifg=" . s:scheme_cursorline_number . " guibg=NONE"
" line number
exe "hi CursorLine guibg=" . s:scheme_cursorline
exe "hi LineNr guifg=" . s:scheme_line_number . " guibg=" . s:scheme_bg
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

hi Pmenu guifg=#f1e6d7 guibg=#282E31
hi PMenuSel guifg=#9cb28b guibg=NONE
hi SignColumn guibg=#12191d
hi Title guifg=#f1e6d7
hi NonText guifg=#4b4a49 guibg=#12191d
" comments
hi Comment guifg=#4b4a49 gui=italic
hi SpecialComment guifg=#4b4a49 gui=italic guibg=NONE
" tabline
hi TabLineFill gui=NONE guibg=#12191d guifg=#B2A08A
hi TabLine guifg=#edaf76 guibg=#282E31 gui=NONE
" StatusLine
hi StatusLine gui=bold guibg=#12191d guifg=#f1e6d7
hi StatusLineNC gui=NONE guibg=#12191d guifg=#f1e6d7
hi Search guibg=#4b4a49 guifg=#f1e6d7
hi VertSplit gui=NONE guifg=#282E31 guibg=NONE
hi Visual gui=NONE guibg=#282E31
" NvimTree Highlights 
exe "hi NvimTreeFolderIcon guifg=" . s:scheme_blue
exe "hi NvimTreeFolderName guifg=" . s:scheme_blue
exe "hi NvimTreeOpenedFolderName guifg=" . s:scheme_cyan
exe "hi NvimTreeOpenedFileName guifg=" . s:scheme_cyan
exe "hi NvimTreeEmptyFolderName guifg=" . s:scheme_cyan
exe "hi NvimTreeFileDirty guifg=" . s:scheme_red
exe "hi NvimTreeExecFile guifg=" . s:scheme_green
exe "hi NvimTreeGitDirty guifg=" . s:scheme_red
exe "hi NvimTreeGitDeleted guifg=" . s:scheme_red
exe "hi NvimTreeRootFolder guifg=" . s:scheme_yellow
exe "hi NvimTreeIndentMarker guifg=" . s:scheme_cursorline

" hi cssIdentifier guifg=#ed7f76 guibg=NONE
" hi cssImportant guifg=#ed7f76 guibg=NONE
" hi cssIncludeKeyword guifg=#9cb28b guibg=NONE
" hi cssColor guifg=#edaf76 guibg=NONE
" hi javaScriptBoolean guifg=#a68bb3 guibg=NONE
" hi cssClassName guifg=#a68bb3 guibg=NONE
" hi cssClassNameDot guifg=#a68bb3 guibg=NONE
" hi cssAttr guifg=#8bb3b0 guibg=NONE
