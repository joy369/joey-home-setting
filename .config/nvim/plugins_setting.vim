""""""""""""""""""""""""""""""""""""""""""""""
" Start from here, we configure with plugins "
""""""""""""""""""""""""""""""""""""""""""""""

" If compile/install ctags on your own, and add to your bash
" let g:my_uctags_executable=expand('$UNIVERSAL_CTAGS')

" gutentags
" let g:gutentags_ctags_executable=g:my_uctags_executable
let g:gutentags_ctags_filetypes=[".git", ".svn", ".repo", ".root"]
let g:gutentags_ctags_tagfile='.tags'
let s:vim_tags=expand("~/.cache/tags")
let g:gutentags_cache_dir=s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" tagbar
" let g:tagbar_ctags_bin=g:my_uctags_executable
nmap <F8> :TagbarToggle<CR>

"fzf
let $FZF_DEFAULT_OPTS=' --color=bg:#2e3440'
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --bind "ctrl-a:select-all,ctrl-d:deselect-all"'
let $FZF_DEFAULT_COMMAND = 'find -L'
nnoremap <silent> <leader>f :Files <Cr>
nnoremap <silent> <leader>r :GFiles <Cr>
nnoremap <silent> <leader>g :RG <Cr>
nnoremap <silent> <leader>l :BLines <Cr>
nnoremap <silent> <leader>b :Buffers <Cr>
nnoremap <silent> <leader>L :Lines <Cr>
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --no-ignore-dot --no-ignore-vcs --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
