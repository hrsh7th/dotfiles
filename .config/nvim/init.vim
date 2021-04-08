" vint: -ProhibitSetNoCompatible

if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  set nocompatible
endif

let g:python3_host_prog = 'python3'

let $MYVIMRC = resolve($MYVIMRC)

let s:config = {
\   'lsp': 'lamp',
\   'lexima': v:true,
\   'complete': 'compe',
\   'snippet': 'vsnip',
\ }

let s:dein = {}
let s:dein.dir = {}
let s:dein.dir.install = expand('~/.config/dein/repos/github.com/Shougo/dein.vim')
let s:dein.dir.plugins = expand('~/.config/dein')

if !isdirectory(s:dein.dir.install)
  call system(printf('git clone https://github.com/Shougo/dein.vim %s', shellescape(s:dein.dir.install)))
endif

let &runtimepath = &runtimepath . ',' . s:dein.dir.install . ',' . expand('~/.config/nvim')
let &runtimepath = &runtimepath . ',' . fnamemodify($MYVIMRC, ':p:h')

if filereadable(expand('~/.dein.github_access_token'))
  let g:dein#install_github_api_token = readfile(expand('~/.dein.github_access_token'))
  let g:dein#install_github_api_token = type(g:dein#install_github_api_token) == type([]) ? join(g:dein#install_github_api_token, '') : g:dein#install_github_api_token
endif

call vimrc#ignore_runtime()

if dein#load_state(s:dein.dir.install)
  call dein#begin(s:dein.dir.plugins)

  call dein#add('Shougo/dein.vim', { 'merged': 0 })
  call dein#add('Shougo/denite.nvim', { 'merged': 0 })
  call dein#add('Shougo/deol.nvim', { 'merged': 0 })
  call dein#add('andymass/vim-matchup', { 'merged': 0 })
  call dein#add('delphinus/vim-auto-cursorline', { 'merged': 0 })
  call dein#add('haya14busa/vim-asterisk', { 'merged': 0 })
  call dein#add('hrsh7th/fern-mapping-call-function.vim', { 'merged': 0 })
  call dein#add('hrsh7th/fern-mapping-collapse-or-leave.vim', { 'merged': 0 })
  call dein#add('hrsh7th/nvim-compe', { 'merged': 0 })
  call dein#add('hrsh7th/vim-candle', { 'merged': 0 })
  call dein#add('hrsh7th/vim-denite-gitto', { 'merged': 0 })
  call dein#add('hrsh7th/vim-effort-gf', { 'merged': 0 })
  call dein#add('hrsh7th/vim-eft', { 'merged': 0 })
  call dein#add('hrsh7th/vim-gitto', { 'merged': 0 })
  call dein#add('hrsh7th/vim-lamp', { 'merged': 0 })
  call dein#add('hrsh7th/vim-locon', { 'merged': 0 })
  call dein#add('hrsh7th/vim-vital-vs', { 'merged': 0 })
  call dein#add('itchyny/lightline.vim', { 'merged': 0 })
  call dein#add('junegunn/vim-easy-align', { 'merged': 0 })
  call dein#add('lambdalisue/fern-renderer-nerdfont.vim', { 'merged': 0 })
  call dein#add('lambdalisue/fern.vim', { 'merged': 0 })
  call dein#add('lambdalisue/gina.vim', { 'merged': 0 })
  call dein#add('lambdalisue/glyph-palette.vim', { 'merged': 0 })
  call dein#add('lambdalisue/nerdfont.vim', { 'merged': 0 })
  call dein#add('lambdalisue/suda.vim', { 'merged': 0 })
  call dein#add('lambdalisue/vim-findent', { 'merged': 0 })
  call dein#add('machakann/vim-sandwich', { 'merged': 0 })
  call dein#add('machakann/vim-swap', { 'merged': 0 })
  call dein#add('t9md/vim-choosewin', { 'merged': 0 })
  call dein#add('thinca/vim-qfreplace', { 'merged': 0 })
  call dein#add('thinca/vim-quickrun', { 'merged': 0 })
  call dein#add('thinca/vim-themis', { 'merged': 0 })
  call dein#add('tweekmonster/helpful.vim', { 'merged': 0 })
  call dein#add('tyru/open-browser.vim', { 'merged': 0 })
  call dein#add('vim-jp/vital.vim', { 'merged': 0 })

  " colorscheme
  call dein#add('bluz71/vim-nightfly-guicolors', { 'merged': 0 })
  call dein#add('gruvbox-community/gruvbox', { 'merged': 0 })
  call dein#add('rakr/vim-one', { 'merged': 0 })
  call dein#add('glepnir/zephyr-nvim', { 'merged': 0 })
  call dein#add('hrsh7th/palenight.vim', { 'merged': 0 })
  let g:colorscheme = { 'name': 'palenight', 'lightline': 'palenight' }

  " textobj/operator
  call dein#add('kana/vim-textobj-user', { 'merged': 0 })
  call dein#add('kana/vim-operator-user', { 'merged': 0 })
  call dein#add('kana/vim-operator-replace', { 'merged': 0 })

  if s:config.snippet ==# 'vsnip'
    call dein#add('hrsh7th/vim-vsnip', { 'merged': 0 })
    call dein#add('hrsh7th/vim-vsnip-integ', { 'merged': 0 })
  endif

  if s:config.snippet ==# 'snippets_nvim'
    call dein#add('norcalli/snippets.nvim', { 'merged': 0 })
  endif

  if s:config.snippet ==# 'ultisnips'
    call dein#add('SirVer/ultisnips', { 'merged': 0 })
  endif

  if s:config.lsp ==# 'coc'
    let g:coc_force_debug = 1
    let g:node_client_debug = v:true
    let $NVIM_COC_LOG_LEVEL = 'debug'

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
  endif

  if s:config.lsp ==# 'lsp'
    call dein#add('mattn/vim-lsp-settings', { 'merged': 0 })
    call dein#add('prabirshrestha/vim-lsp', { 'merged': 0 })
  endif

  if s:config.lsp ==# 'lcn'
    call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh', 'merged': 0 })
  endif

  if s:config.lsp ==# 'lsc'
    call dein#add('natebosch/vim-lsc', { 'merged': 0 })
  endif

  if s:config.lsp ==# 'nvim'
    call dein#add('nvim-lua/completion-nvim', { 'merged': 0 })
    call dein#add('neovim/nvim-lspconfig', { 'merged': 0 })
  endif

  if s:config.lexima
    call dein#add('cohama/lexima.vim', { 'merged': 0 })
  endif

  if has('nvim')
    call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
    call dein#add('onsails/lspkind-nvim', { 'merged': 0 })
    call dein#add('notomo/vusted', { 'merged': 0 })
    call dein#add('norcalli/nvim-colorizer.lua')
  endif

  call dein#local('~/.go/src/github.com/hrsh7th/')
  call dein#local('~/Develop/VimPlugins')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

augroup vimrc
  autocmd!
augroup END

nnoremap <silent> A :<C-u>lua
\ require'lank':run({
\   source = require'lank.source.file'.new({
\     path = vim.fn.expand('~');
\     ignore_patterns = {
\       '.vim/',
\       '.npm/',
\       '.nvm/',
\       '.git/',
\       '.svn/',
\       '.clangd/',
\       '.rustup/',
\       'logs/',
\       'Logs/',
\       'log/',
\       'Log/',
\       '.vimundo/',
\       'caches/',
\       'Caches/',
\       'cache/',
\       'Cache/',
\       'vendor/',
\       'node_modules/',
\       '.cache/',
\       '.cargo/',
\       '.sass-cache/',
\     };
\   });
\   layout = require'lank.layout.modal'({})
\ })<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
let $TERM = 'xterm-256color'
set t_Co=256
set t_ut=
set updatetime=200
set autoread
set hidden
set nobackup
set noswapfile
set lazyredraw
set scrolloff=3
set sidescrolloff=3
set belloff=all
set synmaxcol=512
set undodir=~/.vimundo
set undofile
set isfname-==
set isfname+=\\
set diffopt=filler,algorithm:histogram,indent-heuristic

