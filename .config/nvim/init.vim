" set leader key
let mapleader = " " " map leader to Space

" source the plugins settings
source ~/.config/nvim/plugins_install.vim
source ~/.config/nvim/plugins_setting.vim
" source the setting for lua
if has('nvim')
  source ~/.config/nvim/lua_plugin_setting.lua
endif

" env setting
set signcolumn=no
set mouse=
set nofoldenable
set foldmethod=manual
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
syntax on
set number
set relativenumber
set ruler
set splitright
set splitbelow
set noswapfile
set nobackup
set noerrorbells
set nowrap
set scrolloff=10
set shell=/bin/bash

" for finding files
set path+=**
set wildmenu
set wildignorecase
set wildmode=longest,full

" indent setting
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype cpp setlocal shiftwidth=2 tabstop=2
autocmd Filetype hpp setlocal shiftwidth=2 tabstop=2
autocmd Filetype typescript setlocal shiftwidth=2 tabstop=2
autocmd Filetype js setlocal shiftwidth=2 tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype vue setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" show implicit mark
set list
set listchars=tab:│\ ,space:·,nbsp:␣,trail:•,eol:↲

" for search & color
set ignorecase
set smartcase
set incsearch
set hlsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set termguicolors
set background=dark
" set colorscheme for nvim/vim
if has('nvim')
  colorscheme tokyonight-moon
else
  colorscheme sonokai
endif
" set background transparent
hi Normal guibg=NONE ctermbg=NONE

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 20

" Tab to switch buffer
nnoremap <silent> <tab> :bnext<CR>
nmap <S-tab> :bprevious <CR>
"term mode
nnoremap <silent> <F2> : vert split <bar> : set nonu nornu <bar> : term <CR>

" Get back to normal mode in terminal windows
tnoremap <Esc> <C-\><C-n>

" remap for better life
nnoremap n nzz
nnoremap N Nzz

" setup paste mode
let w:pasteMode = 0
function SwitchPasteMode()
  if w:pasteMode == 0
    set nonu nornu nolist paste
    let w:pasteMode = 1
  else
    set nu rnu list nopaste
    let w:pasteMode = 0
  endif
endfunction
nnoremap <silent> <F3> :call SwitchPasteMode() <CR>

" setup present mode
let w:presentMode = 0
function SwitchPresentMode()
  if w:presentMode == 0
    colorscheme gruvbox
    set nornu
    set nu
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40
    let w:presentMode = 1
  else
    set rnu
    set nu
    let w:presentMode = 0
    colorscheme gruvbox
    set nocursorline
    hi Normal guibg=NONE ctermbg=NONE
  endif
endfunction
nnoremap <silent> <F4> :call SwitchPresentMode() <CR>

" find files and populate the quickfix list
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -iname "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)

