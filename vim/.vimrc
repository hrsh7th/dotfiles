" ---------------------------------------------------------
" Behavior Settings.
" ---------------------------------------------------------
" using vim.
set nocompatible

" set environment.
let s:is_win = has('win32') || has('win64')
let s:is_mac = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
let s:is_linux = !s:is_win && !s:is_mac

" set $MYVIMRUNTIME.
if s:is_win
  let $MYVIMRUNTIME=expand('~/vimfiles')
else
  let $MYVIMRUNTIME=expand('~/.vim')
endif

" shellslash.
if s:is_win
  set shellslash
endif

" setting neobundle.
if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+='. expand('$MYVIMRUNTIME/bundle/neobundle.vim')
  call neobundle#rc(expand('$MYVIMRUNTIME/bundle'))
endif

NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vesting.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/dannyob/quickfixstatus.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/hrsh7th/unite-todo.git'
NeoBundle 'git://github.com/hrsh7th/vim-better-css-indent.git'
NeoBundle 'git://github.com/hrsh7th/vim-insert-point.git'
NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
NeoBundle 'git://github.com/hrsh7th/vim-neco-snippets.git'
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/hrsh7th/vim-trailing-whitespace.git'
NeoBundle 'git://github.com/hrsh7th/vim-unite-vcs.git'
NeoBundle 'git://github.com/hrsh7th/vim-versions.git'
NeoBundle 'git://github.com/jceb/vim-hier.git'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/kana/vim-smartinput.git'
NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'git://github.com/osyo-manga/shabadou.vim.git'
NeoBundle 'git://github.com/osyo-manga/vim-watchdogs.git'
NeoBundle 'git://github.com/pangloss/vim-javascript.git'
NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
NeoBundle 'git://github.com/t9md/vim-quickhl.git'
NeoBundle 'git://github.com/thinca/vim-ft-svn_diff.git'
NeoBundle 'git://github.com/thinca/vim-openbuf.git'
NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
NeoBundle 'git://github.com/tyru/caw.vim.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
NeoBundle 'git://github.com/vim-jp/vital.vim.git'
NeoBundle 'git://github.com/vim-scripts/actionscript.vim--Leider.git'
NeoBundle 'git://github.com/vim-scripts/matchit.zip.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'

" set terminal color.
set t_Co=256

" for ctags.
set tags=./.tags;

" set mapleader.
let mapleader="\<Space>"

" incremental search.
set incsearch

" highlighting search.
set hlsearch

" ignorecase
set ignorecase

" smartcase.
set smartcase

" no beep.
set noerrorbells
set novisualbell
set t_vb=

" disable backup.
set nobackup

" switch buffer.
set hidden

" disable swap file.
set noswapfile

" read file.
set autoread
autocmd! WinEnter * checktime

" undo-persistence.
if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif

" using clipboard.
set clipboard+=unnamed

" wrap column.
set textwidth=0

" scrolling.
set scrolloff=3 sidescrolloff=3

" visualmode block.
set virtualedit=all

" enable modeline.
set modeline
set modelines=1

" updatetime.
set updatetime=100

" encoding.
set encoding=utf-8

" equalalways.
set equalalways

" not preview.
set completeopt-=preview

" paste toggle.
set pastetoggle=<F9>

" on syntax.
syntax on

" on filetype.
filetype on

" use filetype plugin.
filetype plugin on

" use filetype indent.
filetype indent on

" ---------------------------------------------------------
" Edit Settings.
" ---------------------------------------------------------
" autoindent.
set autoindent

" cindent.
set cindent

" smartindent.
set smartindent

" tabwidth.
set shiftwidth=4

" format.
set comments=sl:/*,mb:\ *,elx:\ */
set formatoptions+=rco

" softtab.
set expandtab

" hardtab.
set tabstop=4

" softtab.
set softtabstop=4

" backspace behavior.
set backspace=2

" commandline complete.
set wildmenu
set wildmode=longest:list,list

" cursor move behavior.
set whichwrap=b,s,h,l,<,>,[,]

" secure.
set nosecure

" ---------------------------------------------------------
" Display Settings.
" ---------------------------------------------------------
" show title.
set notitle

" highlighting cursorline.
set cursorline

" commandline height.
set cmdheight=2

" visible statusline.
set laststatus=2

" diffopts.
set diffopt=filler,iwhite

" no wrap.
set nowrap