set mouse=n
set termguicolors
set splitright
set splitbelow
set nowrap
set cursorline
set nonumber
set modeline
set modelines=2
set wildmenu
set wildmode=longest:full
set wildchar=<Tab>
set pumheight=15
set showtabline=2
set cmdheight=2
set laststatus=2
set list
set noshowmode
set ambiwidth=single
set title
set shortmess+=I
set shortmess+=c
set listchars=tab:>-,trail:^
set background=dark
set virtualedit=all
" set debug=msg

set incsearch
set hlsearch
set ignorecase
set smartcase
set suffixesadd=.php,.tpl,.ts,.tsx,.css,.scss,.rb,.java,.json,.md,.as,.js,.jpg,.jpeg,.gif,.png,.vim
set matchpairs=(:),[:],{:}

set autoindent
set cindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set completeopt=menu,menuone,noselect
set nostartofline
set signcolumn=yes
set formatoptions=croq

let g:vim_indent_cont = 0

if has('nvim')
  set wildoptions=pum
  set scrollback=2000
  set clipboard=unnamedplus
  set fillchars+=vert:\│,eob:\ 
  set inccommand=split
else
  set clipboard=unnamed
  set fillchars+=vert:\│
endif

command! -nargs=* Profile call s:command_profile('<args>')
function! s:command_profile(section) abort
  profile start ~/profile.txt
  profile func *
  execute printf('profile file %s', empty(a:section) ? '*' : a:section)
endfunction

command! DeleteFile call s:command_delete_file()
function! s:command_delete_file() abort
  let l:bufname = expand('%:p')
  if filereadable(l:bufname)
    call delete(l:bufname)
    e!
  endif
endfunction

let mapleader="\<Space>"
nnoremap q :<C-u>q<CR>
nnoremap Q :<C-u>qa!<CR>
nnoremap <Leader>t :<C-u>tabclose<CR>
nnoremap <Leader>w :<C-u>w<CR>
nnoremap * *N
nnoremap <expr> <Leader>: input('key: ')
nmap ; :
vmap ; :
xmap ; :
nnoremap = ^
vnoremap = ^
nnoremap + =
vnoremap + =
nnoremap @ q
nnoremap j gj
nnoremap k gk
nnoremap < <<<Esc>
nnoremap > >><Esc>
vnoremap < <<<Esc>
vnoremap > >><Esc>
nnoremap <expr><Leader><Esc> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
\   'nohlsearch',
\   dein#tap('vim-lamp') ? 'call lamp#feature#document_highlight#clear()' : 'nohlsearch',
\   'redraw!'
\ )

nnoremap H 20h
nnoremap J 10j
nnoremap K 10k
nnoremap L 20l
nnoremap zk 5H
nnoremap zj 5L
xnoremap H 20h
xnoremap J 10j
xnoremap K 10k
xnoremap L 20l
xnoremap zk 5H
xnoremap zj 5L

nnoremap <CR> :<C-u>echomsg expand('%:~')<CR>

if dein#tap('vim-eft')
  let g:eft_index_function = get(g:, 'eft_index_function', {
  \   'head': function('eft#index#head'),
  \   'tail': function('eft#index#tail'),
  \   'space': function('eft#index#space'),
  \   'symbol': function('eft#index#symbol'),
  \ })

  nmap f <Plug>(eft-f)
  xmap f <Plug>(eft-f)
  omap f <Plug>(eft-f)
  nmap t <Plug>(eft-t)
  xmap t <Plug>(eft-t)
  omap t <Plug>(eft-t)
  nmap F <Plug>(eft-F)
  xmap F <Plug>(eft-F)
  omap F <Plug>(eft-F)
  nmap T <Plug>(eft-T)
  xmap T <Plug>(eft-T)
  omap T <Plug>(eft-T)
endif

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>L :<C-u>tabnext<CR>
nnoremap <Leader>H :<C-u>tabprev<CR>

nnoremap G Gzz

nnoremap o A<CR>

noremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

inoremap <C-l> <Right>
inoremap <C-h> <Left>

inoremap <F8> <Nop>
nnoremap <F8> <Nop>
inoremap <F9> <Nop>
nnoremap <F9> <Nop>
inoremap <F10> <Nop>
nnoremap <F10> <Nop>

nmap <Tab> %
xmap <Tab> %

nnoremap <Leader>*  *:<C-u>%s/<C-r>///g<C-f><Left><Left>
xnoremap <Leader>*  y:<C-u>%s/<C-r>"//g<C-f><Left><Left>
xnoremap <expr><CR> printf(':s/%s//g<C-f><Left><Left>', expand('<cword>'))

nnoremap gj J

nnoremap <F5> :<C-u>call vimrc#detect_cwd()<CR>

if dein#tap('vim-easy-align')
  xnoremap _ :EasyAlign<CR>
endif

if dein#tap('nvim-treesitter')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = false,
  },
  indent = {
    enable = false,
  }
}
EOF
endif

if dein#tap('vim-auto-cursorline')
  let g:auto_cursorline_wait_ms = 800
endif

if dein#tap('vim-operator-user')
  if dein#tap('vim-operator-replace')
    nmap r <Plug>(operator-replace)
    xmap r <Plug>(operator-replace)
  endif
endif

if dein#tap('vim-swap')
  omap i, <Plug>(swap-textobject-i)
  xmap i, <Plug>(swap-textobject-i)
  omap a, <Plug>(swap-textobject-a)
  xmap a, <Plug>(swap-textobject-a)
endif

if dein#tap('denops')
  let g:denops#script#deno = 'deno'
  let g:denops#script#typecheck = 1
endif

if dein#tap('vim-asterisk')
  let g:asterisk#keeppos = 1
  map * <Plug>(asterisk-gz*)
endif

if dein#tap('vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
  nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>
endif

if dein#tap('vim-effort-gf')
  nnoremap gf<CR> :<C-u>EffortGF<CR>
  nnoremap gfv    :<C-u>vertical EffortGF<CR>
  nnoremap gfs    :<C-u>belowright EffortGF<CR>
endif


if dein#tap('open-browser.vim')
  nmap <Leader><Leader><CR> <Plug>(openbrowser-smart-search)
endif

