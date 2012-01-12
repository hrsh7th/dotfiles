" ---------------------------------------------------------
" Behavior Settings.
" ---------------------------------------------------------
" using vim.
set nocompatible

" set environment.
let s:is_win   = has('win32') || has('win64')
let s:is_mac   = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
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
  filetype plugin indent off
  exec 'set runtimepath+='. expand('$MYVIMRUNTIME/bundle/neobundle.vim/')
  call neobundle#rc(expand('$MYVIMRUNTIME/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/unite-ssh.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/vim-scripts/matchit.zip.git'
NeoBundle 'git://github.com/vim-scripts/netrw.vim.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/vim-scripts/mrkn256.vim.git'
NeoBundle 'git://github.com/thinca/vim-openbuf.git'
NeoBundle 'git://github.com/thinca/vim-fontzoom.git'
NeoBundle 'git://github.com/thinca/vim-scouter.git'
NeoBundle 'git://github.com/thinca/vim-unite-history.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/t9md/vim-textmanip.git'
NeoBundle 'git://github.com/t9md/vim-quickhl.git'
NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
NeoBundle 'git://github.com/hrsh7th/vim-vsparser.git'
NeoBundle 'git://github.com/tyru/restart.vim.git'
NeoBundle 'git://github.com/tsukkee/unite-help.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/othree/eregex.vim.git'
NeoBundle 'git://github.com/soh335/unite-qflist.git'
NeoBundle 'git://github.com/choplin/unite-vim_hacks.git'

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

" using clipboard.
set clipboard+=unnamed

" wrap column.
set textwidth=0

" scrolling.
set scrolloff=3 sidescrolloff=3

" visualmode block.
set virtualedit=all

" encoding.
set encoding=utf-8

" equalalways.
set equalalways

" on syntax.
syntax on

" on filetype.
filetype on

" use filetype plugin.
filetype plugin on

" use filetype indent.
filetype indent off

" ---------------------------------------------------------
" Editting Settings.
" ---------------------------------------------------------
" autoindent.
set autoindent

" copy indnet.
set copyindent

" tabwidth.
set shiftwidth=4

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
set cmdheight=1

" visible statusline.
set laststatus=2

" setting statusline.
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" no wrap.
set nowrap
"set wrap

" show special chars.
set list
set listchars=trail:^

" show ruler.
set ruler

" show commands in statusline.
set showcmd

" not cursor blink.
set guicursor=a:blinkon0

" not show messages.
set shortmess+=I

" show numbers.
set number

" cui colorscheme.
colorscheme mrkn256

" ---------------------------------------------------------
" GUI Settings.
" ---------------------------------------------------------
if has('gui_running')
  " line height.
  set linespace=0

  " disable ime.
  set iminsert=0
  set imsearch=0

  " ime color.
  highlight CursorIM guibg=#ff0000 guifg=NONE

  " colorscheme in gui.
  colorscheme mrkn256

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
    set guifont=Menlo:h9
  endif

  " no mouse focus.
  set nomousefocus
endif

" ---------------------------------------------------------
" Global KeyMappings.
" ---------------------------------------------------------
" quit window.
nnoremap <Leader>q :q<Cr>

" move window.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" default codingstyle.
nnoremap <Leader><S-d> :<C-u>CodingStyle d<Cr>

" move tab.
nmap <Leader>tc    :tabclose<Cr>
nmap <Leader><S-l> :tabnext<Cr>
nmap <Leader><S-h> :tabprev<Cr>

" nohlsearch.
nmap <Leader><Esc> :nohlsearch<Cr><Plug>(quickhl-reset)

" move visual line.
nmap j gj
nmap k gk

" big scroll.
nmap <S-l> 10l10zl
nmap <S-h> 10h10zh
nmap <S-k> 5k5<C-y>
nmap <S-j> 5j5<C-e>

" formatter.
nmap <F12> ggVG=

" move insert-mode.
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

" insert cr.
inoremap <C-j> <Cr><Up><End>

" using commandline-window.
nnoremap : q:
xnoremap : q:

" enter pair.
inoremap <expr><Cr> g:my_pair_enter()

" delete pair.
inoremap <expr><Bs> g:my_pair_delete()

