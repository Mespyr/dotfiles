" Setting up the colors 
let s:scheme0_gui = "#282e31" " cursorline color
let s:scheme1_gui = "#e74c4c" " cyan
let s:scheme2_gui = "#6bb05d" " green
let s:scheme3_gui = "#e59e67" " orange
let s:scheme4_gui = "#53A7BF" " blue
let s:scheme5_gui = "#CD69CC" " pink
let s:scheme6_gui = "#51a39f" 
let s:scheme7_gui = "#bcbcbc" 
let s:scheme8_gui = "#454c4e" 
let s:scheme9_gui = "#c26f6f"
let s:scheme10_gui = "#8dc776" 
let s:scheme11_gui = "#e7ac7e" 
let s:scheme12_gui = "#6CBAD1"
let s:scheme13_gui = "#E182E0" 
let s:scheme14_gui = "#6db0ad"
let s:scheme15_gui = "#bfbfbf" 
let s:schemebg_gui = "#131A1C"
let s:schemefg_gui = "#C5C8C9" 

hi clear
syntax reset
let g:colors_name = "test"
set background=dark
set t_Co=256
hi Normal guifg=#f1e6d7 ctermbg=NONE guibg=#12191d gui=NONE

set t_Co=256
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Syntax Highlighting 
exe "hi CursorLineNR guifg=" .s:scheme0_gui 
exe "hi CursorLine guibg=" .s:scheme0_gui 
exe "hi ErrorMsg guifg=" .s:scheme1_gui." guibg=".s:scheme8_gui  
exe "hi WarningMsg guifg=" .s:scheme0_gui 
exe "hi PreProc guifg=" .s:scheme4_gui 
exe "hi Exception guifg=" .s:scheme7_gui 
exe "hi Error guifg=" .s:scheme1_gui
exe "hi Type guifg=" .s:scheme3_gui 
exe "hi Identifier guifg=" .s:scheme1_gui 
exe "hi Constant guifg=" .s:scheme3_gui 
exe "hi Repeat guifg=" .s:scheme5_gui 
exe "hi Keyword guifg=" .s:scheme5_gui 
exe "hi IncSearch guifg=" .s:scheme3_gui 
exe "hi Title guifg=" .s:scheme2_gui  
exe "hi PreCondit guifg=" .s:scheme5_gui 
exe "hi Debug guifg=" .s:scheme13_gui
exe "hi SpecialChar guifg=" .s:scheme4_gui 
exe "hi Conditional guifg=" .s:scheme1_gui 
exe "hi Todo guifg=" .s:scheme5_gui 
exe "hi Special guifg=" .s:scheme4_gui 
exe "hi Label guifg=" .s:scheme12_gui 
exe "hi Delimiter guifg=" .s:scheme7_gui 
exe "hi Number guifg=" .s:scheme8_gui 
exe "hi Define guifg=" .s:scheme6_gui 
exe "hi MoreMsg guifg=" .s:scheme14_gui 
exe "hi Tag guifg=" .s:scheme15_gui 
exe "hi String guifg=" .s:scheme2_gui  
exe "hi MatchParn guifg=" .s:scheme1_gui 
exe "hi Macro guifg=" .s:scheme5_gui 
exe "hi Function guifg=" .s:scheme4_gui 
exe "hi Directory guifg=" .s:scheme4_gui 
exe "hi markdownLinkText guifg=" .s:scheme9_gui 
exe "hi Include guifg=" .s:scheme1_gui  
exe "hi Storage guifg=" .s:scheme9_gui 
exe "hi Statement guifg=" .s:scheme3_gui 
exe "hi Operator guifg=" .s:scheme4_gui 
exe "hi ColorColumn guibg=" .s:scheme8_gui  
exe "hi PMenu guifg=".s:scheme7_gui." guibg=" .s:scheme0_gui   
exe "hi PMenuSel guifg=".s:scheme8_gui." guibg=".s:scheme5_gui  
exe "hi SignColumn guibg=" .s:scheme0_gui 
exe "hi Title guifg=" .s:scheme3_gui 
exe "hi LineNr guifg=".s:scheme8_gui 
exe "hi NonText guifg=".s:scheme5_gui." guibg=".s:scheme0_gui 
exe "hi Comment guifg=".s:scheme8_gui
exe "hi SpecialComment guifg=".s:scheme8_gui "gui=italic guibg=NONE "
exe "hi TabLineFill gui=NONE guibg=".s:scheme8_gui 
exe "hi TabLine guifg=".s:scheme7_gui." guibg=".s:scheme8_gui
exe "hi StatusLine guibg=".s:schemebg_gui." guifg=".s:schemebg_gui 
exe "hi StatusLineNC guibg=".s:schemebg_gui." guifg=".s:schemebg_gui
exe "hi Search guibg=".s:scheme8_gui." guifg=".s:scheme4_gui
exe "hi VertSplit gui=NONE guifg=".s:scheme0_gui." guibg=".s:scheme0_gui 
exe "hi Visual gui=NONE guibg=".s:scheme0_gui
exe "hi Underlined guifg=".s:scheme3_gui 
exe "hi EndOfBuffer guibg=NONE"

