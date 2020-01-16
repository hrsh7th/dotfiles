" vint: -ProhibitSetNoCompatible

if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  set nocompatible
endif

let $MYVIMRC = resolve($MYVIMRC)

let s:config = {
      \   'lsp': 'lamp'
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
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('cohama/lexima.vim')
  call dein#add('delphinus/vim-auto-cursorline')
  call dein#add('gruvbox-community/gruvbox')
  call dein#add('h4kst3r/php-awesome-snippets', { 'merged': 0 })
  call dein#add('haya14busa/vim-asterisk')
  call dein#add('hrsh7th/asyncomplete-lamp')
  call dein#add('hrsh7th/denite-converter-prioritize-basename')
  call dein#add('hrsh7th/vim-denite-gitto')
  call dein#add('hrsh7th/vim-effort-gf')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('hrsh7th/vim-lamp')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('lambdalisue/suda.vim')
  call dein#add('lambdalisue/trea.vim')
  call dein#add('lambdalisue/vim-backslash')
  call dein#add('lambdalisue/vim-findent')
  call dein#add('machakann/vim-sandwich')
  call dein#add('microsoft/vscode-python', { 'merged': 0 })
  call dein#add('natebosch/vim-lsc')
  call dein#add('neoclide/denite-extra')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/asyncomplete-file.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('previm/previm')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('t9md/vim-choosewin')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-themis')
  call dein#add('tweekmonster/helpful.vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('vim-jp/vital.vim')

  call dein#local('~/Development/workspace/LocalVimPlugins')
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
set updatetime=500
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
set nonumber
set cursorline
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
set ambiwidth=double
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

if has('nvim')
  set wildoptions=pum
  set scrollback=2000
  set clipboard=unnamedplus
  set fillchars+=vert:\ ,eob:\ 
  set inccommand=split
else
  set clipboard=unnamed
  set fillchars+=vert:\ 
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
      \ 'nohlsearch',
      \ dein#tap('vim-lamp') ? 'call lamp#feature#document_highlight#clear()' : 'nohlsearch',
      \ 'redraw!')

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