" VimFiler
nnoremap <expr><F2> ":<C-u>VimFiler -buffer-name=". g:my_vimfiler_explorer_name. " -split -simple -winwidth=". g:my_vimfiler_winwidth. " -toggle<Cr>"

" VimShell
nnoremap <F5>  :<C-u>VimShell<Cr>

" Unite
nnoremap <F3>  :<C-u>Unite -buffer-name=buffer_tab-file_mru buffer_tab file_mru<Cr>
nnoremap <C-l> :<C-u>UniteResume<Cr>
nnoremap <F8>  :<C-u>Unite -buffer-name=outline -vertical -winwidth=45 outline<Cr>
nnoremap ?     :<C-u>Unite -buffer-name=line -start-insert line<Cr>

" Neocomplcache
imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : g:my_pair_skip()

" textmanip
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-l> <Plug>(textmanip-move-right)
vmap <C-h> <Plug>(textmanip-move-left)

" QuickRun
nnoremap <Leader>r :<C-u>QuickRun<Cr>

" Quickhl
nmap <Leader>m <Plug>(quickhl-toggle)
vmap <Leader>m <Plug>(quickhl-toggle)

" ---------------------------------------------------------
" Command Settings.
" ---------------------------------------------------------
" switch CodingStyle.
let g:my_coding_styles = {}
let g:my_coding_styles['d']  = 'set expandtab   tabstop=4 shiftwidth=4 softtabstop&'
let g:my_coding_styles['s4'] = 'set expandtab   tabstop=4 shiftwidth=4 softtabstop&'
let g:my_coding_styles['s2'] = 'set expandtab   tabstop=2 shiftwidth=2 softtabstop&'
let g:my_coding_styles['t4'] = 'set noexpandtab tabstop=4 shiftwidth=4 softtabstop&'
let g:my_coding_styles['t2'] = 'set noexpandtab tabstop=2 shiftwidth=2 softtabstop&'
command! -bar -nargs=1 CodingStyle exec get(g:my_coding_styles, <f-args>, '')

" difforig
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" ---------------------------------------------------------
" Other Settings.
" ---------------------------------------------------------
" for extension.
autocmd! BufRead,BufNewFile *.ejs set filetype=html

" for filetypes.
autocmd! Filetype javascript exec get(g:my_coding_styles, 's2', '')
autocmd! Filetype vim exec get(g:my_coding_styles, 's2', '')
autocmd! Filetype php exec get(g:my_coding_styles, 's4', '')

" using commandline-window.
autocmd! CmdwinEnter * call g:my_cmdwinenter_settings()
function! g:my_cmdwinenter_settings()
  nnoremap <buffer><Esc> :<C-u>quit<CR>
  startinsert!
endfunction

" guienter.
autocmd! GUIEnter * call g:my_guienter_settings()
function! g:my_guienter_settings()
  if s:is_win
    set transparency=180
  elseif s:is_mac
    set transparency=20
  endif
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

