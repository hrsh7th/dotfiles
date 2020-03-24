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
\   'complete': 'compete',
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
if dein#load_state(s:dein.dir.install)
  call dein#begin(s:dein.dir.plugins)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('cohama/lexima.vim')
  call dein#add('haya14busa/vim-asterisk')
  call dein#add('hrsh7th/fern-mapping-call-function.vim')
  call dein#add('hrsh7th/fern-mapping-collapse-or-leave.vim')
  call dein#add('hrsh7th/vim-candle')
  call dein#add('hrsh7th/vim-compete')
  call dein#add('hrsh7th/vim-compete-lamp')
  call dein#add('hrsh7th/vim-denite-gitto')
  call dein#add('hrsh7th/vim-effort-gf')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('hrsh7th/vim-lamp')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-vital-vs')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('joshdick/onedark.vim')
  call dein#add('lambdalisue/fern.vim')
  call dein#add('lambdalisue/suda.vim')
  call dein#add('lambdalisue/vim-backslash')
  call dein#add('lambdalisue/vim-findent')
  call dein#add('machakann/vim-sandwich')
  call dein#add('previm/previm')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('t9md/vim-choosewin')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-themis')
  call dein#add('tweekmonster/helpful.vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('vim-jp/vital.vim')

  if s:config.lsp ==# 'coc'
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'master', 'build': 'npm install' })
  endif

  if s:config.lsp ==# 'lsp'
    call dein#add('prabirshrestha/async.vim', { 'merged': 0 })
    call dein#add('prabirshrestha/vim-lsp', { 'merged': 0 })
    call dein#add('prabirshrestha/asyncomplete-lsp.vim', { 'merged': 0 })
    call dein#add('prabirshrestha/asyncomplete.vim', { 'merged': 0 })
  endif

  if has('nvim')
    call dein#add('neovim/nvim-lsp', { 'merged': 0 })
  endif

  call dein#local('~/.go/src/github.com/hrsh7th/')
  call dein#local('~/Develop/LocalVimPlugins')

  call dein#end()
  call dein#save_state()
endif

call vimrc#ignore_runtime()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

augroup vimrc
  autocmd!
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $TERM = 'xterm256-color'
set termguicolors
set t_Co=256
set updatetime=200
set autoread
set hidden
set nobackup
set noswapfile
set lazyredraw
set shell=bash
set scrolloff=3
set sidescrolloff=3
set complete=w
set belloff=all
set synmaxcol=512
set undodir=~/.vimundo
set undofile
set isfname-==
set isfname+=\\
set diffopt=filler,iwhite,algorithm:histogram,indent-heuristic

set mouse=n
set termguicolors
set splitright
set splitbelow
set nowrap
set cursorline
set number
set modeline
set modelines=2
set wildmenu
set wildmode=longest:full
set wildchar=<Tab>
set pumheight=50
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

let mapleader="\<Space>"
nnoremap q :<C-u>q<CR>
nnoremap Q :<C-u>qa!<CR>
nnoremap <Leader>t :<C-u>tabclose<CR>
nnoremap <Leader>w :<C-u>w<CR>
nnoremap * *N
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
xnoremap H 20h
xnoremap J 10j
xnoremap K 10k
xnoremap L 20l

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>L :<C-u>tabnext<CR>
nnoremap <Leader>H :<C-u>tabprev<CR>

nnoremap G Gzz

nnoremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

inoremap <C-l> <Right>
inoremap <C-h> <Left>

nmap <Tab> %
xmap <Tab> %

nnoremap <Leader>*  *:<C-u>%s/<C-r>///g<C-f><Left><Left>
xnoremap <Leader>*  y:<C-u>%s/<C-r>"//g<C-f><Left><Left>
xnoremap <expr><CR> printf(':s/%s//g<C-f><Left><Left>', expand('<cword>'))

nnoremap riw ciw<C-r>0<Esc>:<C-u>let@/=@1<CR>:noh<CR>

nnoremap gj gJ

nnoremap <F5> :<C-u>call vimrc#detect_cwd()<CR>

