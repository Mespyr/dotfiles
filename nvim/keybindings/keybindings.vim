" Keybindings

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	" exec 'cnoremap' key '<Nop>'
endfor

" deleting
nmap e dd 
nmap f dw
nmap z d$