" Spell Highlightings 
exe "hi SpellBad guifg=".s:scheme1_gui 
exe "hi SpellCap guifg=".s:scheme1_gui." guibg=".s:scheme8_gui 
exe "hi SpellLocal guifg=".s:scheme4_gui 
exe "hi SpellRare guifg=".s:scheme5_gui 

" Diff Highlightings 
exe "hi DiffAdd guifg=".s:scheme2_gui 
exe "hi DiffChange guifg=".s:scheme5_gui 
exe "hi DiffDelete guifg=".s:scheme6_gui 
exe "hi DiffText guifg=".s:scheme1_gui 

" GitGutter Highlightings 
exe "hi GitGutterAdd guifg=".s:scheme3_gui 
exe "hi GitGutterChange guifg=".s:scheme1_gui 
exe "hi GitGutterDelete guifg=".s:scheme3_gui 
exe "hi GitGutterChangeDelete guifg=".s:scheme4_gui
exe "hi GitGutterLineHighlightsEnable guifg=".s:scheme9_gui." guibg=".s:scheme8_gui  

" Nvim-Treesitter Highlights 
exe "hi TSAttribute guifg=".s:scheme4_gui 
exe "hi TSBoolean guifg=".s:scheme6_gui 
exe "hi TSCharacter guifg=".s:scheme4_gui 
exe "hi TSComment guifg=".s:scheme8_gui 
exe "hi TSConditional guifg=".s:scheme1_gui 
exe "hi TSConstant guifg=".s:scheme6_gui 
exe "hi TSConstBuiltin guifg=".s:scheme4_gui 
exe "hi TSConstMacro guifg=".s:scheme3_gui 
exe "hi TSConstructor guifg=".s:scheme4_gui
exe "hi TSException guifg=".s:scheme8_gui 
exe "hi TSField guifg=".s:scheme1_gui 
exe "hi TSFloat guifg=".s:scheme8_gui 
exe "hi TSFunction guifg=".s:scheme1_gui 
exe "hi TSFuncBuiltin guifg=".s:scheme14_gui 
exe "hi TSFuncMacro guifg=".s:scheme2_gui 
exe "hi TSInclude guifg=".s:scheme9_gui 
exe "hi TSKeyword guifg=".s:scheme5_gui 
exe "hi TSKeywordFunction guifg=".s:scheme4_gui 
exe "hi TsKeywordOperator guifg=".s:scheme12_gui 
exe "hi TSKeywordReturn guifg=".s:scheme4_gui 
exe "hi TSLabel guifg=".s:scheme4_gui 
exe "hi TSMethod guifg=".s:scheme12_gui 
exe "hi TSNamespace guifg=".s:scheme9_gui 
exe "hi TSNumber guifg=".s:scheme3_gui 
exe "hi TSParameter guifg=".s:scheme1_gui 
exe "hi TSParameterReference guifg=".s:scheme9_gui 
exe "hi TSProperty guifg=".s:scheme1_gui 
exe "hi TSPunctDelimiter guifg=".s:scheme7_gui 
exe "hi TSPunctBracket guifg=".s:scheme7_gui 
exe "hi TSPunctSpecial guifg=".s:scheme7_gui 
exe "hi TSRepeat guifg=".s:scheme11_gui 
exe "hi TSString guifg=".s:scheme2_gui
exe "hi TSStringRegex guifg=".s:scheme2_gui 
exe "hi TSStringEscape guifg=".s:scheme4_gui 
exe "hi TSStringSpecial guifg=".s:scheme4_gui 
exe "hi TSSymbol guifg=".s:scheme1_gui 
exe "hi TSTag guifg=".s:scheme4_gui 
exe "hi TSTagAttribute guifg=".s:scheme1_gui 
exe "hi TSTagDelimiter guifg=".s:scheme7_gui 
exe "hi TSText guifg=".s:scheme7_gui 
exe "hi TSStrong guifg=".s:scheme7_gui
exe "hi TSEmphasis gui=italic guifg=".s:scheme7_gui
exe "hi TSUnderline guifg=".s:scheme5_gui 
exe "hi TSStrike guifg=".s:scheme7_gui 
exe "hi TSTitle guifg=".s:scheme3_gui 
exe "hi TSLiteral guifg=".s:scheme2_gui 
exe "hi TSURI guifg=".s:scheme3_gui 
exe "hi TSMath guifg=".s:scheme6_gui 
exe "hi TSTextReference guifg=".s:scheme6_gui 
exe "hi TSEnvirontment guifg=".s:scheme5_gui 
exe "hi TSEnvironmentName guifg=".s:scheme3_gui 
exe "hi TSNote guifg=".s:scheme8_gui 
exe "hi TSWarning guifg=".s:scheme0_gui." guibg=".s:scheme1_gui 
exe "hi TSDanger guifg=".s:scheme8_gui 
exe "hi TSType guifg=".s:scheme3_gui 
exe "hi TSTypeBuiltin guifg=".s:scheme3_gui 
exe "hi TSVariable guifg=".s:scheme4_gui
exe "hi TSVariableBuiltin guifg=".s:scheme4_gui 

