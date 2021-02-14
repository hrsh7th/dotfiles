if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  set nocompatible
endif

let s:plug_dir = expand('/tmp/plugged/vim-plug')
if !isdirectory(s:plug_dir)
  execute printf('!curl -fLo %s/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', s:plug_dir)
end

" execute 'set runtimepath+=' . s:plug_dir
" call plug#begin(s:plug_dir)
" Plug 'hrsh7th/nvim-compe'
" Plug 'neovim/nvim-lspconfig'
" call plug#end()
" PlugInstall | quit

set rtp+=/tmp/plugged/vim-plug/nvim-compe
set rtp+=/tmp/plugged/vim-plug/nvim-compe/after
set rtp+=/tmp/plugged/vim-plug/nvim-lspconfig
set rtp+=/tmp/plugged/vim-plug/nvim-lspconfig/after

lua << EOF
  require'lspconfig'.gopls.setup{}
  vim.o.smartcase = true
  vim.o.ignorecase = true
  vim.o.tagcase = 'smart'
	require'compe'.setup({
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = 'disable',
  source = {
    path = true,
    buffer = { ignored_filetypes = {'sql'} },
    tags = { ignored_filetypes = {'sql'} },
    vsnip = true,
    nvim_lsp = true,
    vim_dadbod_completion = true,
    nvim_lua = false,
    calc = true,
    treesitter = true
  }
})
EOF