if dein#tap('vim-asterisk')
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
  \     )
  \   },
  \ })<CR>

  " grep
  nnoremap <silent>gr :<C-u>call candle#start({
  \   'grep': {
  \     'root_path': vimrc#get_cwd(),
  \     'pattern': input('PATTERN: '),
  \   }
  \ }, {
  \   'action': {
  \     'default': 'edit/keep',
  \     'split': 'split/keep',
  \     'vsplit': 'vsplit/keep',
  \   }
  \ })<CR>

  " menu
  nnoremap <silent><Leader>0 :<C-u>call candle#start({
  \   'item': [{
  \     'id': 1,
  \     'title': 'dein#update',
  \     'command': 'call dein#update()'
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
    let g:candle.debug = '/tmp/candle.log'

    function! s:open_invoke(command, keep, candle) abort
      if !a:keep
        quit
      endif
      let l:item = a:candle.get_action_items()[0]
      call vimrc#open(a:command, l:item, win_id2win(a:candle.prev_winid))
    endfunction

    call candle#action#register({
    \   'name': 'edit',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['edit', v:false]),
    \ })
    call candle#action#register({
    \   'name': 'split',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['split', v:false]),
    \ })
    call candle#action#register({
    \   'name': 'vsplit',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['vsplit', v:false]),
    \ })

    call candle#action#register({
    \   'name': 'edit/keep',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['edit', v:true]),
    \ })
    call candle#action#register({
    \   'name': 'split/keep',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['split', v:true]),
    \ })
    call candle#action#register({
    \   'name': 'vsplit/keep',
    \   'accept': function('candle#action#location#accept_single'),
    \   'invoke': function('s:open_invoke', ['vsplit', v:true]),
    \ })

    function! s:qfreplace_invoke(candle) abort
      call setqflist(a:candle.get_action_items())
      call qfreplace#start('')
    endfunction

    call candle#action#register({
    \   'name': 'qfreplace',
    \   'accept': function('candle#action#common#expect_keys_multiple', [['filename', 'lnum', 'text']]),
    \   'invoke': function('s:qfreplace_invoke'),
    \ })
  endfunction

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
    cnoremap <silent><buffer> <Tab> <Esc>:<C-u>call candle#mapping#choose_action()<CR>
    cnoremap <silent><buffer> <C-y> <Esc>:<C-u>call candle#mapping#action('default')<CR>
    cnoremap <silent><buffer> <C-p> <Esc>:<C-u>call candle#mapping#cursor_move(-1) \| call candle#mapping#input_open()<CR>
    cnoremap <silent><buffer> <C-n> <Esc>:<C-u>call candle#mapping#cursor_move(+1) \| call candle#mapping#input_open()<CR>
  endfunction
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
  let g:lexima_nvim_accept_pum_with_enter = v:false
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

    inoremap <expr><CR> complete_info(['selected']).selected != -1 ? "\<C-y>" : lexima#expand('<LT>CR>', 'i')
  else
    inoremap <expr><CR> complete_info(['selected']).selected != -1 ? "\<C-y>" : "\<CR>"
  endif
endif

