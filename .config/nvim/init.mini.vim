if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  " vint: -ProhibitSetNoCompatible
  set nocompatible
endif

if !isdirectory(expand('~/.vim/plugged/vim-plug'))
  silent !curl -fLo ~/.vim/plugged/vim-plug/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end
execute printf('source %s', expand('~/.vim/plugged/vim-plug/plug.vim'))

call plug#begin('~/.vim/plugged')
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'golang/vscode-go'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

let g:mapleader = ' '

set cmdheight=2
set background=dark
set laststatus=2
set autoread
set ignorecase
set noautoread
set smartcase
set history=50
set noexpandtab
set autoindent
set display=lastline
set directory-=.
set backspace=indent,eol,start
set wrapscan
set noshowmatch
set wildmenu
set ruler
set showcmd
set noswapfile
set nobackup

set nohlsearch
set cinoptions=>4
set visualbell
set incsearch
set pumheight=10
set isprint=@,~-247,249-255
set tags=./tags,tags,../tags
set diffopt=filler,iwhite
set completeopt=menuone,noinsert,noselect,popup
set grepprg=jvgrep\ -C\ -r
set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
set wildignore+=.git/*,.git\\*,.hg/*,.hg\\*,.svn/*,.svn\\*,node_modules/**
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.exe,.class
set ambiwidth=double

set cpoptions-=j
set textwidth=0
set foldopen+=hor,jump
set iminsert=0
set imsearch=0
set encoding=utf-8

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932
set termencoding=default
set fileformats=unix,dos
set fileformat=unix
set formatoptions+=mb
set viminfo='500,<50,s10,h,rA:,rB:
set expandtab
set t_Co=256

set shiftwidth=4
set tabstop=4
set nowrap

if !has('win32') && !has('win64')
  setglobal shell=/bin/bash
endif

if exists('&termguicolors')
  setglobal termguicolors
endif

if exists('&completeslash')
  setglobal completeslash=slash
endif

let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1

imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : "\<Tab>"
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : "\<Tab>"
imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

