" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exec 'noremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
endfor

" NvimTree
nnoremap <silent> <A-e> :NvimTreeToggle<CR>
nnoremap <silent> <A-r> :NvimTreeToggle<CR>

nnoremap o ^
vnoremap o ^

" tab line over
nnoremap e >>^
vnoremap e >^

nnoremap w <<^
vnoremap w <^

nnoremap f za
