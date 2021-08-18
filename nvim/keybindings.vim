" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" NvimTree
nnoremap <C-n> :NvimTreeOpen<CR>
nnoremap <C-e> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

""" Text manipulation

" tab line over
nmap e 0i<Tab><esc>h^
