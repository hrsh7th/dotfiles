set completeopt=menuone,noinsert,noselect
set shortmess+=c

command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/profile.txt
  profile func *
  profile file *
endfunction

execute printf('set packpath+=%s', expand('~/.config/nvim/pack'))
packadd! vim-vsnip

imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

