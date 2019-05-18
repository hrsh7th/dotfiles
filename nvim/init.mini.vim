if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

let dein = {}
let dein.dir = {}
let dein.dir.install = $XDG_CONFIG_HOME . '/dein.mini/repos/github.com/Shougo/dein.vim'
let dein.dir.plugins = $XDG_CONFIG_HOME . '/dein.mini'

if !isdirectory(dein.dir.install)
  call mkdir(dein.dir.install, 'p')
  call system(printf('git clone https://github.com/Shougo/dein.vim %s', shellescape(dein.dir.install)))
endif

let &runtimepath = &runtimepath . ',' . dein.dir.install
if dein#load_state(dein.dir.install)
  call dein#begin(dein.dir.plugins)
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim', { 'rev': 'ui' })
  call dein#end()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType denite call s:denite_setting()
function! s:denite_setting() abort
  nnoremap <silent><buffer><expr>i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr>a       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr>q       denite#do_map('quit')
  nnoremap <silent><buffer><expr><Esc>   denite#do_map('quit')
  nnoremap <silent><buffer><expr><Tab>   denite#do_map('choose_action')
  nnoremap <silent><buffer><expr><C-l>   denite#do_map('redraw')
  nnoremap <silent><buffer><expr><C-h>   denite#do_map('restore_sources')
  nnoremap <silent><buffer><expr><CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr>v       denite#do_map('do_action', 'vsplitswitch')
  nnoremap <silent><buffer><expr>s       denite#do_map('do_action', 'splitswitch')
  nnoremap <silent><buffer><expr>@       denite#do_map('toggle_select')
endfunction

if executable('ag')
  call denite#custom#var('file/rec', 'command', [
        \   'ag',
        \   '--follow',
        \   '--nocolor',
        \   '--nogroup',
        \   '-g',
        \   ''
        \ ])
endif

call denite#custom#option('_', 'winheight', 12)
call denite#custom#option('_', 'winminheight', 6)
call denite#custom#option('_', 'vertical_preview', v:true)
call denite#custom#option('_', 'mode', 'normal')
call denite#custom#option('_', 'updatetime', 500)
call denite#custom#option('_', 'skiptime', 500)
call denite#custom#option('_', 'auto_resize', v:true)
call denite#custom#option('_', 'unique', v:true)

let s:menus = {}
let s:menus.vim = {'description': 'vim runtime.'}
let s:menus.vim.command_candidates = [
      \ ['upgrade: dein:deps', 'call dein#update()']
      \ ]
call denite#custom#var('menu', 'menus', s:menus)