if dein#tap('vim-vsnip')
  let g:vsnip_snippet_dirs = [dein#get('vim-vsnip').rtp . '/misc']
  if dein#tap('lexima.vim') && s:config.lexima
    imap <expr><Tab> complete_info(['selected']).selected == -1 && vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : (pumvisible() ? '<C-y>' : '') . lexima#expand('<LT>Tab>', 'i')
    smap <expr><Tab> complete_info(['selected']).selected == -1 && vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : (pumvisible() ? '<C-y>' : '') . lexima#expand('<LT>Tab>', 'i')
    imap <expr><S-Tab> vsnip#available(-1)                                            ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
    smap <expr><S-Tab> vsnip#available(-1)                                            ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
  else
    imap <expr><Tab> complete_info(['selected']).selected == -1 && vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : (pumvisible() ? '<C-y>' : '') . '<Tab>'
    smap <expr><Tab> complete_info(['selected']).selected == -1 && vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : (pumvisible() ? '<C-y>' : '') . '<Tab>'
    imap <expr><S-Tab> vsnip#available(-1)                                            ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S_Tab>', 'i')
    smap <expr><S-Tab> vsnip#available(-1)                                            ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
  endif
endif

if dein#tap('asyncomplete.vim')
  let g:asyncomplete_auto_popup = s:config.complete ==# 'asyncomplete' ? 1 : 0
endif

if dein#tap('vim-vsnip-integ')
  let g:vsnip_integ_config = {}
  let g:vsnip_integ_config.auto_expand = v:true
  let g:vsnip_integ_config.asyncomplete = s:config.complete ==# 'asyncomplete'
endif

if dein#tap('vim-compete')
  let g:compete_enable = s:config.complete ==# 'compete'
endif

if dein#tap('vim-lsp') && s:config.lsp ==# 'lsp'
  let g:lsp_log_file = '/tmp/lsp.log'
  let g:lsp_diagnostics_float_cursor = 1

  autocmd! vimrc User lsp_setup call s:lsp_setup()
  function! s:lsp_setup()
    call lsp#register_server({
    \   'name': 'vim',
    \   'cmd': { info -> ['vim-language-server', '--stdio'] },
    \   'whitelist': ['vim', 'vimspec'],
    \   'initialization_options': {
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'json-languageserver',
    \   'cmd': { info -> ['json-languageserver', '--stdio'] },
    \   'whitelist': ['json'],
    \   'config': {
    \     'refresh_pattern': '\("\k*\|\[\|\k\+\)$'
    \   },
    \   'workspace_config': {
    \     'json': {
    \       'schemas': json_decode(join(readfile(lamp#config('global.root') . '/misc/json/catalog.json'), "\n")).schemas,
    \       'format': {
    \         'enable': v:true
    \       }
    \     }
    \   },
    \ })
    call lsp#register_server({
    \   'name': 'gopls',
    \   'cmd': { info -> ['gopls'] },
    \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['go.mod'])) },
    \   'whitelist': ['go'],
    \   'initialization_options': {
    \     'usePlaceholders': v:false,
    \     'completeUnimported': v:true,
    \     'hoverKind': 'FullDocumentation'
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'rust-analyzer',
    \   'cmd': { -> ['rust-analyzer'] },
    \   'whitelist': ['rust'],
    \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['Cargo.toml'])) }
    \ })
    call lsp#register_server({
    \   'name': '0typescript-language-server',
    \   'cmd': { info -> ['typescript-language-server', '--stdio'] },
    \   'root_uri': { -> lsp#utils#path_to_uri(lamp#findup(['tsconfig.json'])) },
    \   'whitelist': ['typescript', 'typescriptreact'],
    \   'initialization_options': {
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'clangd',
    \   'cmd': { info -> ['clangd', '-background-index'] },
    \   'whitelist': ['c', 'cpp', 'objc', 'objcpp']
    \ })
    call lsp#register_server({
    \   'name': 'intelephense',
    \   'cmd': { info -> ['intelephense', '--stdio'] },
    \   'whitelist': ['php'],
    \   'initialization_options': {
    \     'storagePath': expand('~/.cache/intelephense')
    \   }
    \ })
    call lsp#register_server({
    \   'name': 'html',
    \   'cmd': { info -> ['html-languageserver', '--stdio'] },
    \   'whitelist': ['html'],
    \   'initialization_options': {
    \     'embeddedLanguages': {
    \       'css': v:true,
    \       'html': v:true
    \     }
    \   }
    \ })
  endfunction

  autocmd! vimrc User lsp_buffer_enabled call s:lsp_buffer_enabled()
  function! s:lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#omni#complete
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
  \   'vim': ['vim-language-server', '--stdio']
  \ }
endif

