" Disable unused plugins
let g:loaded_gzip          = 1
let g:loaded_tar           = 1
let g:loaded_tarPlugin     = 1
let g:loaded_zip           = 1
let g:loaded_zipPlugin     = 1
let g:loaded_rrhelper      = 1
let g:loaded_2html_plugin  = 1
let g:loaded_vimball       = 1
let g:loaded_vimballPlugin = 1

" Basic preferences
set termguicolors
set updatetime=300
set ttimeoutlen=10
set cmdheight=2
set shortmess+=c
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,ico-2022-jp,sjis,euc-jp,latin1
set completeopt=menuone,noinsert
set nohls
set autoread
set incsearch
set formatoptions+=mM
set display+=lastline
set ignorecase
set smartcase
set wrapscan
set showmatch
set hidden
set nobackup
set nowritebackup
set number
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set laststatus=2
set wildmenu
set wildmode=longest,full
set noshowmode
set iminsert=0
set imsearch=0
set noimdisable
set noimcmdline
set nowrap
set backspace=indent,eol,start
set lazyredraw
set shortmess& shortmess+=I
set vb t_vb=
set signcolumn=yes
set novisualbell
set directory=~/.vim/swap
if ! isdirectory($HOME.'/.vim/swap')
  call mkdir($HOME.'/.vim/swap', 'p')
endif

let s:plug_dir = expand('/tmp/plugged/vim-plug')
if !isdirectory(s:plug_dir)
  execute printf('!curl -fLo %s/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', s:plug_dir)
end

execute 'set runtimepath+=' . s:plug_dir
call plug#begin(s:plug_dir)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-yaml'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-css'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'wadackel/vim-dogrun'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern-git-status.vim'

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'
Plug 'tpope/vim-surround'
call plug#end()
PlugInstall | quit

" rainbow
let g:rainbow_active = 1

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
      \  'coc-flutter'
      \, 'coc-json'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-tsserver'
      \, 'coc-eslint'
      \, 'coc-go'
      \, 'coc-rust-analyzer'
      \, 'coc-snippets'
      \, 'coc-vetur'
      \, 'coc-clangd'
      \, 'coc-toml'
      \, 'coc-tailwindcss'
      \, 'coc-pairs'
      \ ]

syntax enable
colorscheme dogrun

" git gutter
let g:gitgutter_sign_added = '| '
let g:gitgutter_sign_modified = '| '
let g:gitgutter_sign_removed = '| '
let g:gitgutter_sign_removed_first_line = '| '
let g:gitgutter_sign_removed_above_and_below = '| '
let g:gitgutter_sign_modified_removed = '| '

" fern.vim
let g:fern#renderer = "devicons"

" fzf_preview
let g:fzf_preview_use_dev_icons = 0

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF

" lightline
let g:lightline = {
\ 'colorscheme': 'dogrun',
\ 'active': {
\   'left': [['mode', 'paste'],
\             ['branch', 'readonly', 'filename']],
\   'right': [['lineinfo'],
\             ['percent'],
\             ['cocstatus', 'cocwarning', 'cocerror'],
\             ['fileformat', 'fileencoding', 'filetype']],
\ },
\ 'component': {
\   'lineinfo': '%3l:%-2v ¶',
\ },
\ 'component_expand': {
\   'cocwarning': 'LightlineCocWarning',
\   'cocerror': 'LightlineCocError',
\ },
\ 'component_type': {
\   'cocwarning': 'warning',
\   'cocerror': 'error',
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\   'branch': 'LightlineFugitive',
\   'readonly': 'LightlineReadonly',
\   'cocstatus': 'LightlineCocStatus',
\ },
\ 'separator': { 'left': '', 'right': ''},
\ 'subseparator': { 'left': '❯', 'right': '❮'}
\ }

" Golang
au FileType go setlocal sw=4 ts=4 sts=4 noet

" Prettier
au FileType typescript,typescriptreact,javascript,css,html nmap <silent> <leader>= <Plug>(Prettier)

" Dart
let g:dart_style_guide = 2

" Keymap
let mapleader = "\<Space>"
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-f> <right>
inoremap <C-b> <left>
nmap <silent> <leader>aa  <Plug>(coc-codeaction)
nmap <silent> <leader>=   <Plug>(coc-format)
xmap <silent> <leader>=   <Plug>(coc-format-selected)
nmap <silent> <leader>rr  <Plug>(coc-rename)
nmap <silent> <leader>gg  <Plug>(coc-definition)
nmap <silent> <leader>gd  <Plug>(coc-declaration)
nnoremap <silent> <leader>gr :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> <leader>gt :<C-u>CocCommand fzf-preview.CocTypeDefinitions<CR>
nnoremap <silent> <leader>gi :<C-u>CocCommand fzf-preview.CocImplementations<CR>
nnoremap <silent> <leader>gb :<C-u>CocCommand fzf-preview.Jumps<CR>

noremap <silent> <leader>fh  :<C-u>FzfPreviewMruFiles<CR>
noremap <silent> <leader>fg  :<C-u>FzfPreviewGitFiles<CR>
noremap <silent> <leader>ff  :<C-u>FzfPreviewProjectFiles<CR>
noremap <silent> <leader>bb  :<C-u>FzfPreviewAllBuffers<CR>
noremap <silent> <leader>/   :<C-u>Rg<CR>
noremap <silent> <leader><leader> :<C-u>FzfPreviewCommandPalette<CR>
nnoremap <silent> <leader>el    :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>

nnoremap <silent> <leader>ft :Fern . -width=40 -drawer -reveal=%<CR>

noremap <silent> <leader>ww <c-w>w
noremap <silent> <leader>wh <c-w>h
noremap <silent> <leader>wl <c-w>l
noremap <silent> <leader>wj <c-w>j
noremap <silent> <leader>wk <c-w>k
noremap <silent> <leader>wd <c-w>q
noremap <silent> <leader>w/ :vsplit<CR>
noremap <silent> <leader>w- :split<CR>
noremap <silent> <leader>fs :wa<CR>
noremap <silent> <leader>qq :qa!<CR>
inoremap <expr><C-j> pumvisible() ? "<Down>" : "<C-j>"
inoremap <expr><C-k> pumvisible() ? "<Up>" : "<C-k>"
