" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " LSP & autocomplete
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " nvim-cmp
    Plug 'williamboman/mason.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

    " for my beautiful interface <3
    Plug 'arcticicestudio/nord-vim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'joshdick/onedark.vim'
    Plug 'sainnhe/sonokai'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " browse my file so fast
    Plug 'preservim/tagbar'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/goyo.vim'

    " Just give it a try :P
    Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