if dein#tap('vim-candle')
  " project files
  nnoremap <silent><F3> :<C-u>call candle#start({
  \   'file': {
  \     'root_path': vimrc#get_cwd(),
  \     'ignore_patterns': locon#get('ignore_globs'),
  \   }
  \ })<CR>

  " mru files
  nnoremap <silent><BS> :<C-u>call candle#start({
  \   'mru_file': {
  \     'ignore_patterns': map(
  \       range(1, tabpagewinnr(tabpagenr(), '$')),
  \       { i, winnr -> fnamemodify(bufname(winbufnr(winnr)), ':p') }
  \     ) + ['COMMIT_EDITMSG']
  \   },
  \ })<CR>

  " grep
  nnoremap <silent>gr :<C-u>call candle#start({
  \   'grep': {
  \     'root_path': vimrc#get_cwd(),
  \     'pattern': input('PATTERN: '),
  \     'command': [
  \       'rg',
  \       '-i',
  \       '--vimgrep',
  \       '--no-heading',
  \       '--no-column',
  \     ] + map(copy(locon#get('ignore_globs')), { _, v -> printf('--glob=!%s', v) }) + [
  \       '-e',
  \       '%PATTERN%',
  \       '%ROOT_PATH%',
  \     ]
  \   }
  \ })<CR>

  " menu
  nnoremap <silent><Leader>0 :<C-u>call candle#start({
  \   'item': [{
  \     'id': 1,
  \     'title': 'dein#check_update',
  \     'command': 'call dein#check_update(v:true)'
  \   }],
  \ }, {
  \   'action': {
  \     'default': { candle -> [
  \       execute('quit'),
  \       win_gotoid(candle.prev_winid),
  \       execute(candle.get_action_items()[0].command)
  \     ] }
  \   },
  \ })<CR>

  autocmd! vimrc User candle#initialize call s:on_candle_initialize()
  function! s:on_candle_initialize() abort
    "
    " edit/split/vsplit
    "
    function! s:open_invoke(command, candle) abort
      let l:curr_winid = win_getid()
      call a:candle.close()
      let l:next_winid = l:curr_winid == a:candle.winid ? a:candle.prev_winid : l:curr_winid

      let l:item = a:candle.get_action_items()[0]
      call vimrc#open(a:command, l:item, win_id2win(l:next_winid))
    endfunction
    call candle#action#register({
    \   'name': 'edit',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['edit']),
    \ })
    call candle#action#register({
    \   'name': 'split',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['split']),
    \ })
    call candle#action#register({
    \   'name': 'vsplit',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['vsplit']),
    \ })
    "
    " qfreplace
    "
    function! s:qfreplace_invoke(candle) abort
      call setqflist(a:candle.get_action_items())
      Qfreplace split
      resize 12
      call a:candle.close()
    endfunction
    call candle#action#register({
    \   'name': 'qfreplace',
    \   'accept': function('candle#action#common#expect_keys_multiple', [['filename', 'lnum', 'text']]),
    \   'invoke': function('s:qfreplace_invoke'),
    \ })
  endfunction

  nnoremap <silent> <Leader>; :<C-u>call candle#mapping#toggle()<CR>
  nnoremap <silent> <Leader>n :<C-u>call candle#mapping#action_next('default')<CR>
  nnoremap <silent> <Leader>p :<C-u>call candle#mapping#action_prev('default')<CR>

  autocmd! vimrc User candle#start call s:on_candle_start()
  function! s:on_candle_start()
    nnoremap <silent><buffer> k     :<C-u>call candle#mapping#cursor_move(-1)<CR>
    nnoremap <silent><buffer> j     :<C-u>call candle#mapping#cursor_move(1)<CR>
    nnoremap <silent><buffer> K     :<C-u>call candle#mapping#cursor_move(-10)<CR>
    nnoremap <silent><buffer> J     :<C-u>call candle#mapping#cursor_move(10)<CR>
    nnoremap <silent><buffer> gg    :<C-u>call candle#mapping#cursor_top()<CR>
    nnoremap <silent><buffer> G     :<C-u>call candle#mapping#cursor_bottom()<CR>
    nnoremap <silent><buffer> i     :<C-u>call candle#mapping#input_open()<CR>
    nnoremap <silent><buffer> a     :<C-u>call candle#mapping#input_open()<CR>
    nnoremap <silent><buffer> @     :<C-u>call candle#mapping#toggle_select()<CR>
    nnoremap <silent><buffer> *     :<C-u>call candle#mapping#toggle_select_all()<CR>
    nnoremap <silent><buffer> <Tab> :<C-u>call candle#mapping#choose_action()<CR>
    nnoremap <silent><buffer> <C-l> :<C-u>call candle#mapping#restart()<CR>

    nnoremap <silent><buffer> <CR>  :<C-u>call candle#mapping#action('default')<CR>
    nnoremap <silent><buffer> s     :<C-u>call candle#mapping#action('split')<CR>
    nnoremap <silent><buffer> v     :<C-u>call candle#mapping#action('vsplit')<CR>
    nnoremap <silent><buffer> d     :<C-u>call candle#mapping#action('delete')<CR>
  endfunction

  autocmd! vimrc User candle#input#start call s:on_candle_input_start()
  function! s:on_candle_input_start()
    cnoremap <silent><buffer> <Tab>     <Esc>:<C-u>call candle#mapping#choose_action()<CR>
    cnoremap <silent><buffer> <C-y>     <Esc>:<C-u>call candle#mapping#action('default')<CR>
    cnoremap <silent><buffer> <C-Space> <Esc>:<C-u>call candle#mapping#action('default')<CR>
    cnoremap <silent><buffer> <C-p>     <Esc>:<C-u>call candle#mapping#cursor_move(-1) \| call candle#mapping#input_open()<CR>
    cnoremap <silent><buffer> <C-n>     <Esc>:<C-u>call candle#mapping#cursor_move(+1) \| call candle#mapping#input_open()<CR>
  endfunction
endif

if dein#tap('vim-matchup')
 let g:matchup_matchparen_deferred = 1
endif

if dein#tap('dein.vim')
  let g:dein#install_log_filename = '~/dein.log'
endif

if dein#tap('vim-themis')
  if has('vim_starting')
    let $PATH = $PATH . ':' . dein#get('vim-themis').rtp . '/bin'
    let $THEMIS_VIM = 'nvim'
  endif
endif

if dein#tap('vim-locon')
  call locon#def('ignore_globs', [
  \   'img/',
  \   'image/',
  \   'images/',
  \   'vendor/',
  \   'node_modules/',
  \   '.sass-cache',
  \   '.git/',
  \   '.svn/',
  \   '*.gif',
  \   '*.jpg',
  \   '*.jpeg',
  \   '*.png',
  \   '*.po',
  \   '*.mo',
  \   '*.swf',
  \   '*.min.*',
  \   '*.map'
  \ ])
  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

if dein#tap('vital.vim')
  let g:vitalizer#vital_dir = dein#get('vital.vim').rtp
endif

if dein#tap('lexima.vim')
  let g:lexima_accept_pum_with_enter = v:false
  let g:lexima_no_default_rules = v:true
  if s:config.lexima
    call lexima#set_default_rules()

    call lexima#add_rule({ 'char': '<', 'input_after': '>' })
    call lexima#add_rule({ 'char': '>', 'at': '<\%#>', 'leave': 1 })
    call lexima#add_rule({ 'char': '<BS>', 'at': '<\%#>', 'delete': 1 })
    call lexima#add_rule({ 'char': '<BS>', 'at': '< \%# >', 'delete': 1 })
    call lexima#add_rule({ 'char': '<Space>', 'at': '<\%#>', 'input_after': '<Space>' })
    call lexima#add_rule({ 'char': '<CR>', 'at': '>\%#<', 'input': '<CR><Up><End><CR>' })

    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*)',   'input': '<Left><C-o>f)<Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*\}',  'input': '<Left><C-o>f}<Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*\]',  'input': '<Left><C-o>f]<Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*>',   'input': '<Left><C-o>f><Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*`',   'input': '<Left><C-o>f`<Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*"',   'input': '<Left><C-o>f"<Right>' })
    call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*' . "'", 'input': '<Left><C-o>f' . "'" . '<Right>' })
  endif
endif

if dein#tap('ultisnips') && s:config.snippet ==# 'ultisnips'
   let g:UltiSnipsExpandTrigger       = '<Tab>'
   let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
   let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
endif

