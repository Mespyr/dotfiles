" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" NERDTree
nnoremap <C-n> :NvimTreeOpen<CR>
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFocus<CR>


""" Text manipulation

" tab line over
nmap e 0i<Tab><esc>h^
