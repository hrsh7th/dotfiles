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

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/unite-ssh.git'
NeoBundle 'git://github.com/thinca/vim-openbuf.git'
NeoBundle 'git://github.com/thinca/vim-fontzoom.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
NeoBundle 'git://github.com/thinca/vim-localrc.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
NeoBundle 'git://github.com/t9md/vim-quickhl.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/ujihisa/shadow.vim.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'

" set terminal color.
set t_Co=256

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
set undodir=~/.vimundo
set undofile

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
filetype plugin off

" use filetype indent.
filetype indent off

" ---------------------------------------------------------
" Edit Settings.
" ---------------------------------------------------------
" autoindent.
set autoindent

" copy indnet.
set copyindent

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

" setting statusline.
set statusline=%!g:my_statusline()
function! g:my_statusline()
  let statusline  = ' %f '
  let statusline .= "%{'['. (&fenc != '' ? &fenc : &enc). ']['. &ff. ']'}"
  if &paste
    let statusline .= '[p]'
  endif
  let statusline .= '%m%r%h%w'
  let statusline .= '%='
  let statusline .= '%l, %c, %P'
  return statusline
endfunction

" no wrap.
set nowrap

" show special chars.
set list
set listchars=trail:^

" show ruler.
set ruler

" show commands in statusline.
set showcmd

" not show messages.
set shortmess+=I

" show numbers.
set number
" set relativenumber

" solarized.
let g:solarized_termcolors=256
" let g:solarized_termtrans=1

" cui colorscheme.
set background=dark | colorscheme solarized

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
  set background=dark | colorscheme solarized

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
nnoremap <Leader>! :q!<Cr>

" save window.
nnoremap <Leader>w :w<Cr>

" move window.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" move tab.
nnoremap <Leader>tc    :tabclose<Cr>
nnoremap <Leader><S-l> :tabnext<Cr>
nnoremap <Leader><S-h> :tabprev<Cr>

" nohlsearch.
nmap <Leader><Esc> :nohlsearch<Cr><Plug>(quickhl-reset)

" move visual line.
nnoremap j gj
nnoremap k gk

" big scroll.
nnoremap <S-l> 15l15zl
nnoremap <S-h> 15h15zh
nnoremap <S-k> 15k15<C-y>
nnoremap <S-j> 15j15<C-e>
vnoremap <S-l> 15l
vnoremap <S-h> 15h
vnoremap <S-k> 15k
vnoremap <S-j> 15j

" move insert-mode.
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

" using commandline-window.
" nnoremap : q:
" xnoremap : q:

" enter pair.
inoremap <expr><Cr> g:my_pair_enter()

" delete pair.
inoremap <expr><Bs> g:my_pair_delete()

" VimFiler
nnoremap <expr><F2> ":VimFilerBufferDir -buffer-name=". g:my_vimfiler_explorer_name. " -split -winwidth=". g:my_vimfiler_winwidth. " -toggle<Cr>"

" VimShell
nnoremap <F5>  :VimShell<Cr>

" Unite
nnoremap <F3>  :Unite -buffer-name=buffer_tab-file_mru buffer_tab file_mru<Cr>
nnoremap m     :UniteResume<Cr>
nnoremap <F8>  :Unite -buffer-name=outline -no-quit -vertical -winwidth=45 outline<Cr>
nnoremap ?     :Unite -buffer-name=line -start-insert line<Cr>
nnoremap <F12> :Unite -buffer-name=process process<Cr>

" Neocomplcache
imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : g:my_pair_skip()

" textmanip
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-l> <Plug>(textmanip-move-right)
vmap <C-h> <Plug>(textmanip-move-left)

" QuickRun
nnoremap <Leader>r :QuickRun<Cr>

" Quickhl
nmap <Leader>m <Plug>(quickhl-toggle)
vmap <Leader>m <Plug>(quickhl-toggle)

" ---------------------------------------------------------
" Command Settings.
" ---------------------------------------------------------
" switch CodingStyle.
let g:my_coding_style = {}
let g:my_coding_style['s4'] = 'setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4'
let g:my_coding_style['s2'] = 'setlocal expandtab   tabstop=2 shiftwidth=2 softtabstop=2'
let g:my_coding_style['t4'] = 'setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4'
let g:my_coding_style['t2'] = 'setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2'
let g:my_coding_style['d']  = g:my_coding_style['s4']
command! -bar -nargs=1 CodingStyle exec get(g:my_coding_style, <f-args>, '')