if dein#tap('vim-vsnip') && s:config.snippet ==# 'vsnip'
  let g:vsnip_namespace = 'snip_'
  let g:vsnip_snippet_dirs = [dein#get('vim-vsnip').rtp . '/misc']
  if dein#tap('lexima.vim') && s:config.lexima
    imap <expr><C-j> vsnip#expandable()    ? '<Plug>(vsnip-expand)'         : '<Nop>'
    smap <expr><C-j> vsnip#expandable()    ? '<Plug>(vsnip-expand)'         : '<Nop>'
    imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : lexima#expand('<LT>Tab>', 'i')
    smap <expr><Tab> vsnip#jumpable(1)     ? '<Plug>(vsnip-jump-next)'      : lexima#expand('<LT>Tab>', 'i')
    imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
    smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
  else
    imap <expr><C-l> vsnip#available(1)    ? '<Plug>(vsnip-expand)'         : '<C-l>'
    smap <expr><C-l> vsnip#available(1)    ? '<Plug>(vsnip-expand)'         : '<C-l>'
    imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
    smap <expr><Tab> vsnip#jumpable(1)     ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  endif

  " select.
  nmap s <Plug>(vsnip-select-text)
  xmap s <Plug>(vsnip-select-text)

  " cut
  nmap S <Plug>(vsnip-cut-text)
  xmap S <Plug>(vsnip-cut-text)
endif

if dein#tap('snippets.nvim')
  lua require'snippets'.use_suggested_mappings()
  inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
  inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>
endif

if dein#tap('nvim-compe')
  let g:compe = {}
  let g:compe.enabled = s:config.complete ==# 'compe'
  let g:compe.debug = v:true
  let g:compe.autocomplete = v:true
  let g:compe.preselect = 'always'
  let g:compe.documentation = v:true

  let g:compe.source = {}
  let g:compe.source.path = v:true
  let g:compe.source.calc = v:true
  let g:compe.source.buffer = v:true
  let g:compe.source.emoji = v:true

  let g:compe.source.tags = v:false
  let g:compe.source.spell = v:false
  let g:compe.source.omni = v:false
  let g:compe.source.treesitter = v:false
  let g:compe.source.nvim_lua = v:false

  let g:compe.source.nvim_lsp = s:config.lsp ==# 'nvim'
  let g:compe.source.vim_lsp = s:config.lsp ==# 'lsp'
  let g:compe.source.vim_lsc = s:config.lsp ==# 'lsc'
  let g:compe.source.lamp = s:config.lsp ==# 'lamp'
  let g:compe.source.vsnip = s:config.snippet ==# 'vsnip'
  let g:compe.source.ultisnips = s:config.snippet ==# 'ultisnips'
  let g:compe.source.snippets_nvim = s:config.snippet ==# 'snippets_nvim'

  if s:config.lexima
    inoremap <silent><expr><C-Space> compe#complete()
    inoremap <silent><expr><C-e>     compe#close('<C-e>')
    inoremap <silent><expr><CR>      compe#confirm({ 'keys': lexima#expand('<LT>CR>', 'i'), 'replace': v:true })
    inoremap <silent><expr><C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr><C-d>     compe#scroll({ 'delta': -4 })
  else
    inoremap <silent><expr><C-Space> compe#complete()
    inoremap <silent><expr><C-e>     compe#close('<C-e>')
    inoremap <silent><expr><CR>      compe#confirm('<CR>')
    inoremap <silent><expr><C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr><C-d>     compe#scroll({ 'delta': -4 })
  endif
  autocmd! vimrc WinEnter * if getwinvar('%', 'compe_documentation', 0) | set winminheight=NormalFloat:Float | endif
endif

if s:config.complete ==# 'completion-nvim'
  autocmd vimrc BufEnter * lua require'completion'.on_attach()
  let g:completion_enable_snippet = 'vim-vsnip'
  let g:completion_confirm_key = "\<CR>"
  let g:completion_matching_strategy_list = ['fuzzy']
endif

if dein#tap('vim-lsp') && s:config.lsp ==# 'lsp'
  let g:lsp_log_file = '/tmp/lsp.log'
  let g:lsp_fold_enabled = v:true
  let g:lsp_diagnostics_float_cursor = 1

  autocmd vimrc User lsp_setup call s:setup_vim_lsp()
  function s:setup_vim_lsp() abort
    call lsp#register_server({
    \   'name': 'intelephense',
    \   'cmd': { -> ['intelephense', '--stdio'] },
    \   'allowlist': ['php'],
    \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['.git', 'composer.json'])) },
    \ })
    call lsp#register_server({
    \   'name': 'ccls',
    \   'cmd': { -> [expand('~/Develop/Repos/ccls/Release/ccls')] },
    \   'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
    \   'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
    \   'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
    \ })
    " call lsp#register_server({
    " \   'name': 'clangd',
    " \   'cmd': { -> ['clangd', '--background-index', '--clang-tidy'] },
    " \   'allowlist': ['cpp', 'c'],
    " \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['compile_commands.json', '.git'])) },
    " \ })
    call lsp#register_server({
    \   'name': 'lua-language-server',
    \   'cmd': { server_info -> [
    \     expand('~/Develop/Repos/lua-language-server/bin/macOS/lua-language-server'),
    \     '-E',
    \     expand('~/Develop/Repos/lua-language-server/main.lua')
    \   ] },
    \   'allowlist': ['lua'],
    \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['.git'])) },
    \   'workspace_config': {
    \     'Lua': {
    \       'completion': {
    \         'callSnippet': 'Replace',
    \       },
    \       'diagnostics': {
    \         'enable': v:true,
    \         'globals': [
    \           'vim', 'describe', 'it', 'before_each', 'after_each'
    \         ],
    \       },
    \       'workspace': {
    \         'library': s:lua_library,
    \       },
    \     },
    \   }
    \ })   
    call lsp#register_server({
    \   'name': 'vscode-html-language-server',
    \   'cmd': { -> ['vscode-html-language-server', '--stdio'] },
    \   'allowlist': ['html'],
    \   'initialization_options': {
    \     'embeddedLanguages': {
    \       'css': v:true,
    \       'html': v:true,
    \       'javascript': v:true,
    \     }
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'vscode-css-language-server',
    \   'cmd': { -> ['vscode-css-language-server', '--stdio'] },
    \   'allowlist': ['css', 'scss'],
    \   'initialization_options': {
    \     'embeddedLanguages': {
    \       'css': v:true,
    \       'html': v:true,
    \       'javascript': v:true,
    \     }
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'vscode-json-language-server',
    \   'cmd': { -> ['vscode-json-language-server', '--stdio'] },
    \   'allowlist': ['json'],
    \   'initialization_options': {
    \     'embeddedLanguages': {
    \       'css': v:true,
    \       'html': v:true,
    \       'javascript': v:true,
    \     }
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'vim-language-server',
    \   'cmd': { -> ['vim-language-server', '--stdio'] },
    \   'allowlist': ['vim'],
    \   'initialization_options': {
    \    'iskeyword': &iskeyword . ',:',
    \    'vimruntime': $VIMRUNTIME,
    \    'runtimepath': &runtimepath,
    \    'diagnostic': {
    \      'enable': v:true,
    \    },
    \    'suggest': {
    \      'fromVimruntime': v:true,
    \      'fromRuntimepath': v:true,
    \    }
    \  }
    \ })
  endfunction

  autocmd! vimrc User lsp_buffer_enabled call s:lsp_buffer_enabled()
  function! s:lsp_buffer_enabled() abort
    setlocal signcolumn=yes
    setlocal omnifunc=lsp#omni#complete
"    setlocal foldmethod=expr
"    setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
"    setlocal foldtext=lsp#ui#vim#folding#foldtext()
    nnoremap <Leader><CR>          :<C-u>LspCodeAction<CR>
    vnoremap <Leader><CR>          :LspCodeAction<CR>
    nnoremap <buffer> gf<CR>       :<C-u>LspDefinition<CR>
    nnoremap <buffer> gfv          :<C-u>vsplit \| LspDefinition<CR>
    nnoremap <buffer> gfs          :<C-u>split \| LspDefinition<CR>
    nnoremap <buffer> <Leader>i    :<C-u>LspHover<CR>
    nnoremap <buffer> <Leader>r    :<C-u>LspRename<CR>
    nnoremap <buffer> <Leader>g    :<C-u>LspReferences<CR>

    nnoremap <buffer> <Leader>f    :<C-u>LspDocumentFormat<CR>
    vnoremap <buffer> <Leader>f    :LspDocumentFormatRange<CR>

    autocmd! vimrc BufWritePre *.go  call execute('LspDocumentFormatSync') | call execute('LspCodeActionSync source.organizeImports')
  endfunction
endif

if dein#tap('vim-lsc') && s:config.lsp ==# 'lsc'
  let g:lsc_server_commands = {
  \   'go': ['gopls'],
  \   'cpp': ['clangd', '--background-index', '--clang-tidy'],
  \   'typescript': ['typescript-language-server', '--stdio'],
  \   'php': {
  \     'command': expand('~/lsc_debug.sh'),
  \     'message_hooks': {
  \       'initialize': {
  \         'initializationOptions': {
  \           'stragePath': expand('~/.cache/aiueo')
  \         }
  \       }
  \     }
  \   },
  \   'vim': ['vim-language-server', '--stdio']
  \ }
endif

if dein#tap('vim-lamp') && s:config.lsp ==# 'lamp'
  autocmd! vimrc User lamp#initialized call s:on_lamp_initialized()
  function! s:on_lamp_initialized() abort
    let s:on_location = { locations -> candle#start({
    \   'item': map(locations, { i, location -> extend(location, { 'id': i, 'title': location.filename, 'filename': location.filename }) })
    \ }, {
    \   'action': {
    \     'default': 'edit'
    \   }
    \ }) }
    let s:on_fallback = { command, position -> [
    \   cursor(position.line + 1, position.character + 1),
    \   command ==# 'vsplit' ? execute('vertical EffortGF', '') : execute('EffortGF', '')
    \ ] }

    call lamp#config('global.debug', '/tmp/lamp.log')
    call lamp#config('view.location.on_location', s:on_location)
    call lamp#config('view.location.on_fallback', s:on_fallback)

    call lamp#feature#workspace#configure({
    \   'emmet': {},
    \   'html': {},
    \   'javascript': {},
    \   'typescript': {},
    \   'prettier': {},
    \   'stylusSupremacy': {},
    \   'Lua': {
    \     'runtime': {
    \       'version': 'LuaJIT'
    \     },
    \     'completion': {
    \       'callSnippet': 'Replace',
    \     },
    \     'diagnostics': {
    \       'enable': v:true,
    \       'disable': ['redefined-local'],
    \       'globals': [
    \         'vim', 'describe', 'it', 'before_each', 'after_each'
    \       ],
    \     },
    \     'workspace': {
    \       'library': s:lua_library,
    \     },
    \   },
    \   'template': {},
    \   'vetur': {
    \     'useWorkspaceDependencies': v:true,
    \     'completion': {
    \       'autoImport': v:true,
    \       'useScaffoldSnippets': v:true,
    \       'tagCasing': 'kebab',
    \     },
    \     'validation': {
    \       'template': v:false,
    \       'style': v:false,
    \       'script': v:false,
    \     },
    \     'format': {
    \       'enable': v:true,
    \       'options': {},
    \       'defaultFormatter': {
    \         'html': 'prettier',
    \         'css': 'prettier',
    \         'postcss': 'prettier',
    \         'scss': 'prettier',
    \         'less': 'prettier',
    \         'stylus': 'prettier',
    \         'js': 'prettier',
    \         'ts': 'prettier',
    \       },
    \       'defaultFormatterOptions': {
    \         'prettier': {},
    \         'prettyhtml': {},
    \         'js-beautify-html': {}
    \       },
    \       'styleInitialIndent': v:false,
    \       'scriptInitialIndent': v:false,
    \     },
    \     'dev': {
    \       'vlsPath': 'ABCDEFGHIJKLMNOPQRSTUVWX',
    \       'logLevel': 'info',
    \     },
    \     'experimental': {
    \       'templateInterpolationService': v:false
    \     }
    \   }
    \ })

    call lamp#builtin#gopls()
    call lamp#builtin#vim_language_server()
    call lamp#builtin#yaml_language_server()
    call lamp#builtin#intelephense()

    call lamp#register('eclipse.jdt.ls', {
    \   'command': [
    \     'java',
    \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    \     '-Dosgi.bundles.defaultStartLevel=4',
    \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
    \     '-Dlog.level=ALL',
    \     '-noverify',
    \     '-Dfile.encoding=UTF-8',
    \     '-jar',
    \     expand('~/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'),
    \     '-configuration',
    \     expand('~/eclipse.jdt.ls/config_mac'),
    \     '-data',
    \     expand('~/eclipse.jdt.ls/workspace')
    \   ],
    \   'filetypes': ['java'],
    \ })

    call lamp#register('vscode-html-language-server', {
    \   'command': ['vscode-html-language-server', '--stdio'],
    \   'filetypes': ['html'],
    \   'initialization_options': { -> {
    \     'embeddedLanguages': {
    \       'css': v:true,
    \       'html': v:true,
    \       'javascript': v:true,
    \     }
    \   } }
    \ })

    call lamp#register('purescript-language-server', {
    \   'command': ['purescript-language-server', '--stdio'],
    \   'filetypes': ['purescript'],
    \ })

    call lamp#register('python-language-server', {
    \   'command': ['pyls'],
    \   'filetypes': ['python'],
    \ })

    call lamp#register('bash-language-server', {
    \   'command': ['bash-language-server', 'start'],
    \   'filetypes': ['sh'],
    \ })

    call lamp#register('zls', {
    \   'command': ['zls'],
    \   'filetypes': ['zig'],
    \ })

    call lamp#register('vscode-css-language-server', {
    \   'command': ['vscode-css-language-server', '--stdio'],
    \   'filetypes': ['css', 'scss'],
    \ })

    call lamp#feature#workspace#configure({
    \   'json': {
    \     'schemas': json_decode(join(readfile(lamp#config('global.root') . '/misc/json/catalog.json'), "\n")).schemas,
    \     'format': {
    \       'enable': v:true
    \     }
    \   }
    \ })
    call lamp#register('vscode-json-language-server', {
    \   'command': ['vscode-json-language-server', '--stdio'],
    \   'filetypes': ['json'],
    \ })

    call lamp#builtin#typescript_language_server({
    \   'filetypes': ['typescript.dts'],
    \   'capabilities': {
    \     'documentFormattingProvider': v:null,
    \     'documentRangeFormattingProvider': v:null,
    \   }
    \ })

    " call lamp#register('deno-lsp', {
    " \   'command': [expand('~/Develop/Repos/deno/target/debug/deno'), 'lsp'],
    " \   'filetypes': ['typescript', 'typescriptreact', 'javascript', 'javascriptreact'],
    " \   'root_uri': { -> lamp#findup(['tsconfig.json', '.git']) },
    " \   'initialization_options': { -> {
    " \     'enable': v:true,
    " \     'code_lens': {
    " \       'implementations': v:true,
    " \       'references': v:true,
    " \       'references_all_functions': v:true,
    " \     },
    " \     'lint': v:true,
    " \     'unstable': v:true,
    " \   } }
    " \ })

    call lamp#register('clangd', {
    \   'command': ['clangd', '--background-index', '--clang-tidy'],
    \   'filetypes': ['cpp', 'c'],
    \   'root_uri': { -> lamp#findup(['compile_commands.json', '.git']) },
    \ })

    call lamp#register('svelte-language-server', {
    \   'command': ['svelteserver', '--stdio'],
    \   'filetypes': ['svelte'],
    \   'root_uri': { -> lamp#findup(['.git']) },
    \   'capabilitis': {
    \     'completionProvider': {
    \       'triggerCharacters': ['.', ',', ':']
    \     }
    \   }
    \ })

    call lamp#register('texlab', {
    \   'command': ['texlab'],
    \   'filetypes': ['tex'],
    \   'root_uri': { -> lamp#findup(['.git']) },
    \ })

    call lamp#register('cmake-language-server', {
    \   'command': ['cmake-language-server'],
    \   'filetypes': ['cmake'],
    \   'root_uri': { -> lamp#findup(['.git', 'compile_commands.json']) },
    \   'initialization_options': { -> {'buildDirectory': 'build'} },
    \ })

    call lamp#register('lua-language-server', {
    \   'command': [expand('~/Develop/Repos/lua-language-server/bin/macOS/lua-language-server'), '-E', expand('~/Develop/Repos/lua-language-server/main.lua')],
    \   'filetypes': ['lua'],
    \   'root_uri': { -> lamp#findup(['.git']) },
    \ })

    call lamp#register('rust-analyzer', {
    \   'command': ['rust-analyzer'],
    \   'filetypes': ['rust'],
    \   'root_uri': { bufnr -> lamp#findup(['Cargo.toml'], bufname(bufnr)) },
    \ })

    call lamp#register('vls', {
    \   'command': ['vls'],
    \   'filetypes': ['vue'],
    \   'initialization_options': { -> {
    \     'completion': {
    \       'autoImport': v:true,
    \       'useScaffoldSnippets': v:true,
    \       'tagCasing': v:true,
    \     },
    \     'template': {},
    \     'format': {
    \       'enable': v:true,
    \       'defaultFormatter': {
    \         'ts': 'prettier',
    \         'js': 'prettier',
    \         'css': 'prettier',
    \         'postcss': 'prettier',
    \         'stylus': 'prettier',
    \         'html': 'prettier',
    \         'less': 'prettier',
    \         'sass': 'prettier',
    \       },
    \       'defaultFormatterOptions': {
    \         'prettier': {},
    \       }
    \     }
    \   } },
    \   'root_uri': { bufnr -> lamp#findup(['.git'], bufname(bufnr)) }
    \ })

    call lamp#register('diagnostic-languageserver', {
    \   'command': ['diagnostic-languageserver', '--stdio'],
    \   'filetypes': [
    \     'typescript',
    \     'typescript.tsx',
    \     'typescriptreact',
    \     'javascript',
    \     'javascript.jsx',
    \     'javascriptreact',
    \     'vim',
    \     'vimspec',
    \   ],
    \   'initialization_options': { -> {
    \     'linters': {
    \       'eslint': {
    \         'sourceName': 'eslint',
    \         'command': 'eslint_d',
    \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
    \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
    \         'formatLines': 1,
    \         'formatPattern': [
    \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
    \           {
    \             'line': 1,
    \             'column': 2,
    \             'message': [4, ' [', 5, ']' ],
    \             'security': 3
    \           }
    \         ],
    \         'securities': {
    \            'error': 'error',
    \            'warning': 'warning'
    \         },
    \       },
    \       'vint': {
    \         'sourceName': 'vint',
    \         'command': 'vint',
    \         'args': ['--stdin-display-name', '%filename', '-'],
    \         'formatPattern': [
    \           '[^:]+:(\d+):(\d+):\s*(.*$)',
    \           {
    \             'line': 1,
    \             'column': 2,
    \             'message': 3
    \           }
    \         ]
    \       },
    \     },
    \     'filetypes': {
    \       'javascript': 'eslint',
    \       'javascript.tsx': 'eslint',
    \       'javascriptreact': 'eslint',
    \       'typescript': 'eslint',
    \       'typescript.tsx': 'eslint',
    \       'typescriptreact': 'eslint',
    \       'vim': 'vint',
    \     },
    \     'formatters': {
    \       'eslint': {
    \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
    \         'command': 'eslint_d',
    \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=%filename'],
    \         'isStdout': v:true,
    \         'isStderr': v:true,
    \       }
    \     },
    \     'formatFiletypes': {
    \       'javascript': 'eslint',
    \       'javascript.tsx': 'eslint',
    \       'javascriptreact': 'eslint',
    \       'typescript': 'eslint',
    \       'typescript.tsx': 'eslint',
    \       'typescriptreact': 'eslint',
    \     }
    \   } }
    \ })
  endfunction

  autocmd! vimrc User lamp#text_document_did_open call s:on_lamp_text_document_did_open()
  function! s:on_lamp_text_document_did_open() abort
    setlocal signcolumn=yes
    setlocal omnifunc=lamp#complete
    nnoremap <buffer> gf<CR>       :<C-u>LampDefinition edit<CR>
    nnoremap <buffer> gfs          :<C-u>LampDefinition split<CR>
    nnoremap <buffer> gfv          :<C-u>LampDefinition vsplit<CR>
    nnoremap <buffer> gft<CR>      :<C-u>LampTypeDefinition edit<CR>
    nnoremap <buffer> gfts         :<C-u>LampTypeDefinition split<CR>
    nnoremap <buffer> gftv         :<C-u>LampTypeDefinition vsplit<CR>
    nnoremap <buffer> gfd<CR>      :<C-u>LampDeclaration edit<CR>
    nnoremap <buffer> gfds         :<C-u>LampDeclaration split<CR>
    nnoremap <buffer> gfdv         :<C-u>LampDeclaration vsplit<CR>
    nnoremap <buffer> gfi<CR>      :<C-u>LampImplementation edit<CR>
    nnoremap <buffer> gfis         :<C-u>LampImplementation split<CR>
    nnoremap <buffer> gfiv         :<C-u>LampImplementation vsplit<CR>
    nnoremap <buffer> <Leader>i    :<C-u>LampHover<CR>
    nnoremap <buffer> <Leader>r    :<C-u>LampRename<CR>
    nnoremap <buffer> <Leader>g    :<C-u>LampReferences<CR>
    nnoremap <buffer> @            :<C-u>LampDocumentHighlight<CR>

    nnoremap <buffer> <Leader>f    :<C-u>LampFormatting<CR>
    vnoremap <buffer> <Leader>f    :LampRangeFormatting<CR>

    nnoremap <buffer> <Leader><CR> :<C-u>LampCodeAction<CR>
    vnoremap <buffer> <Leader><CR> :LampCodeAction<CR>

    nnoremap <buffer> <C-k>        :<C-u>LampDiagnosticsPrev<CR>
    nnoremap <buffer> <C-j>        :<C-u>LampDiagnosticsNext<CR>
  endfunction