" fold settings.
function! MyFoldtext()
  let txt = matchstr(getline(v:foldstart+1), '^\([\s\t]\+\)') . '>>>>>>>>> ' . (v:foldend - v:foldstart) . ' <<<<<<<<'
  let num = winwidth('.')
  while num > 0
    let txt = txt. ' '
    let num = num - 1
  endwhile
  return txt
endfunction
set foldmethod=indent
set foldnestmax=3
set foldlevelstart=1
set foldminlines=3
set foldtext=MyFoldtext()

" show special chars.
set list
set listchars=tab:\|\ ,trail:^

" show ruler.
set ruler

" show commands in statusline.
set showcmd

" not show messages.
set shortmess+=I

" show numbers.
set number
" set relativenumber

" cui colorscheme.
colorscheme jellybeans

" ---------------------------------------------------------
" GUI Settings.
" ---------------------------------------------------------
set mouse=n
if has('gui_running')
  " line height.
  set linespace=0

  " disable ime.
  set iminsert=0
  set imsearch=0

  " ime color.
  highlight CursorIM guibg=#ff0000 guifg=NONE

  " visible gui parts.
  set guioptions-=m guioptions-=T guioptions+=b

  " multibyte characters.
  set ambiwidth=double

  " font.
  if s:is_win
    set guifont=Consolas:h10:b
    set guifontwide=MigMix_1m:h9:b
  elseif s:is_mac
    set guifont=Menlo:h9
  elseif s:is_linux
    set guifont="VL ゴシック":h8:b
    set guifontwide="VL ゴシック":h8:b
  endif

  " no mouse focus.
  set nomousefocus
endif

" ---------------------------------------------------------
" Global KeyMappings.
" ---------------------------------------------------------
" quit window.
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>t :tabclose<Cr>
nnoremap <Leader>! :q!<Cr>

" save window.
nnoremap <Leader>w :w<Cr>

" move window.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" move tab.
nnoremap <Leader><S-l> :tabnext<Cr>
nnoremap <Leader><S-h> :tabprev<Cr>

" nohlsearch.
nmap <Leader><Esc> :nohlsearch<Cr><Plug>(quickhl-reset)

" move visual line.
nnoremap j gj
nnoremap k gk

" big scroll.
nnoremap <S-l> 15l
nnoremap <S-h> 15h
nnoremap <S-k> 8k
nnoremap <S-j> 8j
vnoremap <S-l> 15l
vnoremap <S-h> 15h
vnoremap <S-k> 8k
vnoremap <S-j> 8j

" for us key.
nnoremap - ^
vnoremap - ^

" quick replace.
nnoremap <Leader>* *:%s/<C-r>///g<Left><Left>

" join line.
nnoremap <C-j> <S-j>x

" move insert-mode.
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

" using commandline-window.
nnoremap : q:
xnoremap : q:

" using unite line.
nnoremap / :<C-u>Unite -buffer-name=line_fast -start-insert line/fast<CR>
nnoremap * :<C-u>UniteWithCursorWord -buffer-name=line_fast -no-start-insert line/fast<CR>
nnoremap n :<C-u>UniteResume -no-start-insert line_fast<CR>

" enter pair.
inoremap <expr><CR> g:my_pair_enter()

" delete pair.
inoremap <expr><BS> g:my_pair_delete()

" close pair.
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" VimFiler
nnoremap <expr><F2> ":VimFilerBufferDir -split -auto-cd -buffer-name=" . g:my_vimfiler_explorer_name . " -winwidth=". g:my_vimfiler_winwidth. " -toggle -no-quit<Cr>"

" VimShell
nnoremap <F5>  :VimShell<Cr>