" C Language Higlights 
exe "hi cConstant guifg=".s:scheme4_gui 
exe "hi cCppBracket guifg=".s:scheme7_gui 
exe "hi cCppInElse guifg=".s:scheme7_gui 
exe "hi cCppInElse2 guifg=".s:scheme7_gui 
exe "hi cCppInIf guifg=".s:scheme4_gui 
exe "hi cCppInSkip guifg=".s:scheme7_gui 
exe "hi cCppInWapper guifg=".s:scheme5_gui 
exe "hi cCppOutElse guifg=".s:scheme7_gui 
exe "hi cCppOutIf guifg=".s:scheme8_gui 
exe "hi cCppOutIf2 guifg=".s:scheme8_gui
exe "hi cCppOutInGroup guifg=".s:scheme8_gui 
exe "hi cCppOutSkip guifg=".s:scheme8_gui 
exe "hi cCppOutWrapper guifg=".s:scheme5_gui 
exe "hi cCppParen guifg=".s:scheme7_gui 
exe "hi cCppString guifg=".s:scheme2_gui 
exe "hi cCurlyError guifg=".s:scheme7_gui." guibg=".s:scheme9_gui 
exe "hi cErrInBracket guifg=".s:scheme7_gui." guibg=".s:scheme9_gui 
exe "hi cErrInParen guifg=".s:scheme7_gui." guibg=".s:scheme9_gui 
exe "hi cFloat guifg=".s:scheme8_gui 
exe "hi cFormat guifg=".s:scheme4_gui 
exe "hi cMutli guifg=".s:scheme3_gui 
exe "hi cOperator guifg=".s:scheme4_gui 
exe "hi cParen guifg=".s:scheme3_gui 
exe "hi cParenError guifg=".s:scheme7_gui." guibg=".s:scheme9_gui
exe "hi PreProcGroup guifg=".s:scheme4_gui 
exe "hi cSpaceError guifg=".s:scheme1_gui 
exe "hi cSpecial guifg=".s:scheme4_gui 
exe "hi cSpecialCharacter guifg=".s:scheme4_gui 
exe "hi cStatement guifg=".s:scheme5_gui 
exe "hi cStorageClass guifg=".s:scheme3_gui 
exe "hi cString guifg=".s:scheme2_gui 
exe "hi cType guifg=".s:scheme3_gui 
exe "hi cUserCont guifg=".s:scheme7_gui

