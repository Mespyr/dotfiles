" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>'] 
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	exec 'cnoremap' key '<Nop>'
endfor

" keybindings
nmap - dd 
nmap f dwi
