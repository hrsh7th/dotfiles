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
  call dein#local('~/Develop/LocalVimPlugins')
  call dein#end()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

