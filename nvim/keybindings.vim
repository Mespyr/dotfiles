" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

""" Text manipulation

" tab line over
nmap e 0i<Tab><esc>h^

" NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
