" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" NvimTree
nnoremap <silent> <C-n> :NvimTreeOpen<CR>
nnoremap <silent> <C-e> :NvimTreeToggle<CR>
nnoremap <silent> <C-f> :NvimTreeFindFile<CR>

" tab line over
nmap e 0i<Tab><esc>h^
