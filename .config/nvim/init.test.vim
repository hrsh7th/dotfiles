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
  let s:installed = v:true
end

execute 'set runtimepath+=' . s:plug_dir
call plug#begin(s:plug_dir)
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()
PlugInstall | quit

" Options here.

""""""""""""""""""""""""""""""""""""""""
lua << EOF
  local lspconfig = require('lspconfig')

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<C-]>'    , '<cmd>lua vim.lsp.buf.definition()<CR>'            , opts)
    buf_set_keymap('n', 'gD'       , '<cmd>lua vim.lsp.buf.declaration()<CR>'           , opts)
    buf_set_keymap('n', 'gi'       , '<cmd>lua vim.lsp.buf.implementation()<CR>'        , opts)
    buf_set_keymap('n', 'gr'       , '<cmd>lua vim.lsp.buf.references()<CR>'            , opts)
    buf_set_keymap('n', 'gt'       , '<cmd>lua vim.lsp.buf.type_definition()<CR>'       , opts)
    buf_set_keymap('n', 'K'        , '<cmd>lua vim.lsp.buf.hover()<CR>'                 , opts)
  end

  local servers = {
    'jsonls',
    'rnix',
    'solargraph',
    'terraformls',
    'tsserver',
    'yamlls',
    'html',
    'dockerls',
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

