" plugins
call plug#begin(stdpath('data') . '/plugged')

    " Plug 'itchyny/lightline.vim'                                  " lightline 
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-web-devicons' " lua

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " treesitter
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe' 
    Plug 'Mespyr/onedark.vim'

call plug#end()