if dein#tap('vim-lamp') && s:config.lsp ==# 'lamp'
  autocmd! vimrc User lamp#initialized call s:on_lamp_initialized()
  function! s:on_lamp_initialized() abort
    let s:on_location = { locations -> candle#start({
    \   'item': map(locations, { i, location -> extend(location, { 'id': i, 'title': location.filename }) })
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
    call lamp#config('feature.completion.floating_docs', v:true)
    call lamp#config('view.location.on_location', s:on_location)
    call lamp#config('view.location.on_fallback', s:on_fallback)

    call lamp#builtin#gopls()
    call lamp#builtin#vim_language_server()
    call lamp#builtin#yaml_language_server()
    call lamp#builtin#html_languageserver()
    call lamp#builtin#css_languageserver()
    call lamp#builtin#json_languageserver()
    call lamp#builtin#intelephense()

    call lamp#builtin#typescript_language_server({
    \   'filetypes': ['typescript.dts'],
    \   'capabilities': {
    \     'documentFormattingProvider': v:null,
    \     'documentRangeFormattingProvider': v:null,
    \     'documentOnTypeFormattingProvider': v:null,
    \     'completionProvider': {
    \       'triggerCharacters': [',']
    \     }
    \   }
    \ })

    call lamp#register('clangd', {
    \   'command': ['clangd', '-background-index'],
    \   'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
    \ })

    call lamp#register('rust-analyzer', {
    \   'command': ['rust-analyzer'],
    \   'filetypes': ['rust'],
    \   'root_uri': { bufnr -> lamp#findup(['Cargo.toml'], bufname(bufnr)) }
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
    \     'vimspec'
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
    \       }
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
    \       'typescriptreact': 'eslint'
    \     }
    \   } }
    \ })
  endfunction

  autocmd! vimrc User lamp#text_document_did_open call s:on_lamp_text_document_did_open()
  function! s:on_lamp_text_document_did_open() abort
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

    nnoremap <buffer> <C-n>        :<C-u>LampSelectionRangeExpand<CR>
    nnoremap <buffer> <C-p>        :<C-u>LampSelectionRangeCollapse<CR>
    vnoremap <buffer> <C-n>        :<C-u>LampSelectionRangeExpand<CR>
    vnoremap <buffer> <C-p>        :<C-u>LampSelectionRangeCollapse<CR>
  endfunction
endif

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
endif

if dein#tap('deol.nvim')
  let g:deol#prompt_pattern = '.\{-}\$'
  let g:deol#enable_dir_changed = 0

  autocmd! vimrc FileType deol call s:setup_deol()
  function! s:setup_deol()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s', vimrc#get_buffer_path()))<CR>
  endfunction
endif

if dein#tap('fern.vim')
  let g:fern#disable_default_mappings = 1
  let g:fern#drawer_width = 40

  function! s:fern_open(command, helper) abort
    let l:node = a:helper.sync.get_cursor_node()
    call vimrc#open(a:command, {
    \   'filename': l:node._path,
    \ })
  endfunction

  call fern#mapping#call_function#add('edit', function('s:fern_open', ['edit']))
  call fern#mapping#call_function#add('split', function('s:fern_open', ['split']))
  call fern#mapping#call_function#add('vsplit', function('s:fern_open', ['vsplit']))

  nnoremap <F2> :<C-u>call FernStart()<CR>

  autocmd! vimrc FileType fern call s:setup_fern()
  function! s:setup_fern() abort
    nnoremap <silent><buffer>H           :<C-u>call FernTerminal()<CR>
    nnoremap <silent><buffer><Tab>       :<C-u>call FernSuitableMove()<CR>
    nnoremap <silent><buffer><F5>        :<C-u>call vimrc#detect_cwd()<CR>

    nmap <silent><buffer>h               <Plug>(fern-action-collapse-or-leave)
    nmap <silent><buffer>l               <Plug>(fern-action-expand)
    nmap <silent><buffer>K               <Plug>(fern-action-new-dir)
    nmap <silent><buffer>N               <Plug>(fern-action-new-file)
    nmap <silent><buffer>r               <Plug>(fern-action-rename)
    nmap <silent><buffer>D               <Plug>(fern-action-remove)
    nmap <silent><buffer>c               <Plug>(fern-action-clipboard-copy)
    nmap <silent><buffer>m               <Plug>(fern-action-clipboard-move)
    nmap <silent><buffer>p               <Plug>(fern-action-clipboard-paste)
    nmap <silent><buffer><expr><CR>      fern#smart#leaf('<Plug>(fern-action-call-function:edit)', '<Plug>(fern-action-enter)')
    nmap <silent><buffer>s               <Plug>(fern-action-call-function:split)
    nmap <silent><buffer>v               <Plug>(fern-action-call-function:vsplit)
    nmap <silent><buffer>@               <Plug>(fern-action-mark-toggle)j
    nmap <silent><buffer>,               <Plug>(fern-action-hidden-toggle)
    nmap <silent><buffer><C-l>           <Plug>(fern-action-reload)
    nmap <silent><buffer>~               :<C-u>Fern ~<CR>
    nmap <silent><buffer>\               :<C-u>Fern /<CR>
    nmap <silent><buffer><Leader><CR>    :<C-u>new \| Fern .<CR>

    nnoremap <silent><buffer><BS>        :<C-u>call candle#start({
    \   'mru_dir': {},
    \ }, {
    \   'action': {
    \     'default': { candle -> [
    \       execute('quit'),
    \       win_gotoid(candle.prev_winid),
    \       execute(printf('Fern %s', candle.get_action_items()[0].filename))
    \     ] }
    \   }
    \ })<CR>
  endfunction

  function! FernStart()
    let path = expand('%:p:h')
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
      call deol#start(printf('-cwd=%s', l:cwd))
    else
      let t:deol['cwd'] = ''
      call deol#start(printf('-cwd=%s', l:cwd))
    endif
  endfunction