if dein#tap('defx.nvim')
  nnoremap <F2> :<C-u>call DefxOpen()<CR>
  function! DefxOpen()
    let path = expand('%:p:h')
    let winnrs = filter(range(1, tabpagewinnr(tabpagenr(), '$')), { i, wnr -> getbufvar(winbufnr(wnr), '&filetype') ==# 'defx' })
    if len(winnrs) > 0
      let choise = choosewin#start(winnrs, { 'auto_choose': 1, 'blink_on_land': 0, 'noop': 1 })
      if len(choise) > 0
        execute printf('%swincmd w', choise[1])
        call defx#call_action('cd', [path])
      endif
    else
      Defx -split=vertical -direction=topleft -winwidth=40 -session-file=`expand('~/.defx_session')` `expand('%:p:h')`
    endif
  endfunction
endif

if dein#tap('vim-effort-gf')
  nnoremap gf<CR> :<C-u>EffortGF<CR>
  nnoremap gfv    :<C-u>vertical EffortGF<CR>
  nnoremap gfs    :<C-u>belowright EffortGF<CR>
endif

if dein#tap('denite.nvim') && dein#tap('vim-gitto') && dein#tap('vim-denite-gitto')
  nnoremap <Leader><BS> :<C-u>DeniteGitto gitto<CR>
endif

if dein#tap('open-browser.vim')
  nmap <Leader><Leader><CR> <Plug>(openbrowser-smart-search)
endif

if dein#tap('denite.nvim')
  nnoremap <BS> :<C-u>Denite file/old<CR>
  nnoremap <expr><F3> printf(':<C-u>Denite file/rec:%s<CR>', vimrc#get_cwd())
  nnoremap <expr>gr printf(':<C-u>Denite -no-empty grep:%s<CR>', vimrc#get_cwd())
  nnoremap <Leader>0 :<C-u>Denite menu<CR>
  vnoremap <Leader>0 :<C-u>Denite menu<CR>
  nnoremap <Leader>m :<C-u>Denite -resume<CR>
  nnoremap <Leader>n :<C-u>Denite -resume -immediately -cursor-pos=+1 -no-empty<CR>
  nnoremap <Leader>p :<C-u>Denite -resume -immediately -cursor-pos=-1 -no-empty<CR>
endif

if dein#tap('dein.vim')
  let g:dein#install_log_filename = '~/dein.log'
endif

if dein#tap('lexima.vim')
  let g:lexima_nvim_accept_pum_with_enter = v:false
  let g:lexima_no_default_rules = v:true
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

if dein#tap('vim-devicons')
  let g:webdevicons_enable_denite = v:false
endif

if dein#tap('vim-themis')
  if has('vim_starting')
    let $PATH = $PATH . ':' . dein#get('vim-themis').rtp . '/bin'
    let $THEMIS_VIM = 'nvim'
  endif
endif

if dein#tap('vim-locon')
  call locon#def('ignore_globs', ['.git/', '.svn/', 'img/', 'image/', 'images/', '*.gif', '*.jpg', '*.jpeg', '*.png', 'vendor/', 'node_modules/', '*.po', '*.mo', '*.swf', '*.min.*', '*.map'])
  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

if dein#tap('gruvbox')
  let g:gruvbox_contrast_dark = 'medium'
  let g:gruvbox_italic = v:true
  let g:gruvbox_sign_column = 'bg0'
  let g:gruvbox_vert_split = 'bg1'
  colorscheme gruvbox
else
  colorscheme ron
endif

if dein#tap('vital.vim')
  let g:vitalizer#vital_dir = dein#get('vital.vim').rtp
endif

if dein#tap('vim-vsnip')
  let g:vsnip_snippet_dirs = [dein#get('vim-vsnip').rtp . '/misc']
  if dein#tap('lexima.vim')
    imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : lexima#expand('<LT>Tab>', 'i')
    smap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : lexima#expand('<LT>Tab>', 'i')
    imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
    smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
  else
    imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
    smap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
    imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S_Tab>', 'i')
    smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : lexima#expand('<LT>S-Tab>', 'i')
  endif
endif

if dein#tap('vim-vsnip-integ')
  let g:vsnip_integ_config = {}
  let g:vsnip_integ_config.asyncomplete = v:false
endif

if dein#tap('ncm2')
  autocmd! vimrc BufEnter * call ncm2#enable_for_buffer()
endif

if dein#tap('asyncomplete.vim')
  let g:asyncomplete_auto_popup = 1

  autocmd! vimrc User asyncomplete_setup call s:asyncomplete_setup()
  function! s:asyncomplete_setup() abort
    call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
          \   'name': 'file',
          \   'whitelist': ['*'],
          \   'priority': 10,
          \   'completor': function('asyncomplete#sources#file#completor')
          \ }))
  endfunction
endif

if dein#tap('vim-lsp') && s:config.lsp ==# 'lsp'
  let g:lsp_log_file = '/tmp/lsp.log'
  let g:lsp_async_completion = v:true

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
          \   'name': 'gopls',
          \   'cmd': { info -> ['gopls'] },
          \   'whitelist': ['go'],
          \   'root_uri': { info -> lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'go.mod')) },
          \   'initialization_options': {
          \     'usePlaceholders': v:true,
          \     'completeUnimported': v:true,
          \     'hoverKind': 'FullDocumentation'
          \   }
          \ })
    call lsp#register_server({
          \   'name': 'clangd',
          \   'cmd': { info -> ['clangd', '--background-index'] },
          \   'whitelist': ['c', 'cpp', 'objc', 'objcpp']
          \ })
    call lsp#register_server({
          \   'name': '0typescript-language-server',
          \   'cmd': { info -> ['typescript-language-server', '--stdio'] },
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

    call lsp#register_server({
          \   'name': '1diagnostic-languageserver',
          \   'cmd': ['diagnostic-languageserver', '--stdio'],
          \   'whitelist': [
          \     'typescript',
          \     'typescript.tsx',
          \     'typescriptreact',
          \     'javascript',
          \     'javascript.jsx',
          \     'javascriptreact',
          \     'vim',
          \     'vimspec'
          \   ],
          \   'initialization_options': {
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
          \   }
          \ })
  endfunction

  autocmd! vimrc User lsp_buffer_enabled call s:lsp_buffer_enabled()
  function! s:lsp_buffer_enabled() abort
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
    setlocal omnifunc=lsp#omni#complete
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
    let s:on_location = { locations -> [
          \   setqflist(locations, 'r'),
          \   execute('Denite quickfix')
          \ ] }
    let s:on_fallback = { command, position -> [
          \   cursor(position.line + 1, position.character + 1),
          \   command ==# 'vsplit' ? execute('vertical EffortGF', '') : execute('EffortGF', '')
          \ ] }

    call lamp#config('debug.log', '/tmp/lamp.log')
    call lamp#config('view.location.on_location', s:on_location)
    call lamp#config('view.location.on_fallback', s:on_fallback)
    call lamp#config('view.sign.error.text', "\uf071")
    call lamp#config('view.sign.warning.text', "\uf071")
    call lamp#config('view.sign.information.text', "\uf449")
    call lamp#config('view.sign.hint.text', "\uf400")

    call lamp#language#vim()
    call lamp#language#yaml()
    call lamp#language#php()
    call lamp#language#html()
    call lamp#language#css()
    call lamp#language#go()
    call lamp#language#python()
    call lamp#language#rust()
    call lamp#language#typescript({
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

    call lamp#register('clangd', {
          \   'command': ['clangd', '--background-index'],
          \   'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
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
    setlocal signcolumn=yes
    nnoremap <buffer> gf<CR>       :<C-u>LampDefinition edit<CR>
    nnoremap <buffer> gfs          :<C-u>LampDefinition split<CR>
    nnoremap <buffer> gfv          :<C-u>LampDefinition vsplit<CR>
    nnoremap <buffer> tgf<CR>      :<C-u>LampTypeDefinition edit<CR>
    nnoremap <buffer> tgfs         :<C-u>LampTypeDefinition split<CR>
    nnoremap <buffer> tgfv         :<C-u>LampTypeDefinition vsplit<CR>
    nnoremap <buffer> dgf<CR>      :<C-u>LampDeclaration edit<CR>
    nnoremap <buffer> dgfs         :<C-u>LampDeclaration split<CR>
    nnoremap <buffer> dgfv         :<C-u>LampDeclaration vsplit<CR>
    nnoremap <buffer> <Leader>i    :<C-u>LampHover<CR>
    nnoremap <buffer> <Leader>r    :<C-u>LampRename<CR>
    nnoremap <buffer> <Leader>g    :<C-u>LampReferences<CR>
    nnoremap <buffer> @            :<C-u>LampDocumentHighlight<CR>

    nnoremap <buffer> <Leader>f    :<C-u>LampFormatting<CR>
    vnoremap <buffer> <Leader>f    :LampRangeFormatting<CR>

    nnoremap <buffer> <Leader><CR> :<C-u>LampCodeAction<CR>
    vnoremap <buffer> <Leader><CR> :LampCodeAction<CR>
    setlocal omnifunc=lamp#complete
  endfunction
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

