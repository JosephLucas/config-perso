" Github interesting :
" https://github.com/mbrochh/vim-as-a-python-ide
""""""""""""""""""""""""
" Configuration Vundle "
""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'

  " Vim-powerline
  Plugin 'Lokaltog/vim-powerline'
  set laststatus=2

  " Settings for ctrlp
  Plugin 'kien/ctrlp.vim'
  let g:ctrp_max_height = 30
  set wildignore+=*.pyc
  set wildignore+=*_build/*
  set wildignore+=*/coverage/*

  " NERDTree
  Plugin 'scrooloose/nerdtree'
  autocmd VimEnter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " fermeture automatique

  " VimWiki
  Plugin 'vim-scripts/vimwiki'

  " Orthographe et grammaire
  Plugin 'vim-scripts/LanguageTool'

  " Latex
  "Plugin 'gerw/vim-latex-suite'

  " Python
  Plugin 'klen/python-mode'
  " Plugin 'vim-scripts/Efficient-python-folding'

  " MPIDE - arduino
  Plugin 'jplaut/vim-arduino-ino'

call vundle#end()

""""""""""""""""""""""""
" Configuration de vim "
""""""""""""""""""""""""
" Automatic relading of .vimrc
autocmd! bufwritepost .vimrc source %

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a
set bs=2

" Complétition  commande vim
set wildmenu
set wildmode=full

" Time shortcut-key (timeoutlen)
set tm=500

" Put workspace of open file
set acd
cab cwd cd %:h

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
" Remove highlight of the last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-z> :update<CR>
vnoremap <C-z> <C-C>:update<CR>
inoremap <C-z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Bind Ctrl+<mouvement> keys to move around the windows, instead of using Ctrl+w+<mouvement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier moving between tabs
map <Leader>p <esc>:tabprevious<CR>
map <leader>n <esc>:tabnext<CR>

" Easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFOR the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and lenght
set number	" show line numbers
set cursorline  " highlight line
set tw=79	" width of document (used by gd)
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and qwap files - they trigger too many events for file
" system watchers
set nobackup
set nowritebackup
set noswapfile

" Easy move
set scrolloff=1
set nostartofline

" Set 2 line downstare of the file
set scrolloff=2

" Remember of the last edition
if has("autocmd")
  filetype plugin indent on
    autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
  \ endif
endif

""""""""""
" Plugin "
""""""""""
" VimWiki
let g:vimwiki_folding=0
" Orthographe
setlocal spelllang=fr
set spellsuggest=5
autocmd BufEnter *.tex set spell
autocmd BufEnter *.txt set spell
map <F5> :set nospell<Cr>
map <F6> :setlocal spell spelllang=fr,en<Cr>
imap ,z <esc>z=
"map <Leader>zc z=
"map <Leader>z ]z
"map <Leader>Z [z
" Grammaire : LanguageTool
let g:languagetool_jar='$HOME/.vim/progExt/LanguageTool-2.5/languagetool-commandline.jar'

" Latex
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
au BufEnter,BufNewFile *.tex exe Flatex()
function! Flatex()
	  source ~/.vim/config/latex.vim
endfunction

" Python-mode
au BufEnter,BufNewFile *.py exe Fpython()
function! Fpython()
	  source ~/.vim/config/python.vim
endfunction

" MPIDE - arduino
au BufEnter,BufNewFile *.pde exe Fmpide()
au BufEnter,BufNewFile *.ino exe Fmpide()
function! Fmpide()
	  source ~/.vim/config/mpide.vim
endfunction

" Pour les fichiers vierges qui ont toujours les mêmes lignes au début
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
augroup END
