"
"      Neovim config
"
"      github.com/Mespyr
"
source $HOME/.config/nvim/settings/settings.lua
source $HOME/.config/nvim/plugins/init.vim
source $HOME/.config/nvim/settings/colors.vim
source $HOME/.config/nvim/settings/keybindings.vim
source $HOME/.config/nvim/lazyload/init.lua

autocmd BufRead,BufNewFile *.ilu set filetype=ilu syntax=ruby