" Unite
nnoremap m                :Unite resume<Cr>
nnoremap <expr>gf        ":Unite -input=^.*" . g:my_get_cursor_path() . " file_rec/async:". (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!") . "<Cr>"
nnoremap <expr><F3>      ":Unite -buffer-name=buffer_tab-file_rec/async -hide-source-names -silent buffer_tab file_rec/async:". (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"). "<Cr>"
nnoremap <F6>             :Unite -buffer-name=vcs_status vcs/status<Cr>
nnoremap <F7>             :Unite -buffer-name=vcs_log vcs/log<Cr>
nnoremap <F8>             :Unite -buffer-name=outline -vertical -winwidth=45 outline<Cr>
nnoremap <F10>            :VimShellTab<Cr>
nnoremap <F12>            :Unite -buffer-name=process process<Cr>
nnoremap <Leader>u        :Unite -buffer-name=source -no-start-insert source<Cr>
nnoremap <Leader>0        :Unite -buffer-name=source -no-start-insert menu:global<Cr>

" Neocomplcache
imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ?
      \ "\<Plug>(neocomplcache_snippets_expand)"
      \ : (getline('.')[0:col('.')] =~# '^\s\+$' ? "\<Tab>" : "\<Plug>(insert_point_next_point)")
imap <S-Tab> <Plug>(insert_point_prev_point)
smap <Tab> <Plug>(insert_point_next_point_select)
smap <S-Tab> <Plug>(insert_point_prev_point_select)
inoremap ] <C-n>
inoremap <expr>} getline('.')[0:col('.')] =~# '\s*' ? "}" : "\<C-p>"

" QuickRun
nnoremap <Leader>r :QuickRun<Cr>

" Caw
nmap <Leader><Leader> <Plug>(caw:i:toggle)
vmap <Leader><Leader> <Plug>(caw:i:toggle)

" Quickhl
nmap <Leader>m <Plug>(quickhl-toggle)
vmap <Leader>m <Plug>(quickhl-toggle)

" Surround
nnoremap <expr>cis g:my_surround_detect('ci')
nnoremap <expr>dis g:my_surround_detect('di')
nnoremap <expr>vis g:my_surround_detect('vi')

" ---------------------------------------------------------
" Command Settings.
" ---------------------------------------------------------
" switch CodingStyle.
let g:my_coding_style = {}
let g:my_coding_style['s4'] = 'setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4'
let g:my_coding_style['s2'] = 'setlocal expandtab   tabstop=2 shiftwidth=2 softtabstop=2'
let g:my_coding_style['t']  = 'setlocal noexpandtab'
let g:my_coding_style['t4'] = 'setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4'
let g:my_coding_style['t2'] = 'setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2'
command! -bar -nargs=1 CodingStyle exec get(g:my_coding_style, <f-args>, '')

" ---------------------------------------------------------
" Other Settings.
" ---------------------------------------------------------
" for extension.
autocmd! BufRead,BufNewFile *.ejs set filetype=html

" for filetype.
autocmd! Filetype diff setlocal nofoldenable
autocmd! Filetype js set filetype=javascript
autocmd! Filetype javascript execute get(g:my_coding_style, 's2', '')
autocmd! BufNewFile,BufRead *.as set filetype=actionscript
autocmd! Filetype actionscript execute get(g:my_coding_style, 't4', '')
autocmd! Filetype coffee execute get(g:my_coding_style, 's2', '')
autocmd! Filetype smarty set filetype=html
autocmd! Filetype vim execute get(g:my_coding_style, 's2', '')
autocmd! Filetype php execute get(g:my_coding_style, 's2', '')
autocmd! Filetype html execute get(g:my_coding_style, 's2', '')
autocmd! Filetype css execute get(g:my_coding_style, 's2', '')
autocmd! Filetype scss execute get(g:my_coding_style, 's2', '')
autocmd! FileType * call g:my_all_filetype_settings()
function! g:my_all_filetype_settings()
  setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/
endfunction

" shadow.
autocmd! BufWinLeave *.shd call g:my_shd_settings()
function! g:my_shd_settings()
  enew
  setlocal nobuflisted
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  silent exec 'bdelete! '. expand('<abuf>')
endfunction

" guienter.
autocmd! GUIEnter * call g:my_guienter_settings()
function! g:my_guienter_settings()
  if s:is_win
    set transparency=240
  elseif s:is_mac
    set transparency=20
  endif
endfunction

" using commandline-window.
autocmd! CmdwinEnter * call g:my_cmdwinenter_settings()
function! g:my_cmdwinenter_settings()
  nnoremap <buffer><Esc> :q<CR>
  startinsert!
endfunction

" detect encoding.
if !has('gui_running')
  if &term == 'win32' || &term == 'win64'
    set termencoding=cp932
    set encoding=japan
  else
    if $ENV_ACCESS ==# 'linux'
      set termencoding=euc-jp
    elseif $ENV_ACCESS ==# 'colinux'
      set termencoding=utf-8
    else
      set termencoding=&encoding
    endif
  endif
elseif s:is_win
  set termencoding=cp932
endif

" visible multibyte space.
highlight MbSpace cterm=underline ctermfg=lightblue guibg=darkgray
match MbSpace /　/

" define pair.
let g:pair = {
      \ '(': ')',
      \ '[': ']',
      \ '{': '}',
      \ '"': '"',
      \ "'": "'"
      \ }

" enter pair.
function! g:my_pair_enter()
  if g:my_pair_is_between()
    return "\<Cr>\<Up>\<End>\<Cr>"
  endif
  return "\<Cr>"
endfunction

" delete pair.
function! g:my_pair_delete()
  if g:my_pair_is_between()
    return "\<Right>\<Bs>\<Bs>"
  endif
  return "\<Bs>"
endfunction

" is between.
function! g:my_pair_is_between()
  if exists("g:pair[getline('.')[col('.') - 2]]")
    if getline('.')[col('.') - 1] == g:pair[getline('.')[col('.') - 2]]
      return 1
    endif
  endif
  return 0
endfunction

" auto detect surround char.
function! g:my_surround_detect(key)
  let pattern = "'\"{[("
  let front = strpart(getline("."), 0, col("."))
  let max = -1
  for pat in split(pattern, '.\zs')
    let pos = strridx(front, pat)
    if pos > max
      let max = pos
    endif
  endfor
  if max >= 0
    let surround = strpart(front, max, 1)
    return a:key . surround
  endif
endfunction

function! g:my_get_cursor_path()
  let saved_iskeyword = &iskeyword
  set iskeyword+=.,/
  let word = expand('<cword>')
  execute 'set iskeyword=' . saved_iskeyword
  if len(filter(matchlist(word, '\.'), 'strlen(v:val)')) > 1
    let word = substitute(word, '\.\|\\', '/', 'g')
  endif
  return word
endfunction

" ---------------------------------------------------------
" Plugin Settings.
" ---------------------------------------------------------
" echodoc
let g:echodoc_enable_at_startup=1

" Watchdogs.
let g:quickrun_config={}
let g:quickrun_config['watchdogs_checker/_'] = {
      \ 'hook/close_quickfix/enable_exit': 1
      \ }
let g:watchdogs_check_BufWritePost_enable=1
call watchdogs#setup(g:quickrun_config)

" VimFiler
let g:my_vimfiler_explorer_name='explorer'
let g:my_vimfiler_winwidth=35
let g:vimfiler_edit_action='nicely_open'
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorer=1
let g:vimfiler_directory_display_top=1
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_tree_opened_icon='-'
let g:vimfiler_tree_closed_icon='+'
augroup my-vimfiler
  autocmd!
  autocmd FileType vimfiler call g:my_vimfiler_settings()
  autocmd WinEnter * call g:my_vimfiler_winenter_settings()
  autocmd BufLeave * call g:my_vimfiler_bufleave_settings()
augroup END
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><F11> ":new \| VimFilerCreate -winwidth=". g:my_vimfiler_winwidth. " -no-quit<Cr>"
  nmap     <buffer><expr><Cr>  vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "e")
  nmap     <buffer><Tab>       <Plug>(vimfiler_choose_action)
  nmap     <buffer>c           <Plug>(vimfiler_clipboard_copy_file)
  nmap     <buffer>m           <Plug>(vimfiler_clipboard_move_file)
  nmap     <buffer>p           <Plug>(vimfiler_clipboard_paste)
  nmap     <buffer>@           <Plug>(vimfiler_toggle_mark_current_line)
  nmap     <buffer>j           j<Plug>(vimfiler_print_filename)
  nmap     <buffer>k           k<Plug>(vimfiler_print_filename)
  nmap     <buffer>;           <Plug>(vimfiler_cd_input_directory)
  nnoremap <buffer>b           :Unite -buffer-name=bookmark-vimfiler_history -default-action=cd -no-start-insert bookmark vimfiler/history<Cr>
  nnoremap <buffer>e           :call vimfiler#mappings#do_action('nicely_open')<Cr>
  nnoremap <buffer>v           :call vimfiler#mappings#do_action('nicely_vsplit')<Cr>
  nnoremap <buffer>s           :call vimfiler#mappings#do_action('nicely_split')<Cr>
  nnoremap <buffer><F5>        :call vimfiler#mappings#do_current_dir_action('my_project_cd')<Cr>
  nnoremap <buffer><F8>        :VimFilerTab -double<Cr>
