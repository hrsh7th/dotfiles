scriptencoding utf-8
set nocompatible

" ----------
" Bundle Plugin. {{{
" ----------
  if !neobundle#is_installed('unite.vim')
    NeoBundle 'git://github.com/Shougo/unite.vim.git'
  endif
  if !neobundle#is_installed('vimproc')
    NeoBundle 'git://github.com/Shougo/vimproc', { 'build': { 'windows': 'make -f make_mingw32.mak', 'cygwin': 'make -f make_cygwin.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak', } }
  endif
" }}}

let g:unite_split_rule = "botright"
let g:unite_winheight = 15
let g:unite_enable_start_insert = 0
let g:unite_update_time = 200
call unite#set_profile('action', 'context', { 'no_start_insert': 1 })
