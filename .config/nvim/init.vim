"
"      Neovim config
"
"      github.com/Mespyr
"
source $HOME/.config/nvim/settings/settings.lua
source $HOME/.config/nvim/settings/fold.vim
source $HOME/.config/nvim/plugins/init.vim
source $HOME/.config/nvim/settings/colors.vim
source $HOME/.config/nvim/settings/keybindings.vim
source $HOME/.config/nvim/lazyload/init.lua

autocmd BufRead,BufNewFile *.ilu setlocal filetype=ilu syntax=ruby tabstop=2
" autocmd BufLeave           *.ilu set tabstop=4
" autocmd Filetype ilu setlocal tabstop=2
