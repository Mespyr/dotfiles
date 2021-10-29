" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" NvimTree
nnoremap <silent> <A-e> :NvimTreeToggle<CR>
nnoremap <silent> <A-f> :NvimTreeFindFile<CR>

" reload nvim
nnoremap <A-w> :source ~/.config/nvim/init.vim<CR>

" tab line over
nnoremap e 0i<Tab><esc>^
nmap o ^