endfunction
function! g:my_vimfiler_winenter_settings()
  if exists('b:vimfiler')
    let b:vimfiler.prev_winnr = winnr('#')
    set winfixwidth
  endif
endfunction
function! g:my_vimfiler_bufleave_settings()
  if !exists('b:vimfiler')
    set nowinfixwidth
  endif
endfunction

" Unite
let g:my_unite_project_dir=""
let g:unite_enable_start_insert=0
exec 'let g:unite_data_directory=expand("~/.unite")'
let g:unite_split_rule="botright"
let g:unite_source_grep_default_opts='-Hni'
let g:unite_source_file_mru_filename_format=''
let g:unite_source_file_rec_min_cache_files=0
let g:unite_source_file_rec_ignore_pattern=".sass-cache"
let g:unite_update_time=100
let g:unite_winheight=15
call unite#set_profile('action', 'context', {
      \   'start_insert': 0
      \ })
augroup my-unite
  autocmd!
  autocmd FileType unite call g:my_unite_settings()
  autocmd WinEnter * call g:my_unite_winenter_settings()
augroup END
function! g:my_unite_settings()
  nmap <buffer><Esc>       <Plug>(unite_exit)
  nmap <buffer>:q          <Plug>(unite_exit)
  nmap <buffer><Leader>q   <Plug>(unite_exit)
  nmap <buffer>@           <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer>a           <Plug>(unite_append_end)
  nmap <buffer><C-p>       <Plug>(unite_loop_cursor_up)
  nmap <buffer><C-n>       <Plug>(unite_loop_cursor_down)
  imap <buffer><C-p>       <Plug>(unite_insert_leave)
  imap <buffer><C-n>       <Plug>(unite_insert_leave)
  nnoremap <buffer><expr>s unite#do_action('split')
  nnoremap <buffer><expr>v unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.profile_name == 'todo'
    nnoremap <buffer><S-n> :UniteTodoAddSimple<Cr>
  endif