" difforig
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" ---------------------------------------------------------
" Other Settings.
" ---------------------------------------------------------
" for extension.
autocmd! BufRead,BufNewFile *.ejs set filetype=html

" for filetype.
autocmd! Filetype js set filetype=javascript
autocmd! Filetype javascript exec get(g:my_coding_style, 's2', '')
autocmd! Filetype coffee exec get(g:my_coding_style, 's2', '')
autocmd! Filetype vim exec get(g:my_coding_style, 's2', '')
autocmd! Filetype php exec get(g:my_coding_style, 's4', '')
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

" auto close pair.
let g:pair = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '<' : '>', '>' : '<'}
inoremap <expr>(  g:my_pair_close('(')
inoremap <expr>[  g:my_pair_close('[')
inoremap <expr>{  g:my_pair_close('{')
inoremap <expr>"  g:my_pair_close('"')
inoremap <expr>'  g:my_pair_close("'")
function! g:my_pair_close(char)
  if exists("g:pair[a:char]")
    let ignore_right_patterns = ['\w']
    for pattern in ignore_right_patterns
      if getline('.')[col('.') - 1] =~ pattern
        return a:char
      endif
    endfor
    return a:char. g:pair[a:char]. "\<Left>"
  endif
  return a:char
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
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0

" echodoc
let g:echodoc_enable_at_startup=1

" VimFiler
let g:my_vimfiler_explorer_name='explorer'
let g:my_vimfiler_winwidth=35
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_edit_action='nicely_open'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_directory_display_top=1
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_tree_opened_icon='▾'
let g:vimfiler_tree_closed_icon='▸'
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nmap     <buffer><Tab>      <Plug>(vimfiler_choose_action)
  nmap     <buffer>0          <Plug>(vimfiler_toggle_maximize_window)
  nmap     <buffer>@          <Plug>(vimfiler_toggle_mark_current_line)
  nmap     <buffer>j          j<Plug>(vimfiler_print_filename)
  nmap     <buffer>k          k<Plug>(vimfiler_print_filename)
  nnoremap <buffer>b          :Unite -buffer-name=bookmark-vimfiler_history -default-action=cd -no-start-insert bookmark vimfiler/history<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('nicely_vsplit')<Cr>
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('nicely_split')<Cr>
  nnoremap <buffer>gr         :call vimfiler#mappings#do_current_dir_action('nicely_grep')<Cr>
  nnoremap <buffer><F10>      :call vimfiler#mappings#do_current_dir_action('rec/async')<Cr>
  nnoremap <buffer><F8>       :VimFilerTab -double<Cr>

  if b:vimfiler.context.profile_name == g:my_vimfiler_explorer_name
    set winfixwidth
  endif
endfunction
augroup my-vimfiler
  autocmd!
  autocmd WinEnter * call g:my_vimfiler_winenter_settings()
augroup END
function! g:my_vimfiler_winenter_settings()
  if exists('b:vimfiler')
    let b:vimfiler.prev_winnr = winnr('#')
  endif
endfunction

" Unite
let g:unite_enable_start_insert=0
let g:unite_split_rule="botright"
let g:unite_kind_openable_lcd_command='cd'
autocmd! FileType unite call g:my_unite_settings()
function! g:my_unite_settings()
  nmap <buffer><Esc>       <Plug>(unite_exit)
  nmap <buffer>@           <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer>a           <Plug>(unite_insert_enter)
  nmap <buffer><C-p>       <Plug>(unite_loop_cursor_up)
  nmap <buffer><C-n>       <Plug>(unite_loop_cursor_down)
  imap <buffer><C-p>       <Plug>(unite_insert_leave)<Plug>(unite_loop_cursor_up)
  imap <buffer><C-n>       <Plug>(unite_insert_leave)<Plug>(unite_loop_cursor_down)
  nnoremap <buffer><expr>s unite#do_action('split')
  nnoremap <buffer><expr>v unite#do_action('vsplit')
endfunction
augroup my-unite
  autocmd!
  autocmd WinEnter * call g:my_unite_winenter_settings()
augroup END
function! g:my_unite_winenter_settings()
  if exists('b:unite')
    let b:unite.prev_winnr = winnr('#')
  endif
endfunction

" custom action.
let my_action = { 'is_selectable': 1 }
function! my_action.func(candidates)
  exec g:get_prev_winnr(). 'wincmd w' | call unite#take_action('grep', a:candidates)
endfunction
call unite#custom_action('file', 'nicely_grep', my_action)

let my_action = { 'is_selectable': 1 }
function! my_action.func(candidates)
  let winnr = winnr()
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'edit '. a:candidates[0].action__path
  exec winnr. 'wincmd w'
endfunction
call unite#custom_action('file', 'nicely_open', my_action)

let my_action = { 'is_selectable': 1 }
function! my_action.func(candidates)
  let winnr = winnr()
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'split '. a:candidates[0].action__path
  exec winnr. 'wincmd w'
endfunction
call unite#custom_action('file', 'nicely_split', my_action)

let my_action = { 'is_selectable': 1 }
function! my_action.func(candidates)
  let winnr = winnr()
  exec g:get_prev_winnr(). 'wincmd w'
  exec 'vsplit '. a:candidates[0].action__path
  exec winnr. 'wincmd w'
endfunction
call unite#custom_action('file', 'nicely_vsplit', my_action)

function! g:get_prev_winnr()
  if exists('b:vimfiler.prev_winnr')
    return b:vimfiler.prev_winnr
  endif
  if exists('b:unite.prev_winnr')
    return b:unite.prev_winnr
  endif
  return winnr('#')
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

" VimShell
let g:vimshell_popup_height=40
let g:vimshell_popup_command='topleft sp | call g:my_vimshell_popup()'
let g:vimshell_prompt='$ '
let g:vimshell_right_prompt='"[". fnamemodify(getcwd(), ":~"). "]"'
let g:vimshell_disable_escape_highlight=1
autocmd! FileType vimshell call g:my_vimshell_settings()
function! g:my_vimshell_settings()
  nnoremap <buffer>a           G$a
  inoremap <buffer><Tab>       <Nop>
  imap     <buffer><expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : g:my_pair_skip()
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
function! g:my_vimshell_hook_chpwd(args, context)
  call vimshell#execute('ls -al')
endfunction
autocmd! Filetype int-* call g:my_vimshell_interactive_settings()
function! g:my_vimshell_interactive_settings()
  inoremap <buffer><Tab>       <Nop>
  imap     <buffer><expr><Tab> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : g:my_pair_skip()
endfunction
function! g:my_vimshell_popup()
 exec 'resize '. winheight(0) * g:vimshell_popup_height / 100
endfunction

" PrettyPrint
let g:prettyprint_indent=2
let g:prettyprint_width=78

" ZenCoding
let g:user_zen_leader_key="<C-k>"
let g:user_zen_expandabbr_key="<C-k><Space>"
let g:user_zen_complete_tag=1
let g:user_zen_settings = {}
let g:user_zen_settings['html'] = { 'lang': 'ja', 'indentation': '    ' }
let g:user_zen_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
let g:user_zen_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }

" easymotion
let g:EasyMotion_do_mapping=1
let g:EasyMotion_leader_key=""
let g:EasyMotion_mapping_f='f'
let g:EasyMotion_mapping_F='F'
let g:EasyMotion_mapping_t=''
let g:EasyMotion_mapping_T=''
let g:EasyMotion_mapping_w=''
let g:EasyMotion_mapping_W=''
let g:EasyMotion_mapping_b=''
let g:EasyMotion_mapping_B=''
let g:EasyMotion_mapping_e=''
let g:EasyMotion_mapping_E=''
let g:EasyMotion_mapping_j=''
let g:EasyMotion_mapping_k=''
let g:EasyMotion_mapping_n=''
let g:EasyMotion_mapping_N=''
let g:EasyMotion_mapping_ge=''
let g:EasyMotion_mapping_gE=''

" shadow
let g:shadow_debug=1