endif

let s:lua_library = {}
let s:lua_library[expand('$VIMRUNTIME/lua')] = v:true

if dein#tap('coc.nvim') && s:config.lsp ==# 'coc'
  vmap     <Leader><CR>     <Plug>(coc-codeaction-selected)
  nmap     <Leader><CR>     <Plug>(coc-codeaction)
  nmap     <Leader>r        <Plug>(coc-rename)
  nmap     <Leader>g        <Plug>(coc-references)
  nmap     <Leader>f        <Plug>(coc-format)
  nmap     gf<CR>           <Plug>(coc-definition)
  nmap     gfv              :<C-u>vsplit<CR><Plug>(coc-definition)
  nmap     gfs              :<C-u>split<CR><Plug>(coc-definition)
  nmap     gi               <Plug>(coc-codelens-action)
  nnoremap <Leader>i        :<C-u>call CocAction('doHover')<CR>
  nnoremap <Leader><Leader> :<C-u>call CocAction('runCommand', 'editor.action.organizeImport')<CR>

  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  call coc#config('languageserver', {
  \   'golang': {
  \     'command': 'gopls',
  \     'rootPatterns': ['go.mod'],
  \     'disableWorkspaceFolders': v:true,
  \     'filetypes': ['go']
  \   },
  \   'sumneko_lua': {
  \     'command': expand('~/Develop/Repos/lua-language-server/bin/macOS/lua-language-server'),
  \     'args': ['-E', expand('~/Develop/Repos/lua-language-server/main.lua')],
  \     'rootPatterns': ['.git'],
  \     'filetypes': ['lua']
  \   }
  \ })
  call coc#config('diagnostic.separateRelatedInformationAsDiagnostics', v:true)
