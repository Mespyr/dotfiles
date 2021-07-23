" plugins
call plug#begin(stdpath('data') . '/plugged')

    Plug 'itchyny/lightline.vim'                                  " lightline 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " treesitter
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe' 
    
call plug#end()
