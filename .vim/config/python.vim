imap ,l <esc>A
imap ,o <esc>o
"""""""""""""""""""""
" Autocomplétitions "
"""""""""""""""""""""
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap < <><left>
""""""""""""""
" Raccourcis "
""""""""""""""
" Déplacement dans les racourcis
imap ,m <esc>/<++><CR><C-n>cf>
" création d'une class
inoremap ,cl class :<CR>""" <++> """<CR>def __init__(self<++>):<CR><tab><++><esc>3k^f:i
" création d'une fonction
inoremap ,def def (self<++>):<CR><++><esc>k^f(i
" création du main
inoremap ,ma <esc>0iif __name__ == "__main__":<CR><tab>

map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs =0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT <C-c>

" Better navigation through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
" Python folding
set nofoldenable