endif

if dein#tap('deol.nvim')
  let g:deol#prompt_pattern = '.\{-}\$'
  let g:deol#enable_dir_changed = 0

  autocmd! vimrc FileType deol call s:setup_deol()
  function! s:setup_deol()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s -no-dir-changed', vimrc#get_buffer_path()))<CR>
  endfunction
endif

if dein#tap('fern.vim')
  let g:fern#renderer = 'nerdfont'
  let g:fern#disable_default_mappings = v:true
  let g:fern#disable_auto_buffer_delete = 1
  let g:fern#drawer_width = 40
  let g:fern#disable_viewer_spinner = 1

  function! s:fern_open(command, helper) abort
    let l:node = a:helper.sync.get_cursor_node()
    call vimrc#open(a:command, {
    \   'filename': l:node._path,
    \ })
  endfunction
  call fern#mapping#call_function#add('edit', function('s:fern_open', ['edit']))
  call fern#mapping#call_function#add('split', function('s:fern_open', ['split']))
  call fern#mapping#call_function#add('vsplit', function('s:fern_open', ['vsplit']))

  autocmd! vimrc FileType fern call s:setup_fern()
  function! s:setup_fern() abort
    let &l:statusline = '%{getline(1)}'

    call glyph_palette#apply()

    nnoremap <silent><nowait><buffer>H           :<C-u>call FernTerminal()<CR>
    nnoremap <silent><nowait><buffer><Tab>       :<C-u>call FernSuitableMove()<CR>
    nnoremap <silent><nowait><buffer><F5>        :<C-u>call vimrc#detect_cwd()<CR>

    nmap <silent><nowait><buffer>h               <Plug>(fern-action-collapse-or-leave)
    nmap <silent><nowait><buffer>l               <Plug>(fern-action-expand)
    nmap <silent><nowait><buffer>K               <Plug>(fern-action-new-dir)
    nmap <silent><nowait><buffer>N               <Plug>(fern-action-new-file)
    nmap <silent><nowait><buffer>r               <Plug>(fern-action-rename)
    nmap <silent><nowait><buffer>D               <Plug>(fern-action-remove)
    nmap <silent><nowait><buffer>c               <Plug>(fern-action-clipboard-copy)
    nmap <silent><nowait><buffer>m               <Plug>(fern-action-clipboard-move)
    nmap <silent><nowait><buffer>p               <Plug>(fern-action-clipboard-paste)
    nmap <silent><nowait><buffer><expr><CR>      fern#smart#leaf('<Plug>(fern-action-call-function:edit)', '<Plug>(fern-action-enter)')
    nmap <silent><nowait><buffer>s               <Plug>(fern-action-call-function:split)
    nmap <silent><nowait><buffer>v               <Plug>(fern-action-call-function:vsplit)
    nmap <silent><nowait><buffer>@               <Plug>(fern-action-mark:toggle)j
    nmap <silent><nowait><buffer>,               <Plug>(fern-action-hidden-toggle)
    nmap <silent><nowait><buffer><C-l>           <Plug>(fern-action-reload)
    nmap <silent><nowait><buffer>~               :<C-u>Fern ~<CR>
    nmap <silent><nowait><buffer>\               :<C-u>Fern /<CR>
    nmap <silent><nowait><buffer><Leader><CR>    :<C-u>new \| Fern .<CR>
    nmap <silent><nowait><buffer>x              <Plug>(fern-action-open:system)

    nnoremap <silent><nowait><buffer><BS>        :<C-u>call candle#start({
    \   'mru_dir': {},
    \ }, {
    \   'action': {
    \     'default': { candle -> [
    \       execute('quit'),
    \       win_gotoid(candle.prev_winid),
    \       candle#source#mru_dir#source#touch(candle.get_action_items()[0].filename),
    \       execute(printf('Fern %s', candle.get_action_items()[0].filename))
    \     ] }
    \   }
    \ })<CR>
  endfunction

  nnoremap <F2> :<C-u>call FernStart()<CR>
  function! FernStart()
    if &filetype ==# 'fern'
      return
    endif

    let path = fnameescape(expand('%:p:h'))
    let winnrs = filter(range(1, tabpagewinnr(tabpagenr(), '$')), { i, wnr -> getbufvar(winbufnr(wnr), '&filetype') ==# 'fern' })
    if len(winnrs) > 0
      let choise = choosewin#start(winnrs, { 'auto_choose': 1, 'blink_on_land': 0, 'noop': 1 })
      if len(choise) > 0
        execute printf('%swincmd w', choise[1])
        execute printf('Fern %s', path)
      endif
    else
      execute printf('Fern %s -drawer', path)
    endif
  endfunction

  function! FernSuitableMove()
    let current = b:fern.root._path
    let cwd = vimrc#path(vimrc#get_cwd())
    let root = vimrc#path(vimrc#get_project_root(current))

    if current == cwd || !vimrc#is_parent_path(cwd, current)
      execute printf('Fern %s', root)
      return
    endif
    execute printf('Fern %s', cwd)
  endfunction

  function! FernTerminal()
    let l:cwd = b:fern.root._path
    if !exists('t:deol') || bufwinnr(get(t:deol, 'bufnr', -1)) == -1
      topleft 12split
      setlocal winfixheight
      call deol#start(printf('-cwd=%s -no-dir-changed', l:cwd))
    else
      let t:deol['cwd'] = ''
      call deol#start(printf('-cwd=%s -no-dir-changed', l:cwd))
    endif
  endfunction
endif

try
  let g:codedark_conservative = 1
  execute printf('colorscheme %s', g:colorscheme.name)
catch /.*/
  colorscheme ron
endtry

if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.colorscheme = empty(get(g:colorscheme, 'lightline', '')) ? g:colorscheme.name : g:colorscheme.lightline
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1

  let g:lightline.active = {}
  let g:lightline.active.left = [['mode', 'readonly', 'modified'], ['filename']]
  let g:lightline.active.right = [['lineinfo', 'percent', 'filetype']]
  let g:lightline.inactive = g:lightline.active
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }

  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

  let g:lightline.component_function = {}
endif

if dein#tap('vim-gitto')
  let g:gitto#config = {}
  let g:gitto#config.get_buffer_path = function('vimrc#get_buffer_path')
endif

if dein#tap('lspkind-nvim')
  lua require'lspkind'.init({ with_text = false })
endif

if dein#tap('denite.nvim')
  autocmd! vimrc FileType denite call s:setup_denite()
  function! s:setup_denite()
    if has('nvim')
      setlocal winhighlight=Normal:NormalFloat,EndOfBuffer:NormalFloat
    endif
    nnoremap <silent><buffer><expr>i     denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>a     denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>q     denite#do_map('quit')
    nnoremap <silent><buffer><expr><Esc> denite#do_map('quit')
    nnoremap <silent><buffer><expr><Tab> denite#do_map('choose_action')
    nnoremap <silent><buffer><expr><C-l> denite#do_map('redraw')
    nnoremap <silent><buffer><expr><C-h> denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr><CR>  denite#do_map('do_action')
    nnoremap <silent><buffer><expr>o     denite#do_map('do_action', 'edit')
    nnoremap <silent><buffer><expr>v     denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr>s     denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr>n     denite#do_map('do_action', 'new')
    nnoremap <silent><buffer><expr>d     denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr>p     denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr>*     denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr>@     denite#do_map('toggle_select') . 'j'
  endfunction

  autocmd! vimrc FileType denite-filter call s:setup_denite_filter()
  function! s:setup_denite_filter()
    call compe#setup({
    \   'enabled': v:false
    \ }, 0)
    let b:lexima_disabled = v:true
    imap <silent><buffer><Esc> <Plug>(denite_filter_quit)
    nnoremap <silent><buffer><Esc> :<C-u>p<CR>
  endfunction

  " filter custom
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))
  call denite#custom#source('file/rec,file/old', 'converters', ['converter/abbr_word'])

  " sorter
  call denite#custom#source('file/old', 'sorters', [])
  call denite#custom#source('_', 'sorters', ['sorter/sublime'])

  " matchers
  call denite#custom#source('file/old', 'matchers', ['matcher/ignore_current_buffer', 'matcher/substring'])
  call denite#custom#source('_', 'matchers', ['matcher/substring'])

  " option.
  call denite#custom#option('_', 'winheight', 10)
  call denite#custom#option('_', 'filter_updatetime', 500)
  call denite#custom#option('_', 'highlight_matched_char', 'None')
  call denite#custom#option('_', 'highlight_matched_range', 'None')

  " edit action.
  function! s:denite_edit_action(context)
    for target in a:context['targets']
      call vimrc#open('edit', {
      \   'filename': target['action__path'],
      \   'lnum': get(target, 'action__line', -1),
      \   'col': get(target, 'action__col', -1)
      \ })
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer,gitto/status', 'edit', function('s:denite_edit_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " split action.
  function! s:denite_split_action(context)
    for target in a:context['targets']
      call vimrc#open('new', {
      \   'filename': target['action__path'],
      \   'lnum': get(target, 'action__line', -1),
      \   'col': get(target, 'action__col', -1)
      \ })
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer,gitto/status', 'split', function('s:denite_split_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " vsplit action.
  function! s:denite_vsplit_action(context)
    for target in a:context['targets']
      call vimrc#open('vnew', {
      \   'filename': target['action__path'],
      \   'lnum': get(target, 'action__line', -1),
      \   'col': get(target, 'action__col', -1)
      \ })
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer,gitto/status', 'vsplit', function('s:denite_vsplit_action'), { 'is_quit': v:true, 'is_redraw': v:false })
  
  if dein#tap('vim-qfreplace')
    function! s:denite_qfreplace_action(context)
      let qflist = []
      for target in a:context['targets']
        if !has_key(target, 'action__path') | continue | endif
        if !has_key(target, 'action__line') | continue | endif
        if !has_key(target, 'action__text') | continue | endif

        call add(qflist, {
              \ 'filename': target['action__path'],
              \ 'lnum': target['action__line'],
              \ 'text': target['action__text']
              \ })
      endfor
      call setqflist(qflist)
      call qfreplace#start('')
    endfunction
    call denite#custom#action('file', 'qfreplace', function('s:denite_qfreplace_action'))
  endif

  " delete action
  if dein#tap('vim-denite-gitto')
    function! s:denite_delete_action(context)
      if index(['y', 'ye', 'yes'], input('delete?(yes/no): ')) >= 0
        for target in a:context['targets']
          call delete(target['action__path'], 'rf')
        endfor
      endif
    endfunction
    call denite#custom#action('gitto/status', 'delete', function('s:denite_delete_action'), { 'is_quit': v:false, 'is_redraw': v:true })
  endif
  if dein#tap('vim-gitto') && dein#tap('vim-denite-gitto')
    nnoremap <Leader><BS> :<C-u>DeniteGitto gitto<CR>
  endif