if dein#tap('defx.nvim')
  call defx#custom#option('_', {
        \   'columns': 'mark:indent:icons:filename:type',
        \ })

  autocmd! vimrc FileType defx call s:setup_defx()
  function! s:setup_defx() abort
    setlocal nonumber
    setlocal winfixwidth

    if has('nvim')
      setlocal winhighlight=Normal:NormalFloat,EndOfBuffer:NormalFloat
    endif

    " open
    nnoremap <silent><buffer><expr><Tab>     defx#do_action('call', 'DefxSuitableMoveAction')
    nnoremap <silent><buffer><expr><CR>      defx#do_action('open', 'DefxEditAction')
    nnoremap <silent><buffer><expr>v         defx#do_action('open', 'DefxVsplitAction')
    nnoremap <silent><buffer><expr>s         defx#do_action('open', 'DefxSplitAction')
    nnoremap <silent><buffer><expr>x         defx#do_action('execute_system')

    " move.
    nnoremap <silent><buffer><expr>h         defx#get_candidate()['level'] > 0 ? defx#do_action('close_tree') : (defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..']))
    nnoremap <silent><buffer><expr>j         'j'
    nnoremap <silent><buffer><expr>k         'k'
    nnoremap <silent><buffer><expr>l         defx#is_directory() ? defx#do_action('open_tree') . 'j' : 'l'
    nnoremap <silent><buffer><expr>~         defx#do_action('cd')
    nnoremap <silent><buffer><expr>\         defx#do_action('cd', ['/'])

    " manimpulates.
    nnoremap <silent><buffer><expr>K         defx#do_action('new_directory')
    nnoremap <silent><buffer><expr>N         defx#do_action('new_file')
    nnoremap <silent><buffer><expr>c         defx#do_action('copy')
    nnoremap <silent><buffer><expr>m         defx#do_action('move')
    nnoremap <silent><buffer><expr>D         defx#do_action('remove')
    nnoremap <silent><buffer><expr>r         defx#do_action('rename')
    nnoremap <silent><buffer><expr>p         defx#do_action('paste')

    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><BS>            :<C-u>Denite -default-action=execute defx/session defx/history<CR>
    nnoremap <silent><buffer><F5>            :<C-u>call vimrc#detect_cwd()<CR>
    nnoremap <silent><buffer><expr>.         defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><C-l>     defx#do_action('redraw')
    nnoremap <silent><buffer><Leader><CR>    :<C-u>new \| Defx -new -session-file=`expand('~/.defx_session')` `expand('%:p:h')`<CR>
    nnoremap <silent><buffer>H               :<C-u>call DefxTerminal()<CR>
  endfunction

  command! -nargs=* -range DefxEditAction call DefxOpenAction('edit', <q-args>)
  command! -nargs=* -range DefxVsplitAction call DefxOpenAction('vnew', <q-args>)
  command! -nargs=* -range DefxSplitAction call DefxOpenAction('new', <q-args>)
  function! DefxOpenAction(cmd, path)
    call vimrc#open(a:cmd, {
          \ 'path': a:path,
          \ 'line': -1,
          \ 'col': -1
          \ })
    setlocal nowinfixwidth
    setlocal nowinfixheight
  endfunction

  function! DefxSuitableMoveAction(context)
    let current = vimrc#path(b:defx.paths[0])
    let cwd = vimrc#path(vimrc#get_cwd())
    let root = vimrc#path(vimrc#get_project_root(current))

    if current == cwd || !vimrc#is_parent_path(cwd, current)
      call defx#call_action('cd', [root])
      return
    endif
    call defx#call_action('cd', [cwd])
  endfunction

  function! DefxTerminal()
    let candidate = defx#get_candidate()
    if vimrc#path(b:defx['paths'][0]) == vimrc#path(candidate['action__path'])
      let cwd = candidate['action__path']
    else
      if isdirectory(candidate['action__path'])
        let mods = ':p:h:h'
      else
        let mods = ':p:h'
      endif
      let cwd = fnamemodify(candidate['action__path'], mods)
    endif

    if !exists('t:deol') || bufwinnr(get(t:deol, 'bufnr', -1)) == -1
      topleft 12split
      setlocal winfixheight
      call deol#start(printf('-cwd=%s', cwd))
    else
      let t:deol['cwd'] = ''
      call deol#start(printf('-cwd=%s', cwd))
    endif
  endfunction