endfunction
function! g:my_unite_winenter_settings()
  if exists('b:unite')
    let b:unite.prev_winnr = winnr('#')
  endif
endfunction

" Unite menu.
let g:unite_source_menu_menus={}
let g:unite_source_menu_menus.global = {
      \ 'description': 'global menu.'
      \ }
let g:unite_source_menu_menus.global.candidates = {
      \ 'NeoComplCacheEditSnippets': 'NeoComplCacheEditSnippets',
      \ 'set filetype=': 'execute "set filetype=" . input("filetype: ")',
      \ 'e $MYVIMRC': 'e $MYVIMRC',
      \ 'Unite neobundle/update': 'Unite neobundle/update',
      \ }
function! g:unite_source_menu_menus.global.map(key, value)
  return { 'word': a:key, 'kind': 'command', 'action__command': a:value }
endfunction

" unite filter.
let my_filter = { 'name' : 'matcher_remove' }
function! my_filter.filter(candidates, context)
  let candidates = a:candidates
  for regex in ['^*vimfiler*', '^*vimshell*']
    let candidates = filter(a:candidates, 'v:val.word !~# "'. regex. '"')
  endfor
  return candidates
endfunction
call unite#define_filter(my_filter)
call unite#custom_filters('buffer_tab', ['matcher_remove', 'matcher_glob', 'converter_default', 'sorter_default'])

" unite action.
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec g:get_prev_winnr(). 'wincmd w'
  call vimfiler#mappings#do_current_dir_action('rec/async')
endfunction
call unite#custom_action('file', 'nicely_rec/async', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'edit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'nicely_open', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'nicely_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'nicely_vsplit', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  let g:my_unite_project_dir=a:candidates[0].action__directory
endfunction
call unite#custom_action('file', 'my_project_cd', my_action)

function! g:get_prev_winnr()
  let ftypes = ['unite', 'vimshell', 'vimfiler']

  " vimfiler or unite has prev_winnr?
  if exists('b:vimfiler.prev_winnr')
    let nr = b:vimfiler.prev_winnr
  endif
  if exists('b:unite.prev_winnr')
    let nr = b:unite.prev_winnr
  endif

  " return b:{vimfiler,unite}.prev_winnr if don't match ftypes.
  if exists('nr') && (index(ftypes, getwinvar(nr, '&filetype')) < 0)
    return nr
  endif

  " auto detect.
  let winnrs = range(1, winnr('$'))
  if len(winnrs) == 1
    return winnrs[0]
  endif
  if len(winnrs) <= 2
    return filter(winnrs, 'getwinvar(v:val, "&filetype") != "vimfiler"')[0]
  endif
  let winnrs = filter(winnrs, 'index(ftypes, getwinvar(v:val, "&filetype")) < 0')
  if empty(winnrs)
    return winnr()
  endif
  return winnrs[0]
