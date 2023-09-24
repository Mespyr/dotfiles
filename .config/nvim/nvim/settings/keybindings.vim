" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exec 'noremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
endfor

" PLUGINS
" all keybinds for plugins use <Alt>
" NvimTree
nnoremap <silent> <A-e> :NvimTreeToggle<CR>
" markdown-preview
nnoremap <silent> <A-o> :MarkdownPreviewToggle<CR>


" go to beginning of line (excluding spaces
nnoremap o ^
vnoremap o ^

" tab line over
nnoremap e >>^
vnoremap e >^

" tab line bacr
nnoremap w <<^
vnoremap w <^

" fold
nnoremap f za
