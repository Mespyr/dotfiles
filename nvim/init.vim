" add line numbers
set number
set numberwidth=3

" remove arrow key movement
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	exec 'cnoremap' key '<Nop>'
endfor

" keybindings
nmap - dd