" GoLang Highlight Groups 
exe "hi goBlock guifg=".s:scheme7_gui 
exe "hi goBuiltins guifg=".s:scheme13_gui 
exe "hi goCharacter guifg=".s:scheme1_gui 
exe "hi goComment guifg=".s:scheme8_gui
exe "hi goComplexes guifg=".s:scheme3_gui 
exe "hi goConditional guifg=".s:scheme5_gui 
exe "hi goConstants guifg=".s:scheme5_gui 
exe "hi goDecimalInt  guifg=".s:scheme3_gui 
exe "hi goDeclType guifg=".s:scheme13_gui 
exe "hi goDeclaration guifg=".s:scheme5_gui 
exe "hi goDirective guifg=".s:scheme1_gui 
exe "hi goEscapeC guifg=".s:scheme4_gui 
exe "hi goEscapeBigU guifg=".s:scheme4_gui 
exe "hi goEscapeError guifg=".s:scheme0_gui." guibg=".s:scheme1_gui 
exe "hi goEscapeOctal guifg=".s:scheme4_gui 
exe "hi goEscapeU guifg=".s:scheme4_gui 
exe "hi goEscapeX guifg=".s:scheme4_gui 
exe "hi goExtraType guifg=".s:scheme3_gui 
exe "hi goFloat guifg=".s:scheme11_gui 
exe "hi goFloats guifg=".s:scheme12_gui 
exe "hi goHexadecimalInt guifg=".s:scheme3_gui 
exe "hi goImaginary guifg=".s:scheme3_gui 
exe "hi goLabel guifg=".s:scheme3_gui 
exe "hi goOctalError guifg=".s:scheme1_gui 
exe "hi goOctalInt guifg=".s:scheme11_gui 
exe "hi goParen guifg=".s:scheme7_gui 
exe "hi goRawString guifg=".s:scheme10_gui 
exe "hi goRepeat guifg=".s:scheme3_gui 
exe "hi goSignedInts guifg=".s:scheme11_gui  
exe "hi goSpaceError guifg=".s:scheme0_gui." guibg=".s:scheme1_gui 
exe "hi goSpecialString guifg=".s:scheme12_gui 
exe "hi goStatement guifg=".s:scheme1_gui 
exe "hi goString guifg=".s:scheme10_gui 
exe "hi goTSComment guifg=".s:scheme8_gui
exe "hi goTSFunction guifg=".s:scheme4_gui 
exe "hi goTSInclude guifg=".s:scheme4_gui 
exe "hi goTSkeyword guifg=".s:scheme5_gui 
exe "hi goTSKeywordFunction guifg=".s:scheme5_gui 
exe "hi goTSMethod guifg=".s:scheme4_gui 
exe "hi goTSNumber guifg=".s:scheme8_gui 
exe "hi goTSOperator guifg=".s:scheme12_gui
exe "hi goTSProperty guifg=".s:scheme1_gui 
exe "hi goTSPunctBracket guifg=".s:scheme6_gui
exe "hi goTSPunctDelimiter guifg=".s:scheme13_gui 
exe "hi goTSRepeat guifg=".s:scheme3_gui 
exe "hi goTSString guifg=".s:scheme10_gui 
exe "hi goTSType guifg=".s:scheme3_gui 
exe "hi goTSTypeBuiltin guifg=".s:scheme3_gui  
exe "hi goTSVariable guifg=".s:scheme5_gui 
exe "hi goTodo guifg=".s:scheme3_gui 
exe "hi goType guifg=".s:scheme3_gui 

" NvimTree Highlights 
exe "hi NvimTreeFolderIcon guifg=".s:scheme3_gui 
exe "hi NvimTreeFoldername guifg=".s:schemefg_gui 
exe "hi NvimTreeOpenedFolderName guifg=".s:scheme4_gui 
exe "hi NvimTreeEmptyFolderName guifg=".s:scheme4_gui 
exe "hi NvimTreeFileDirty guifg=".s:scheme1_gui 
exe "hi NvimTreeExecFile guifg=".s:schemefg_gui 
exe "hi NvimTreeGitDirty guifg=".s:scheme1_gui 
exe "hi NvimTreeGitDeleted guifg=".s:scheme1_gui 
exe "hi NvimTreeRootFolder guifg=".s:scheme5_gui 
exe "hi NvimTreeIndentMarker guifg=".s:scheme0_gui 