endif

try
  colorscheme onedark
catch /.*/
  colorscheme ron
endtry

if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.colorscheme = 'onedark'
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1

  let g:lightline.active = {}
  let g:lightline.active.left = [['readonly', 'relativepath', 'modified']]
  let g:lightline.active.right = [['lineinfo', 'percent', 'filetype', 'lamp']]
  let g:lightline.inactive = g:lightline.active
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }

  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline.right = [['git']]
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

  let g:lightline.component_function = {}
  let g:lightline.component_function.git = 'Git'
  let g:lightline.component_function.lamp = 'Lamp'

  function! Git()
    if dein#tap('vim-gitto')
      try
        return gitto#run('repo#head')
      catch /.*/
      endtry
    endif
    return 'no git'
  endfunction

  function! Lamp()
    if dein#tap('vim-lamp')
      try
        return len(lamp#server#registry#find_by_filetype(&filetype)) > 0 ? 'v' : ''
      catch /.*/
      endtry
    endif
    return ''
  endfunction
endif

if dein#tap('vim-gitto')
  let g:gitto#config = {}
  let g:gitto#config.get_buffer_path = function('vimrc#get_buffer_path')
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

autocmd! vimrc FileType * call s:on_file_type()
function! s:on_file_type()
  for [k, v] in items({
  \   '.*\.d\.ts$': { 'filetype': 'typescript.dts' },
  \   '.*\.log$': { 'filetype': 'text', 'tabstop': 8 },
  \   '.*\.tpl$': { 'filetype': 'html' },
  \   '.*\.vim$': { 'filetype': 'vim', 'iskeyword': &iskeyword . ',:' },
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
  highlight! CursorLine gui=underline guibg=NONE guifg=NONE
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

" lua require'nvim_lsp'.gopls.setup{
"       \   capabilities = {
"       \     textDocument = {
"       \       completion = {
"       \         completionItem = {
"       \           snippetSupport = true
"       \         }
"       \       }
"       \     }
"       \   },
"       \   init_options = {
"       \     usePlaceholders = true,
"       \     completeUnimported = true
"       \   }
"       \ }
" set omnifunc=v:lua.vim.lsp.omnifunc

" NOTE: Remove `vim-lsp` from runtimepath.
" let g:LanguageClient_serverCommands = {
" \ 'go': ['gopls'],
" \ 'vim': ['vim-language-server', '--stdio']
" \ }
" set omnifunc=LanguageClient#complete
" 
" let g:LanguageClient_rootMarkers = {
" \ 'go': ['go.mod'],
" \ 'rust': ['Cargo.toml'],
" \ }