endif

if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.colorscheme = 'gruvbox'
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1

  let g:lightline.active = {}
  let g:lightline.active.left = [['readonly', 'filename', 'modified']]
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
        return len(lamp#server#registry#find_by_filetype(&filetype)) > 0 ? "\u26A1" : ''
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

  " source var custom
  if executable('ag')
    call denite#custom#var('file/rec', 'command', ['ag'] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }) + ['--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }))
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  " filter custom
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))

  " converters
  call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
  call denite#custom#source('file/rec,file/old', 'converters', ['converter/prioritize_basename', 'converter/abbr_word'])

  " sorter
  call denite#custom#source('file/old', 'sorters', [])
  call denite#custom#source('_', 'sorters', ['sorter/sublime'])

  " matchers
  call denite#custom#source('file/old', 'matchers', ['matcher/ignore_current_buffer', 'matcher/substring'])
  call denite#custom#source('_', 'matchers', ['matcher/substring'])

  " option.
  call denite#custom#option('grep', 'quit', v:false)
  call denite#custom#option('_', 'winheight', 10)
  call denite#custom#option('_', 'filter_updatetime', 500)
  call denite#custom#option('_', 'highlight_matched_char', 'None')
  call denite#custom#option('_', 'highlight_matched_range', 'None')

  " menu.
  let s:menus = {}
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()']
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)

  " execute action.
  function! s:denite_execute_action(context)
    call defx#call_action('cd', [a:context['targets'][0]['action__path']])
  endfunction
  call denite#custom#action('directory', 'execute', function('s:denite_execute_action'))

  " edit action.
  function! s:denite_edit_action(context)
    for target in a:context['targets']
      call vimrc#open('edit', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
            \ })
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer,gitto/status', 'edit', function('s:denite_edit_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " split action.
  function! s:denite_split_action(context)
    for target in a:context['targets']
      call vimrc#open('new', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
            \ })
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer,gitto/status', 'split', function('s:denite_split_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " vsplit action.
  function! s:denite_vsplit_action(context)
    for target in a:context['targets']
      call vimrc#open('vnew', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
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

  " qfreplace action
  if dein#tap('vim-qfreplace')
    function! s:denite_qfreplace_action(context)
      let qflist = a:context['targets']
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__path') })
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__line') })
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__text') })
      let qflist = map(qflist, { k, v -> {
            \   'filename': v.action__path,
            \   'lnum': v.action__line,
            \   'text': v.action__text,
            \ } })
      call setqflist(qflist)
      call qfreplace#start('')
    endfunction
    call denite#custom#action('file', 'qfreplace', function('s:denite_qfreplace_action'))
  endif
endif

autocmd! vimrc FileType * call s:on_file_type()
function! s:on_file_type()
  for [k, v] in items({
        \   '.*\.d\.ts$': { 'filetype': 'typescript.dts' },
        \   '.*\.log$': { 'filetype': 'text', 'tabstop': 8 },
        \   '.*\.tpl$': { 'filetype': 'html' },
        \   '.*\.vim$': { 'filetype': 'vim', 'iskeyword': &iskeyword . ',:' }
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
else
  autocmd! vimrc TerminalOpen term://* call s:on_term_open()
endif
function! s:on_term_open()
  tnoremap <buffer><silent><Esc> <C-\><C-n>
endfunction

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

