" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
	exec 'noremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
endfor

" NvimTree
nnoremap <silent> <A-e> :NvimTreeToggle<CR>

" floaterm 
let g:floaterm_keymap_new = '<A-n>'
let g:floaterm_keymap_hide = '<esc>'
let g:floaterm_keymap_show = '<A-s>'

" reload nvim
nnoremap <silent> <A-r> :source ~/.ronfig/nvim/init.vim<CR>
    
" tab line over
nnoremap e >>^
nnoremap w <<^
nnoremap o ^
