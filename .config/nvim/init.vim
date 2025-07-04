" set leader key
let mapleader = " " " map leader to Space

" source the plugins settings
source .config/nvim/plugins_install.vim
source .config/nvim/plugins_setting.vim
" source the setting for lua
source .config/nvim/lua_plugin_setting.lua

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
"set listchars=tab:│\ ,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»

" for search & color
set ignorecase
set smartcase
set incsearch
set hlsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set termguicolors
set background=dark
colorscheme tokyonight-moon
" set background transparent
hi Normal guibg=NONE ctermbg=NONE

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 20
"  auto open
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Tab to switch buffer
nnoremap <silent> <tab> :bnext<CR>
nmap <S-tab> :bprevious <CR>
"term mode
nnoremap <silent> <F2> : vert split <bar> : set nu! rnu! <bar> : term <CR>

" Get back to normal mode in terminal windows
tnoremap <Esc> <C-\><C-n>

" remap for better life
nnoremap n nzz
nnoremap N Nzz

" windows navigate
" setup paste mode
let g:pasteMode = 0
function SwitchPasteMode()
  if g:pasteMode == 0
    set nonu nornu nolist paste
    let g:pasteMode = 1
  else
    set nu rnu list nopaste
    let g:pasteMode = 0
  endif
endfunction
nnoremap <silent> <F4> :call SwitchPasteMode() <CR>

" setup present mode
let g:presentMode = 0
function SwitchPresentMode()
  if g:presentMode == 0
    colorscheme gruvbox
    set nornu
    set nocursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40
    "hi Normal guibg=NONE ctermbg=NONE
    let g:presentMode = 1
  else
    set rnu
    set cursorline!
    let g:presentMode = 0
    colorscheme gruvbox
    hi Normal guibg=NONE ctermbg=NONE
  endif
endfunction
nnoremap <silent> <F5> :call SwitchPresentMode() <CR>

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

