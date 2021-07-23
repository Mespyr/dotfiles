" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" tab line over
nmap e 0i<Tab><esc>h^