endif

autocmd! vimrc BufRead * call s:on_buf_read()
function! s:on_buf_read()
  echomsg 'aiueo'
  for [k, v] in items({
  \   '.*\.d\.ts$': { 'filetype': 'typescript.dts' },
  \   '.*\.log$': { 'filetype': 'text', 'tabstop': 8 },
  \   '.*\.tpl$': { 'filetype': 'html' },
  \   '.*\.vim$': { 'filetype': 'vim' },
  \   '.*\.zig$': { 'filetype': 'zig' },
  \   '.*\.purs$': { 'filetype': 'purescript' },
  \ })
    if bufname('%') =~ k
      for [l:name, l:value] in items(v)
        try
          execute printf('setlocal %s=%s', l:name, l:value)
        catch /.*/
        endtry
      endfor
    endif
  endfor

  if dein#tap('vim-findent')
    if filereadable(expand('%')) && &buftype ==# ''
      Findent --no-messages --no-warnings --chunksize=100
    endif
  endif
endfunction

autocmd! vimrc ColorScheme * call s:on_color_scheme()
function! s:on_color_scheme()
endfunction
call s:on_color_scheme()

autocmd! vimrc BufRead * call s:on_buf_read()
function! s:on_buf_read()
  if line("'\"") > 0 && line("'\"") <= line('$')
    normal! g`""
  endif
endfunction

if has('nvim')
  autocmd! vimrc TermOpen term://* call s:on_term_open()
  function! s:on_term_open()
    tnoremap <buffer><silent><Esc> <C-\><C-n>
  endfunction
else
  autocmd! vimrc TerminalOpen * call s:on_term_open()
  function! s:on_term_open()
    tnoremap <buffer><Esc> <C-w>N
  endfunction
endif

autocmd! vimrc BufWinEnter * call s:on_buf_win_enter()
function! s:on_buf_win_enter()
  if &previewwindow
    setlocal wrap
  endif
endfunction

autocmd! vimrc OptionSet diff call s:on_option_set_diff()
function! s:on_option_set_diff() abort
  nnoremap <buffer> <Leader>n ]czz
  nnoremap <buffer> <Leader>p [czz
endfunction

if s:config.lsp ==# 'nvim'
lua <<EOF
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  local on_init = function(client)
    client.config.flags = {}
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
  end

  require'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_init = on_init;
    init_options = {
      usePlaceholders = true,
    }
  }
  require'lspconfig'.vimls.setup {
    on_init = on_init;
    capabilities = capabilities,
  }
  require'lspconfig'.tsserver.setup {
    on_init = on_init;
    capabilities = capabilities,
  }
  require'lspconfig'.rust_analyzer.setup {
    on_init = on_init;
    capabilities = capabilities,
  }
  require'lspconfig'.pyls.setup {
    on_init = on_init;
    capabilities = capabilities,
  }
  require'lspconfig'.clangd.setup {
    on_init = on_init;
    capabilities = capabilities,
  }
  require'lspconfig'.purescriptls.setup {}
  require'lspconfig'.jdtls.setup {
    cmd_env = {
      JAR = vim.fn.expand('~/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'),
      GRADLE_HOME = vim.fn.expand('~/gradle'),
      JDTLS_CONFIG = vim.fn.expand('~/eclipse.jdt.ls/config_mac'),
    }
  }
  require'lspconfig'.sumneko_lua.setup {
    on_init = on_init;
    capabilities = capabilities,
    cmd = {
      vim.fn.expand('~/Develop/Repos/lua-language-server/bin/macOS/lua-language-server'),
      "-E",
      vim.fn.expand('~/Develop/Repos/lua-language-server/main.lua'),
    };
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  }
  vim.lsp.set_log_level("debug")
EOF
  nnoremap <silent> gf<CR>       <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <Leader>i    <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <Leader>g    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <Leader>f    <cmd>lua vim.lsp.buf.formatting()<CR>
  nnoremap <silent> <Leader>r    <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> <Leader><CR> <cmd>lua vim.lsp.buf.code_action()<CR>
endif

" NOTE: Remove `vim-lsp` from runtimepath.
if s:config.lsp ==# 'lcn'
  let g:LanguageClient_serverCommands = {
  \ 'go': ['gopls'],
  \ 'vim': ['vim-language-server', '--stdio'],
  \ }
  set omnifunc=LanguageClient#complete
endif