" auto close pair.
let g:pair = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'"}
inoremap <expr>(  g:my_pair_close('(')
inoremap <expr>[  g:my_pair_close('[')
inoremap <expr>{  g:my_pair_close('{')
inoremap <expr>"  g:my_pair_close('"')
inoremap <expr>'  g:my_pair_close("'")
function! g:my_pair_close(char)
  if exists("g:pair[a:char]")
    let ignore_right_patterns = ['\w', '\$', ',']
    for pattern in ignore_right_patterns
      if getline('.')[col('.') - 1] =~ pattern
        return a:char
      endif
    endfor
    return a:char. g:pair[a:char]. "\<Left>"
  endif
  return a:char
endfunction

" skip all pair.
function! g:my_pair_all_skip()
  let ret = ""
  while count(g:pair, getline('.')[col('.') + cnt]) > 0
    let ret .= "\<Right>"
  endwhile
  return ret != "" ? ret : "\<Tab>"
endfunction

" skip pair.
function! g:my_pair_skip()
  if count(g:pair, getline('.')[col('.') - 1]) > 0
    return "\<Right>"
  endif
  return "\<Tab>"
endfunction

" enter pair.
function! g:my_pair_enter()
  if g:my_pair_is_between()
    return "\<Cr>\<Up>\<End>\<Cr>\<Tab>"
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

" ---------------------------------------------------------
" Plugin Settings.
" ---------------------------------------------------------
" Netrw
let g:netrw_cursorline=0

" VimFiler
let g:my_vimfiler_explorer_name='explorer'
let g:my_vimfiler_winwidth=40
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorer=1
let g:vimfiler_directory_display_top=1
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_tree_opened_icon='▾'
let g:vimfiler_tree_closed_icon='▸'
autocmd FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Enter> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nmap     <buffer><Tab>         <Plug>(vimfiler_choose_action)
  nmap     <buffer>j             j<Plug>(vimfiler_print_filename)
  nmap     <buffer>k             k<Plug>(vimfiler_print_filename)
  nmap     <buffer>@             <Plug>(vimfiler_toggle_mark_current_line)
  nnoremap <buffer>b             :Unite -buffer-name=bookmark-vimfiler_hisotry -default-action=cd -no-start-insert bookmark vimfiler/history<Cr>
  nnoremap <buffer>v             :call vimfiler#mappings#do_action('vsplit')<Cr>
  nnoremap <buffer>s             :call vimfiler#mappings#do_action('split')<Cr>
  nnoremap <buffer><F10>         :call vimfiler#mappings#do_current_dir_action('rec/async')<Cr>
  nnoremap <buffer><F5>          :call vimfiler#mappings#do_current_dir_action('cd')<Cr>
  nnoremap <buffer><F8>          :VimFilerTab -double<Cr>

  let vimfiler = b:vimfiler
  if vimfiler.context.profile_name == g:my_vimfiler_explorer_name
    set winfixwidth
  endif
endfunction
function! g:my_vimfiler_hook_action()
  let vimfiler = b:vimfiler
  if vimfiler.context.profile_name == g:my_vimfiler_explorer_name
    let winnr = 0
    while winnr <= winnr('$')
      if getwinvar(winnr, '&filetype') != 'vimfiler'
        exec winnr. 'wincmd w'
        return
      endif
      let winnr += 1
    endwhile

    botright vnew
    wincmd p | wincmd p
  endif
endfunction

" Unite
let g:unite_enable_start_insert=0
let g:unite_split_rule="botright"
autocmd FileType unite call g:my_unite_settings()
function! g:my_unite_settings()
  nmap <buffer><Esc>     :q<Cr>
  nmap <buffer>@         <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer>a         <Plug>(unite_insert_enter)
endfunction

" Neocomplcache
let g:neocomplcache_dictionary_filetype_lists = {}
let g:neocomplcache_dictionary_filetype_lists['default'] = ''
let g:neocomplcache_dictionary_filetype_lists['vimshell'] = $HOME. '/.vimshell/command-history'
let g:neocomplcache_enable_at_startup=1
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default']='\h\w*'
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" VimShell
let g:vimshell_split_command="sp"
let g:vimshell_split_height=30
let g:vimshell_prompt='$ '
let g:vimshell_right_prompt='"[". fnamemodify(getcwd(), ":~"). "]"'
let g:vimshell_disable_escape_highlight=1
let g:vimshell_interactive_update_time=100
autocmd FileType vimshell call g:my_vimshell_settings()
function! g:my_vimshell_settings()
  nnoremap <buffer>a     G$a
  inoremap <buffer><C-l> <Esc>:Unite -default-action=insert -no-start-insert vimshell/history vimshell/external_history<Cr>

  call vimshell#altercmd#define('ll', 'ls -al')
  call vimshell#altercmd#define('l', 'll')
  call vimshell#hook#add('chpwd', 'my_vimshell_hook_chpwd', 'g:my_vimshell_hook_chpwd')

  set nowrap
endfunction
function! g:my_vimshell_hook_chpwd(args, context)
  call vimshell#execute('ls -al')
endfunction

" PrettyPrint
let g:prettyprint_indent=2
let g:prettyprint_width=78

" ZenCoding
let g:user_zen_leader_key="<C-k>"
let g:user_zen_expandabbr_key="<C-k><Space>"
let g:user_zen_complete_tag=1
let g:user_zen_settings = {}
let g:user_zen_settings['html'] = { 'indentation': '    ' }
let g:user_zen_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
let g:user_zen_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }

" Align
let g:Align_xstrlen=3