endfunction

" neosnippet
if isdirectory($MYVIMRUNTIME. '/bundle/vim-neco-snippets')
  let g:neosnippet#snippets_directory =$MYVIMRUNTIME. '/bundle/vim-neco-snippets'
  let g:neosnippet#disable_runtime_snippets={}
  let g:neosnippet#disable_runtime_snippets['_']=1
endif

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_wildcard=1
let g:neocomplcache_tags_caching_limit_file_size=1
let g:neocomplcache_min_keyword_length=4
let g:neocomplcache_dictionary_filetype_lists={}
let g:neocomplcache_dictionary_filetype_lists['default']=''
let g:neocomplcache_dictionary_filetype_lists['vimshell']=$HOME. '/.vimshell/command-history'
let g:neocomplcache_auto_completion_start_length=2
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns={}
endif
let g:neocomplcache_keyword_patterns['default']='\h\w*'
if !exists('g:neocomplcache_source_disable')
  let g:neocomplcache_source_disable = {}
endif
let g:neocomplcache_source_disable.include_complete=1
let g:neocomplcache_source_disable.omni_complete=1
let g:neocomplcache_source_disable.tags_complete=1
let g:neocomplcache_source_disable.syntax_complete=1
let g:neocomplcache_source_disable.dictionary_complete=1

" VimShell
let g:vimshell_popup_height=40
let g:vimshell_popup_command='topleft sp | execute "resize " . g:my_vimshell_popup() | set winfixheight'
let g:vimshell_prompt='> '
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt='"[" . g:my_vimshell_right_prompt() . "]"'
let g:vimshell_disable_escape_highlight=1
autocmd! FileType vimshell call g:my_vimshell_settings()
function! g:my_vimshell_settings()
  nnoremap <buffer>a           G$a
  inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
        \ 'start_insert' : 0,
        \ 'default_action': 'insert',
        \ 'input' : vimshell#get_cur_text(),
        \ })
  call vimshell#altercmd#define('ls', 'ls -al')
  call vimshell#altercmd#define('ll', 'ls -al')
  call vimshell#altercmd#define('l', 'll')
  call vimshell#hook#add('chpwd', 'my_vimshell_hook_chpwd', 'g:my_vimshell_hook_chpwd')
endfunction
function! g:my_vimshell_right_prompt()
  let p = vimproc#popen3('git symbolic-ref --short HEAD')
  let res = ''
  while !p.stdout.eof
    let res .= p.stdout.read()
  endwhile
  return '% ' . substitute(res, '\n', '', 'g') . ' %'
endfunction
function! g:my_vimshell_hook_chpwd(args, context)
  call vimshell#execute('ls -al')
endfunction
autocmd! Filetype int-* call g:my_vimshell_interactive_settings()
function! g:my_vimshell_interactive_settings()
  inoremap <buffer><Tab>       <Nop>
  imap <buffer><expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : g:my_pair_skippable() ? g:my_pair_skip() : pumvisible() ? "\<C-n>" : g:my_pair_skip()
endfunction
function! g:my_vimshell_popup()
  return winheight(0) * g:vimshell_popup_height / 100
endfunction

" PrettyPrint
let g:prettyprint_indent=2
let g:prettyprint_width=50

" ZenCoding
let g:user_zen_expandabbr_key='<C-k>'
let g:user_zen_complete_tag=1
let g:user_zen_settings = {}
let g:user_zen_settings['html'] = { 'lang': 'ja', 'indentation': '  ' }
let g:user_zen_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
let g:user_zen_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }

" trailing-whitespace
let g:trailing_whitespace_fix_events = {
      \ 'BufWritePost': 1,
      \ }

" shadow
let g:shadow_debug=1

" powerline
let g:Powerline_symbols='unicode'

" rainbow_parentheses.
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
try
  call rainbow_parentheses#load(0)
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
catch
endtry

let g:versions#debug = 1

